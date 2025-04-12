import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:calm_gut/repository/message_repository/src/exceptions/exception.dart';
import 'package:calm_gut/repository/message_repository/src/models/models.dart';
import 'package:chat_api/chat_api_client.dart';

class MessageRepository {
  MessageRepository({required String chatId}) : _chatId = chatId;
  final String _chatId;

  String get chatId => _chatId;

  CollectionReference<Message> get _messages => FirebaseFirestore.instance
      .collection('chats')
      .doc(_chatId)
      .collection('messages')
      .withConverter(
        fromFirestore: Message.fromFirestore,
        toFirestore: (Message message, _) => message.toFirestore(),
      );

  DocumentReference<Map<String, dynamic>> get _chat =>
      FirebaseFirestore.instance.collection('chats').doc(_chatId);

  DocumentSnapshot<Message>? _lastMessage;
  bool _hasMoreChats = true;
  final List<List<Message>> _allPagedMessages = [];
  final StreamController<List<Message>> _messagesController =
      StreamController<List<Message>>.broadcast();

  bool get hasMoreChats => _hasMoreChats;

  Future<void> sendMessage({
    required String text,
    required String authorId,
    required String chatId,
  }) async {
    final message = Message(
      authorId: authorId,
      createdAt: Timestamp.now(),
      text: text,
    );
    try {
      final messages = _messages;
      await messages.doc().set(message);
      _chat.get().then((doc) {
        final data = doc.data();
        final int? messagesCount = data?["message_count"];
        _chat.set({"message_count": 1 + (messagesCount ?? 0)});
      });
    } on FirebaseException catch (e) {
      print('#DEBUG IN [sendMessage]#: ERROR(${e.code}): $e');
      throw FirestoreDatabaseFailure.fromCode(e.code);
    } catch (_) {
      throw FirestoreDatabaseFailure();
    }
  }

  Future<void> getResponse() async {
    final chatApiClient = ChatApiClient();
    try {
      await chatApiClient.getResponse(chatId: _chatId);
    } catch (_) {
      throw Exception("Unable to get a response");
    }
  }

  void _requestMessages() {
    var pageMessagesQuery = _messages
        .orderBy('created_at', descending: true)
        .limit(20);
    if (_lastMessage != null) {
      pageMessagesQuery = pageMessagesQuery.startAfterDocument(_lastMessage!);
    }

    if (!_hasMoreChats) return;

    var currentRequestIndex = _allPagedMessages.length;

    pageMessagesQuery.snapshots().listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        final messages = snapshot.docs.map((e) => e.data()).toList();

        final pageExists = currentRequestIndex < _allPagedMessages.length;

        if (pageExists) {
          _allPagedMessages[currentRequestIndex] = messages;
        } else {
          _allPagedMessages.add(messages);
        }

        final allMessages = _allPagedMessages.fold<List<Message>>(
          <Message>[],
          (initialValue, pageItems) => initialValue..addAll(pageItems),
        );
        _messagesController.add(allMessages);

        if (currentRequestIndex == _allPagedMessages.length - 1) {
          _lastMessage = snapshot.docs.last;
        }

        _hasMoreChats = messages.length == 20;
      }
    });
  }

  Future<void> deleteHistory() async {
    final chatApiClient = ChatApiClient();
    try {
      await chatApiClient.deleteHistory(chatId: _chatId);
    } catch (_) {
      throw Exception("Unable to get a response");
    }
  }

  Stream<List<Message>> messagesStream() {
    _requestMessages();
    return _messagesController.stream;
  }

  Future<bool> get isMessagesEmpty async {
    final querySnapshot = await _messages.limit(1).get();
    return querySnapshot.docs.isEmpty;
  }
}

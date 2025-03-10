part of 'chat_bloc.dart';

enum ChatStatus { initial, loading, success, failure }

final class ChatState extends Equatable {
  const ChatState({
    this.chat = Chat.empty,
    this.messages,
    this.status = ChatStatus.initial,
    this.hasReachedMax = false,
  });

  final Chat chat;
  final List<Message>? messages;
  final ChatStatus status;
  final bool hasReachedMax;

  ChatState copyWith({
    Chat? chat,
    List<Message>? messages,
    ChatStatus? status,
    bool? hasReachedMax,
  }) {
    return ChatState(
      chat: chat ?? this.chat,
      messages: messages ?? this.messages,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [chat, messages, status, hasReachedMax];

  @override
  String toString() =>
      'MessageState { number of messages: ${messages?.length}, status: $status, hasReachedMax: $hasReachedMax }';
}

part of 'chat_bloc.dart';

enum ChatStatus { initial, loading, success, failure, empty }

final class ChatState extends Equatable {
  const ChatState({
    this.chat = Chat.empty,
    this.messages,
    this.status = ChatStatus.initial,
    this.hasReachedMax = false,
    this.waitingResponse = false,
    this.errorGettingResponse = false,
  });

  final Chat chat;
  final List<Message>? messages;
  final ChatStatus status;
  final bool hasReachedMax;
  final bool waitingResponse;
  final bool errorGettingResponse;

  ChatState copyWith({
    Chat? chat,
    List<Message>? messages,
    ChatStatus? status,
    bool? hasReachedMax,
    bool? waitingResponse,
    bool? errorGettingResponse,
  }) {
    return ChatState(
      chat: chat ?? this.chat,
      messages: messages ?? this.messages,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      waitingResponse: waitingResponse ?? this.waitingResponse,
      errorGettingResponse: errorGettingResponse ?? this.errorGettingResponse,
    );
  }

  @override
  List<Object?> get props => [
    chat,
    messages,
    status,
    hasReachedMax,
    waitingResponse,
    errorGettingResponse,
  ];

  @override
  String toString() =>
      'MessageState { number of messages: ${messages?.length}, status: $status, hasReachedMax: $hasReachedMax, waitingResponse: $waitingResponse, errorGettingResponse: $errorGettingResponse }';
}

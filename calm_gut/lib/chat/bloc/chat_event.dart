part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

final class MessagesFetched extends ChatEvent {}

final class MessageSent extends ChatEvent {
  const MessageSent({required this.text, required this.authorId});

  final String text;
  final String authorId;

  @override
  List<Object> get props => [text, authorId];
}

final class MessagesClear extends ChatEvent {}

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:calm_gut/repository/chat_repository/chat_repository.dart';
import 'package:calm_gut/repository/message_repository/message_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';

part 'chat_event.dart';
part 'chat_state.dart';

final throttleDuration = Duration(milliseconds: 3000);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc({
    required MessageRepository messageRepository,
    required ChatRepository chatRepository,
  }) : _messageRepository = messageRepository,
       _chatRepository = chatRepository,
       super(ChatState()) {
    on<MessagesFetched>(
      _onFetched,
      // transformer: throttleDroppable(throttleDuration),
    );
    on<MessageSent>(_onSent);
    on<MessagesClear>(_onClearMessages);
  }

  final MessageRepository _messageRepository;
  final ChatRepository _chatRepository;

  Future<void> _onFetched(
    MessagesFetched event,
    Emitter<ChatState> emit,
  ) async {
    if (state.hasReachedMax) return;
    if (state.status == ChatStatus.initial) {
      if (await _messageRepository.isMessagesEmpty) {
        return emit(state.copyWith(status: ChatStatus.success, messages: []));
      }
    }
    try {
      await emit.forEach(
        _messageRepository.messagesStream(),
        onData: (messages) {
          return state.copyWith(
            status: ChatStatus.success,
            messages: messages,
            hasReachedMax: !_messageRepository.hasMoreChats,
          );
        },
      );
    } catch (_) {
      emit(state.copyWith(status: ChatStatus.failure));
    }
  }

  Future<void> _onSent(MessageSent event, Emitter<ChatState> emit) async {
    await _messageRepository.sendMessage(
      text: event.text,
      authorId: event.authorId,
      chatId: _messageRepository.chatId,
    );
    add(MessagesFetched());
    _chatRepository.updateCreatedTime(chatId: _messageRepository.chatId);
    try {
      emit(state.copyWith(waitingResponse: true));
      await _messageRepository.getResponse();
      emit(state.copyWith(waitingResponse: false));
    } catch (_) {
      emit(state.copyWith(errorGettingResponse: true));
    }
    add(MessagesFetched());
  }

  void _onClearMessages(MessagesClear event, Emitter<ChatState> emit) async {
    state.messages?.clear();
    emit(state.copyWith(status: ChatStatus.empty, messages: List.empty()));
  }
}

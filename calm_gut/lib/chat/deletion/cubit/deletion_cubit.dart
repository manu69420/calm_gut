import 'package:bloc/bloc.dart';
import 'package:calm_gut/chat/bloc/chat_bloc.dart';
import 'package:calm_gut/repository/message_repository/message_repository.dart';
import 'package:equatable/equatable.dart';

part 'deletion_state.dart';

class DeletionCubit extends Cubit<DeletionState> {
  DeletionCubit({required this.messageRepository, required this.chatBloc})
    : super(DeletionState());

  final MessageRepository messageRepository;
  final ChatBloc chatBloc;

  Future<void> deleteHistory() async {
    emit(state.copyWith(status: DeletionStatus.waiting));
    await messageRepository.deleteHistory();
    chatBloc.state.messages?.clear();
    emit(state.copyWith(status: DeletionStatus.success));
    chatBloc.add(MessagesClear());
    chatBloc.add(MessagesFetched());
  }
}

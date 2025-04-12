import 'package:bloc/bloc.dart';
import 'package:calm_gut/repository/diary_repository/diary_repository.dart';
import 'package:equatable/equatable.dart';

part 'diary_state.dart';

class DiaryCubit extends Cubit<DiaryState> {
  DiaryCubit({required DiaryRepository diaryRepository})
    : _diaryRepository = diaryRepository,
      super(DiaryLoading());

  final DiaryRepository _diaryRepository;

  void diaryChanged(String content) {
    emit(DiaryLoaded(content: content, changed: true));
  }

  Future<void> diaryFetched() async {
    try {
      emit(DiaryLoading());
      final diary = await _diaryRepository.getDiary();
      emit(DiaryLoaded(content: diary.content, changed: false));
    } catch (_) {
      if (!isClosed) emit(DiaryError());
    }
  }

  Future<void> diaryUpdated() async {
    try {
      final newDiary = Diary(content: state.content);
      await _diaryRepository.updateDiary(newDiary);
      emit(DiaryLoaded(content: state.content, changed: false));
    } catch (_) {
      emit(DiaryError());
    }
  }
}

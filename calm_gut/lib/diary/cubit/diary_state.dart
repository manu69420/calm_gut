part of 'diary_cubit.dart';

sealed class DiaryState extends Equatable {
  const DiaryState({this.content = "", this.changed = false});

  final String content;
  final bool changed;

  @override
  List<Object> get props => [content, changed];
}

final class DiaryLoading extends DiaryState {}

final class DiaryLoaded extends DiaryState {
  const DiaryLoaded({required super.content, required super.changed});
}

final class DiaryError extends DiaryState {}

part of 'deletion_cubit.dart';

enum DeletionStatus { initial, waiting, success }

final class DeletionState extends Equatable {
  const DeletionState({this.status = DeletionStatus.initial});
  final DeletionStatus status;

  @override
  List<Object> get props => [status];

  DeletionState copyWith({DeletionStatus? status}) {
    return DeletionState(status: status ?? this.status);
  }
}

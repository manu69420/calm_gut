part of 'records_bloc.dart';

enum RecordsStatus { initial, loaded, error }

final class RecordsState extends Equatable {
  const RecordsState({required this.records, required this.status});

  static const initial = RecordsState(
    records: [],
    status: RecordsStatus.initial,
  );

  final List<MedicalRecord> records;
  final RecordsStatus status;

  RecordsState copyWith({List<MedicalRecord>? records, RecordsStatus? status}) {
    return RecordsState(
      records: records ?? this.records,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [records, status];
}

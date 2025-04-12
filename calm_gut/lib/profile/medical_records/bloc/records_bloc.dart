import 'package:bloc/bloc.dart';
import 'package:calm_gut/repository/medical_repository/medical_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';

part 'records_event.dart';
part 'records_state.dart';

class RecordsBloc extends Bloc<RecordsEvent, RecordsState> {
  RecordsBloc({required MedicalRepository medicalRepository})
    : _medicalRepository = medicalRepository,
      super(RecordsState.initial) {
    on<RecordsFetched>(_onFetch);
  }
  final MedicalRepository _medicalRepository;
  final GenericText title = GenericText.pure();
  final GenericText description = GenericText.pure();

  Future<void> _onFetch(
    RecordsFetched event,
    Emitter<RecordsState> emit,
  ) async {
    await emit.forEach(
      _medicalRepository.recordsStream(),
      onData: (records) {
        return state.copyWith(
          records: List.from(records),
          status: RecordsStatus.loaded,
        );
      },
    );
  }
}

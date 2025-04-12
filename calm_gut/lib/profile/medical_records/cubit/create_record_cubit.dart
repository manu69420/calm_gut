import 'package:bloc/bloc.dart';
import 'package:calm_gut/repository/medical_repository/medical_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'create_record_state.dart';

class CreateRecordCubit extends Cubit<CreateRecordState> {
  CreateRecordCubit({required MedicalRepository medicalRepository})
    : _medicalRepository = medicalRepository,
      super(CreateRecordState());

  final MedicalRepository _medicalRepository;

  void titleChanged(String value) {
    final title = GenericText.dirty(value);
    emit(state.copyWith(title: title, isValid: Formz.validate([state.title])));
  }

  void descriptionChanged(String value) {
    final description = GenericText.dirty(value);
    emit(
      state.copyWith(
        description: description,
        isValid: Formz.validate([state.description, state.title]),
      ),
    );
  }

  Future<void> createRecord() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _medicalRepository.createMedicalRecord(
        title: state.title.value,
        description: state.description.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}

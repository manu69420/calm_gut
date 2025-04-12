part of 'create_record_cubit.dart';

final class CreateRecordState extends Equatable {
  const CreateRecordState({
    this.title = const GenericText.pure(),
    this.description = const GenericText.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
  });
  final GenericText title;
  final GenericText description;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  CreateRecordState copyWith({
    GenericText? title,
    GenericText? description,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) {
    return CreateRecordState(
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    title,
    description,
    status,
    isValid,
    errorMessage,
  ];
}

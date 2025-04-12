import 'package:authentication_repository/authentication_repository.dart';
import 'package:calm_gut/profile/medical_records/cubit/create_record_cubit.dart';
import 'package:calm_gut/repository/medical_repository/medical_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateMedicalRecord<T> extends PopupRoute {
  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => 'New Record';

  @override
  Color? get barrierColor => Colors.black.withAlpha(100);

  @override
  Duration get transitionDuration => Duration.zero;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocProvider(
              create:
                  (context) => CreateRecordCubit(
                    medicalRepository: MedicalRepository(
                      userId:
                          context
                              .read<AuthenticationRepository>()
                              .currentUser
                              .id,
                    ),
                  ),
              child: _Content(),
            ),
          ),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Create a Medical Record',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        _TitleInput(),
        _DescriptionInput(),
        ElevatedButton(
          onPressed: () {
            context.read<CreateRecordCubit>().createRecord();
            Navigator.of(context).pop();
          },
          child: Center(child: const Text("Create")),
        ),
      ],
    );
  }
}

class _DescriptionInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (CreateRecordCubit cubit) => cubit.state.errorMessage,
    );
    return TextField(
      onChanged:
          (value) =>
              context.read<CreateRecordCubit>().descriptionChanged(value),
      decoration: InputDecoration(
        hintText: 'Description',
        errorText: displayError,
      ),
    );
  }
}

class _TitleInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (CreateRecordCubit cubit) => cubit.state.errorMessage,
    );
    return TextField(
      onChanged:
          (value) => context.read<CreateRecordCubit>().titleChanged(value),
      decoration: InputDecoration(hintText: 'Title', errorText: displayError),
    );
  }
}

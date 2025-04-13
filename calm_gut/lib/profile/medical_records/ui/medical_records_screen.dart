import 'package:authentication_repository/authentication_repository.dart';
import 'package:calm_gut/profile/medical_records/bloc/records_bloc.dart';
import 'package:calm_gut/profile/medical_records/ui/create_medical_record.dart';
import 'package:calm_gut/repository/medical_repository/medical_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MedicalRecordsScreen extends StatelessWidget {
  const MedicalRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = context.read<AuthenticationRepository>().currentUser.id;
    return BlocProvider(
      lazy: false,
      create:
          (context) =>
              RecordsBloc(medicalRepository: MedicalRepository(userId: userId))
                ..add(RecordsFetched()),
      child: MedicalRecordsView(),
    );
  }
}

class MedicalRecordsView extends StatelessWidget {
  const MedicalRecordsView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        ListTile(
          title: Text(AppLocalizations.of(context)!.medicalInformation),
          leading: Icon(Icons.edit_note, color: colorScheme.secondary),
          trailing: IconButton(
            onPressed: () {
              Navigator.of(context).push(CreateMedicalRecord<void>());
            },
            icon: Icon(Icons.add, color: colorScheme.primary),
          ),
        ),
        _RecordsList(),
      ],
    );
  }
}

class _RecordsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final records = context.select((RecordsBloc bloc) => bloc.state.records);
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: records.length,
      itemBuilder: (context, index) {
        return ListTile(
          subtitle: Text(records[index].description),
          title: Text(records[index].title),
        );
      },
    );
  }
}

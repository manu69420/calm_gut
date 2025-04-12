import 'dart:ui';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:calm_gut/diary/cubit/diary_cubit.dart';
import 'package:calm_gut/repository/diary_repository/diary_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DiaryScreen extends StatelessWidget {
  const DiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = context.read<AuthenticationRepository>().currentUser.id;
    return BlocProvider(
      lazy: false,
      create:
          (context) =>
              DiaryCubit(diaryRepository: DiaryRepository(userId: userId))
                ..diaryFetched(),
      child: DiaryView(),
    );
  }
}

class DiaryView extends StatelessWidget {
  const DiaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryCubit, DiaryState>(
      builder: (context, state) {
        switch (state) {
          case DiaryLoading():
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
            );
          case DiaryError():
            return Center(child: Text("An error has occurred"));
          case DiaryLoaded(:final content):
            return _Diary(content: content);
        }
      },
    );
  }
}

class _Diary extends StatefulWidget {
  const _Diary({required this.content});

  final String content;

  @override
  State<_Diary> createState() => _DiaryState();
}

class _DiaryState extends State<_Diary> {
  final controller = TextEditingController();
  @override
  void initState() {
    controller.text = widget.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.medicalDiary),
        actions: [
          IconButton(
            onPressed:
                () async => await context.read<DiaryCubit>().diaryUpdated(),
            icon:
                context.select((DiaryCubit cubit) => cubit.state.changed)
                    ? const Icon(Icons.save)
                    : const Icon(Icons.done),
          ),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.surfaceContainer,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: TextField(
                  controller: controller,
                  onChanged: context.read<DiaryCubit>().diaryChanged,
                  selectionHeightStyle: BoxHeightStyle.max,
                  maxLines: null,
                  minLines: null,
                  keyboardType: TextInputType.multiline,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    border: InputBorder.none,
                    hintText: AppLocalizations.of(context)!.diaryHint,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

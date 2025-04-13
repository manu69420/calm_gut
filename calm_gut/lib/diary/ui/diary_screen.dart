import 'dart:ui';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:calm_gut/app/utils/router/routes.dart';
import 'package:calm_gut/diary/cubit/diary_cubit.dart';
import 'package:calm_gut/mood/popup/cubit/mood_test_cubit.dart';
import 'package:calm_gut/mood/popup/ui/mood_popup.dart';
import 'package:calm_gut/repository/diary_repository/diary_repository.dart';
import 'package:calm_gut/repository/mood_repository/models/mood_data.dart';
import 'package:calm_gut/repository/mood_repository/src/mood_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class DiaryScreen extends StatelessWidget {
  const DiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = context.read<AuthenticationRepository>().currentUser.id;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create:
              (context) =>
                  DiaryCubit(diaryRepository: DiaryRepository(userId: userId))
                    ..diaryFetched(),
        ),
        BlocProvider(
          lazy: false,
          create:
              (context) =>
                  MoodTestCubit(moodRepository: MoodRepository(userId: userId))
                    ..makeConnection()
                    ..getLastSevenMoods(),
        ),
      ],
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
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.diary)),
      body: SizedBox(
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _DiaryField(controller: controller),
                _DailyTestButton(),
                _MoodWeek(),
                const SizedBox(height: 10),
                _GutHealthScore(),
              ],
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

class _GutHealthScore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final blocState = context.read<MoodTestCubit>().state;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Gut Health Score", style: theme.textTheme.titleLarge),
          blocState.passed
              ? Text(
                "Your gut health today is: ${_getScore(blocState)}/10 ${_getEmoji(_getScore(blocState))}",
              )
              : Text("Pass the Daily Test to find your Gut Health Score"),
        ],
      ),
    );
  }

  double _getScore(MoodTestState state) {
    double result =
        state.moodScale / 5 * 0.2 +
        (1 - state.stressScale / 5) * 0.3 +
        state.nutritionScale / 5 * 0.3 +
        (1 - state.symptoms.length / GutSymptoms.values.length) * 0.2;
    return (result * 100).round() / 10;
  }

  String _getEmoji(double score) {
    if (score <= 2) return "💀";
    if (score <= 4) return "🌪️";
    if (score <= 6) return "👍";
    if (score <= 8) return "🎉";
    return "✨";
  }
}

class _DiaryField extends StatelessWidget {
  const _DiaryField({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card.filled(
      color: theme.colorScheme.surfaceContainer,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            _DiaryTitleAndSaveButton(),
            SingleChildScrollView(
              child: TextField(
                controller: controller,
                onChanged: context.read<DiaryCubit>().diaryChanged,
                selectionHeightStyle: BoxHeightStyle.max,
                maxLines: null,
                minLines: 10,
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: AppLocalizations.of(context)!.diaryHint,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DailyTestButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed:
          context.read<MoodTestCubit>().state.passed
              ? null
              : () {
                context.go(
                  Routes.moodPopup,
                  extra: context.read<MoodTestCubit>(),
                );
              },
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primaryContainer,
        foregroundColor: theme.colorScheme.onPrimaryContainer,
      ),
      child: Center(
        child: Text(
          context.read<MoodTestCubit>().state.passed
              ? "Daily Test already passed"
              : "Pass the Daily Test",
        ),
      ),
    );
  }
}

class _MoodWeek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoodTestCubit, MoodTestState>(
      builder: (context, state) {
        if (state.moods.isNotEmpty) {
          final dates = context.read<MoodTestCubit>().getLastSevenDays();
          final moods = context.read<MoodTestCubit>().state.moods;
          final theme = Theme.of(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Last 7 Days", style: theme.textTheme.titleLarge),
              ),
              Card(
                color: Theme.of(context).colorScheme.surfaceContainer,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      spacing: 10,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:
                          [
                            Column(
                              spacing: 5,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("", style: theme.textTheme.bodyMedium),
                                Text(
                                  "Mood",
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Stress",
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Food",
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Water",
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ] +
                          List.generate(7, (int index) {
                            return Column(
                              spacing: 5,
                              children: [
                                Text(dates[index].weekName),
                                Text(moods[index]?.moodEmoji ?? "  "),
                                Text(moods[index]?.stressEmoji ?? "  "),
                                Text(moods[index]?.nutritionEmoji ?? "  "),
                                Text(moods[index]?.waterEmoji ?? "  "),
                              ],
                            );
                          }),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class _DiaryTitleAndSaveButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalizations.of(context)!.medicalDiary,
          style: theme.textTheme.titleLarge,
        ),
        IconButton(
          onPressed:
              () async => await context.read<DiaryCubit>().diaryUpdated(),
          icon:
              context.select((DiaryCubit cubit) => cubit.state.changed)
                  ? const Icon(Icons.save)
                  : const Icon(Icons.done),
        ),
      ],
    );
  }
}

extension on DateTime {
  String get weekName {
    const days = ['Mon', 'Tues', 'Wed', 'Thurs', 'Fri', 'Sat', 'Sun'];
    return days[weekday - 1];
  }
}

extension on MoodData {
  String get moodEmoji {
    const emojis = ["😊(5)", "🙂(4)", "😐(3)", "😕(2)", "😞(1)"];
    return emojis[5 - moodScale];
  }

  String get stressEmoji {
    const emojis = ["😌(1)", "🙂(2)", "😐(3)", "😣(4)", "😫(5)"];
    return emojis[stressScale - 1];
  }

  String get nutritionEmoji {
    const emojis = ["🥗(5)", "🍎(4)", "🍝(3)", "🍔(2)", "🍕(1)"];
    return emojis[5 - nutritionScale];
  }

  String get waterEmoji {
    const emojis = ["🚰(1)", "🚰(2)", "🚰(3)", "🚰(4)"];
    return emojis[waterScale - 1];
  }
}

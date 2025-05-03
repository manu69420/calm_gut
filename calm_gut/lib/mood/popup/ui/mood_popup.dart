import 'package:authentication_repository/authentication_repository.dart';
import 'package:calm_gut/app/utils/router/routes.dart';
import 'package:calm_gut/mood/popup/cubit/mood_test_cubit.dart';
import 'package:calm_gut/repository/mood_repository/src/mood_repository.dart';
import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class MoodPopup extends StatelessWidget {
  const MoodPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = context.read<AuthenticationRepository>().currentUser.id;
    return BlocProvider(
      create:
          (context) =>
              MoodTestCubit(moodRepository: MoodRepository(userId: userId)),
      child: MoodPopupView(),
    );
  }
}

class MoodPopupView extends StatelessWidget {
  const MoodPopupView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25),
        child: Card(
          elevation: 2,
          color: theme.colorScheme.surfaceContainer,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.dailyTest,
                      style: theme.textTheme.headlineLarge!.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  _MoodQuestion(),
                  const SizedBox(height: 20),
                  _StressQuestion(),
                  const SizedBox(height: 20),
                  _NutritionQuestion(),
                  const SizedBox(height: 20),
                  _WaterQuestion(),
                  const SizedBox(height: 20),
                  _SymptomsQuestion(),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await context.read<MoodTestCubit>().onSubmit();
                        if (context.mounted) context.go(Routes.diary);
                      } catch (_) {}
                    },
                    child: Center(
                      child: Text(AppLocalizations.of(context)!.save),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MoodQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card.filled(
      color: theme.colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.rateMoodQuestion,
              style: theme.textTheme.headlineSmall,
            ),
            _buildRadioButton(
              AppLocalizations.of(context)!.sentimentVeryGoodText,
              5,
              context,
            ),
            _buildRadioButton(
              AppLocalizations.of(context)!.sentimentGoodText,
              4,
              context,
            ),
            _buildRadioButton(
              AppLocalizations.of(context)!.sentimentNeutralText,
              3,
              context,
            ),
            _buildRadioButton(
              AppLocalizations.of(context)!.sentimentBadText,
              2,
              context,
            ),
            _buildRadioButton(
              AppLocalizations.of(context)!.sentimentVeryBadText,
              1,
              context,
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildRadioButton(String title, int value, BuildContext context) {
    final int moodScale = context.select(
      (MoodTestCubit cubit) => cubit.state.moodScale,
    );
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(title),
      leading: Radio(
        value: value,
        groupValue: moodScale,
        onChanged: (value) {
          context.read<MoodTestCubit>().onMoodChanged(value!);
        },
      ),
    );
  }
}

class _StressQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card.filled(
      color: theme.colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.rateStressQuestion,
              style: theme.textTheme.headlineSmall,
            ),
            _buildRadioButton(
              AppLocalizations.of(context)!.noStressText,
              1,
              context,
            ),
            _buildRadioButton(
              AppLocalizations.of(context)!.slightStressText,
              2,
              context,
            ),
            _buildRadioButton(
              AppLocalizations.of(context)!.moderateStressText,
              3,
              context,
            ),
            _buildRadioButton(
              AppLocalizations.of(context)!.veryStressedText,
              4,
              context,
            ),
            _buildRadioButton(
              AppLocalizations.of(context)!.extremelyStressedText,
              5,
              context,
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildRadioButton(String title, int value, BuildContext context) {
    final stressScale = context.select(
      (MoodTestCubit cubit) => cubit.state.stressScale,
    );
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(title),
      leading: Radio(
        value: value,
        groupValue: stressScale,
        onChanged: (value) {
          context.read<MoodTestCubit>().onStressChanged(value!);
        },
      ),
    );
  }
}

class _NutritionQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card.filled(
      color: theme.colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.rateFoodQuestion,
              style: theme.textTheme.headlineSmall,
            ),
            _buildRadioButton(
              AppLocalizations.of(context)!.veryHealthyNutritionText,
              5,
              context,
            ),
            _buildRadioButton(
              AppLocalizations.of(context)!.mostlyHealthyNutritionText,
              4,
              context,
            ),
            _buildRadioButton(
              AppLocalizations.of(context)!.somewhatHealthyNutritionText,
              3,
              context,
            ),
            _buildRadioButton(
              AppLocalizations.of(context)!.notVeryHealthyNutritionText,
              2,
              context,
            ),
            _buildRadioButton(
              AppLocalizations.of(context)!.unhealthyNutritionText,
              1,
              context,
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildRadioButton(String title, int value, BuildContext context) {
    final nutritionScale = context.select(
      (MoodTestCubit cubit) => cubit.state.nutritionScale,
    );
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(title),
      leading: Radio(
        value: value,
        groupValue: nutritionScale,
        onChanged: (value) {
          context.read<MoodTestCubit>().onNutritionChanged(value!);
        },
      ),
    );
  }
}

class _WaterQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card.filled(
      color: theme.colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.rateWaterQuestion,
              style: theme.textTheme.headlineSmall,
            ),
            _buildRadioButton(
              AppLocalizations.of(context)!.waterRating1,
              1,
              context,
            ),
            _buildRadioButton(
              AppLocalizations.of(context)!.waterRating2,
              2,
              context,
            ),
            _buildRadioButton(
              AppLocalizations.of(context)!.waterRating3,
              3,
              context,
            ),
            _buildRadioButton(
              AppLocalizations.of(context)!.waterRating4,
              4,
              context,
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildRadioButton(String title, int value, BuildContext context) {
    final waterScale = context.select(
      (MoodTestCubit cubit) => cubit.state.waterScale,
    );
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(title),
      leading: Radio(
        value: value,
        groupValue: waterScale,
        onChanged: (value) {
          context.read<MoodTestCubit>().onWaterChanged(value!);
        },
      ),
    );
  }
}

class _SymptomsQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card.filled(
      color: theme.colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.selectSymptomsText,
              style: theme.textTheme.headlineSmall,
            ),
            ...List.generate(
              GutSymptoms.values.length,
              (int index) => _buildCheckbox(GutSymptoms.values[index], context),
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildCheckbox(GutSymptoms symptom, BuildContext context) {
    final symptoms = context.select(
      (MoodTestCubit cubit) => cubit.state.symptoms,
    );
    return ListTile(
      leading: Checkbox(
        value: symptoms.contains(symptom),
        onChanged: (checked) {
          context.read<MoodTestCubit>().onSymptomsChanged(symptom);
        },
      ),
      title: Text(symptom.name(context)),
    );
  }
}

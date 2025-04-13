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
                      "Daily Test",
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
                    child: Center(child: Text("Submit")),
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
              "How would you rate your mood today?",
              style: theme.textTheme.headlineSmall,
            ),
            _buildRadioButton("😊 Very Good (5)", 5, context),
            _buildRadioButton("🙂 Good (4)", 4, context),
            _buildRadioButton("😐 Neutral (3)", 3, context),
            _buildRadioButton("😕 Bad (2)", 2, context),
            _buildRadioButton("😞 Very Bad (1)", 1, context),
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
              "How stressed did you feel today?",
              style: theme.textTheme.headlineSmall,
            ),
            _buildRadioButton("😌 Not stressed at all (1)", 1, context),
            _buildRadioButton("🙂 Slightly stressed (2)", 2, context),
            _buildRadioButton("😐 Moderately stressed (3)", 3, context),
            _buildRadioButton("😣 Very stressed (4)", 4, context),
            _buildRadioButton("😫 Extremely stressed (5)", 5, context),
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
              "How healthy were your meals today?",
              style: theme.textTheme.headlineSmall,
            ),
            _buildRadioButton("🥗 Very healthy (5)", 5, context),
            _buildRadioButton("🍎 Mostly healthy (4)", 4, context),
            _buildRadioButton("🍝 Somewhat healthy (3)", 3, context),
            _buildRadioButton("🍔 Not very healthy (2)", 2, context),
            _buildRadioButton("🍕 Unhealthy (1)", 1, context),
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
              "How much water did you drink today?",
              style: theme.textTheme.headlineSmall,
            ),
            _buildRadioButton("🚰 Less than 4 glasses (1)", 1, context),
            _buildRadioButton("🚰 4-6 glasses (2)", 2, context),
            _buildRadioButton("🚰 6-8 glasses (3)", 3, context),
            _buildRadioButton("🚰 More than 8 glasses (4)", 4, context),
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
              "How much water did you drink today?",
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
      title: Text(symptom.name.toSentenceCase()),
    );
  }
}

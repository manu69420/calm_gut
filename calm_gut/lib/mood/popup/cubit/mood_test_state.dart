part of 'mood_test_cubit.dart';

enum GutSymptoms {
  bloating,
  gas,
  constipation,
  diarrhea,
  stomachPain,
  heartburn;

  String name(BuildContext context) {
    return switch (this) {
      GutSymptoms.bloating => AppLocalizations.of(context)!.bloating,
      GutSymptoms.gas => AppLocalizations.of(context)!.gas,
      GutSymptoms.constipation => AppLocalizations.of(context)!.constipation,
      GutSymptoms.diarrhea => AppLocalizations.of(context)!.diarrhea,
      GutSymptoms.stomachPain => AppLocalizations.of(context)!.stomachPain,
      GutSymptoms.heartburn => AppLocalizations.of(context)!.heartburn,
    };
  }
}

final class MoodTestState extends Equatable {
  const MoodTestState({
    this.passed = false,
    this.moodScale = 5,
    this.stressScale = 1,
    this.nutritionScale = 5,
    this.waterScale = 1,
    this.symptoms = const [],
    this.moods = const [],
  });

  final bool passed;
  final int moodScale;
  final int stressScale;
  final int nutritionScale;
  final int waterScale;
  final List<GutSymptoms> symptoms;
  final List<MoodData?> moods;

  MoodTestState copyWith({
    bool? passed,
    int? moodScale,
    int? stressScale,
    int? nutritionScale,
    int? waterScale,
    List<GutSymptoms>? symptoms,
    List<MoodData?>? moods,
  }) {
    return MoodTestState(
      passed: passed ?? this.passed,
      moodScale: moodScale ?? this.moodScale,
      stressScale: stressScale ?? this.stressScale,
      nutritionScale: nutritionScale ?? this.nutritionScale,
      waterScale: waterScale ?? this.waterScale,
      symptoms: symptoms ?? this.symptoms,
      moods: moods ?? this.moods,
    );
  }

  @override
  List<Object> get props => [
    passed,
    moodScale,
    stressScale,
    nutritionScale,
    waterScale,
    symptoms,
    moods,
  ];
}

part of 'mood_test_cubit.dart';

enum GutSymptoms {
  bloating,
  gas,
  constipation,
  diarrhea,
  stomachPain,
  heartburn,
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

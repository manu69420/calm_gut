import 'package:calm_gut/mood/popup/cubit/mood_test_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'mood_data.g.dart';

@JsonSerializable()
class MoodData {
  const MoodData({
    required this.date,
    required this.moodScale,
    required this.stressScale,
    required this.nutritionScale,
    required this.waterScale,
    required this.symptoms,
  });
  final String date;
  final int moodScale;
  final int stressScale;
  final int nutritionScale;
  final int waterScale;
  final List<GutSymptoms> symptoms;

  factory MoodData.fromJson(Map<String, dynamic> json) =>
      _$MoodDataFromJson(json);

  Map<String, dynamic> toJson() => _$MoodDataToJson(this);

  factory MoodData.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return MoodData.fromJson(data);
  }
}

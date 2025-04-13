import 'package:calm_gut/mood/popup/cubit/mood_test_cubit.dart';
import 'package:calm_gut/repository/mood_repository/models/mood_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MoodRepository {
  MoodRepository({required String userId})
    : _moodDataRecords = FirebaseFirestore.instance
          .collection('mood_data')
          .doc(userId)
          .collection('records')
          .withConverter(
            fromFirestore: MoodData.fromFirestore,
            toFirestore: (MoodData moodData, _) => moodData.toJson(),
          );
  final CollectionReference<MoodData> _moodDataRecords;

  Stream<MoodData?> streamMood() {
    return _moodDataRecords.doc(_todaysDate).snapshots().map((e) => e.data());
  }

  Future<void> setMoodData(
    int moodScale,
    int stressScale,
    int nutritionScale,
    int waterScale,
    List<GutSymptoms> symptoms,
  ) async {
    final moodData = MoodData(
      date: _todaysDate,
      moodScale: moodScale,
      stressScale: stressScale,
      nutritionScale: nutritionScale,
      waterScale: waterScale,
      symptoms: symptoms,
    );
    await _moodDataRecords.doc(_todaysDate).set(moodData);
  }

  Future<bool> todayPassed() async {
    final doc = await _moodDataRecords.doc(_todaysDate).get();
    if (doc.exists) {
      return true;
    }
    return false;
  }

  String _dateToString(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }

  String get _todaysDate {
    final date = DateTime.now();
    return _dateToString(date);
  }

  List<DateTime> _nLastDates(int n) {
    List<DateTime> dates = [];
    for (int i = 0; i < n; i++) {
      dates.add(DateTime.now().subtract(Duration(days: i)));
    }
    return dates;
  }

  Future<List<MoodData?>> lastSevenMoods() async {
    final dates = _nLastDates(7).map((e) => _dateToString(e)).toList();
    final List<MoodData?> moods = [];
    for (final date in dates) {
      final doc = await _moodDataRecords.doc(date).get();
      moods.add(doc.exists ? doc.data() : null);
    }
    return moods;
  }

  List<DateTime> lastSevenDates() {
    return _nLastDates(7);
  }
}

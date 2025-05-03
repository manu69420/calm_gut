import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:calm_gut/repository/mood_repository/models/mood_data.dart';
import 'package:calm_gut/repository/mood_repository/src/mood_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'mood_test_state.dart';

class MoodTestCubit extends Cubit<MoodTestState> {
  MoodTestCubit({required MoodRepository moodRepository})
    : _moodRepository = moodRepository,
      super(MoodTestState());

  final MoodRepository _moodRepository;

  late final StreamSubscription<MoodData?>? _moodSubscription;

  void makeConnection() async {
    _moodSubscription = _moodRepository.streamMood().listen((event) {
      emit(
        state.copyWith(
          passed: event != null,
          moodScale: event?.moodScale,
          stressScale: event?.stressScale,
          nutritionScale: event?.nutritionScale,
          waterScale: event?.waterScale,
          symptoms: event?.symptoms,
        ),
      );
    });
  }

  @override
  Future<void> close() {
    _moodSubscription?.cancel();
    return super.close();
  }

  void onMoodChanged(int value) {
    emit(state.copyWith(moodScale: value));
  }

  void onStressChanged(int value) {
    emit(state.copyWith(stressScale: value));
  }

  void onNutritionChanged(int value) {
    emit(state.copyWith(nutritionScale: value));
  }

  void onWaterChanged(int value) {
    emit(state.copyWith(waterScale: value));
  }

  void onSymptomsChanged(GutSymptoms symptom) {
    if (state.symptoms.contains(symptom)) {
      final newSymptoms = List<GutSymptoms>.from(state.symptoms);
      newSymptoms.remove(symptom);
      emit(state.copyWith(symptoms: newSymptoms));
    } else {
      final newSymptoms = List<GutSymptoms>.from(state.symptoms);
      newSymptoms.add(symptom);
      emit(state.copyWith(symptoms: newSymptoms));
    }
  }

  Future<void> onSubmit() async {
    await _moodRepository.setMoodData(
      state.moodScale,
      state.stressScale,
      state.nutritionScale,
      state.waterScale,
      state.symptoms,
    );
    emit(state.copyWith(passed: true));
  }

  Future<bool> checkIfPassed() async {
    final passed = await _moodRepository.todayPassed();
    emit(state.copyWith(passed: passed));
    return passed;
  }

  Future<void> getLastSevenMoods() async {
    final moods = await _moodRepository.lastSevenMoods();
    emit(state.copyWith(moods: moods));
  }

  List<DateTime> getLastSevenDays() {
    return _moodRepository.lastSevenDates();
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'mood_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoodData _$MoodDataFromJson(Map<String, dynamic> json) => $checkedCreate(
  'MoodData',
  json,
  ($checkedConvert) {
    final val = MoodData(
      date: $checkedConvert('date', (v) => v as String),
      moodScale: $checkedConvert('mood_scale', (v) => (v as num).toInt()),
      stressScale: $checkedConvert('stress_scale', (v) => (v as num).toInt()),
      nutritionScale: $checkedConvert(
        'nutrition_scale',
        (v) => (v as num).toInt(),
      ),
      waterScale: $checkedConvert('water_scale', (v) => (v as num).toInt()),
      symptoms: $checkedConvert(
        'symptoms',
        (v) =>
            (v as List<dynamic>)
                .map((e) => $enumDecode(_$GutSymptomsEnumMap, e))
                .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'moodScale': 'mood_scale',
    'stressScale': 'stress_scale',
    'nutritionScale': 'nutrition_scale',
    'waterScale': 'water_scale',
  },
);

Map<String, dynamic> _$MoodDataToJson(MoodData instance) => <String, dynamic>{
  'date': instance.date,
  'mood_scale': instance.moodScale,
  'stress_scale': instance.stressScale,
  'nutrition_scale': instance.nutritionScale,
  'water_scale': instance.waterScale,
  'symptoms': instance.symptoms.map((e) => _$GutSymptomsEnumMap[e]!).toList(),
};

const _$GutSymptomsEnumMap = {
  GutSymptoms.bloating: 'bloating',
  GutSymptoms.gas: 'gas',
  GutSymptoms.constipation: 'constipation',
  GutSymptoms.diarrhea: 'diarrhea',
  GutSymptoms.stomachPain: 'stomachPain',
  GutSymptoms.heartburn: 'heartburn',
};

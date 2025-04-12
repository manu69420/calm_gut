// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'medical_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecord _$MedicalRecordFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MedicalRecord', json, ($checkedConvert) {
      final val = MedicalRecord(
        id: $checkedConvert('id', (v) => v as String?),
        title: $checkedConvert('title', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$MedicalRecordToJson(MedicalRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
    };

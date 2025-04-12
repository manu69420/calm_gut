// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'diary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Diary _$DiaryFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Diary',
  json,
  ($checkedConvert) {
    final val = Diary(content: $checkedConvert('content', (v) => v as String));
    return val;
  },
);

Map<String, dynamic> _$DiaryToJson(Diary instance) => <String, dynamic>{
  'content': instance.content,
};

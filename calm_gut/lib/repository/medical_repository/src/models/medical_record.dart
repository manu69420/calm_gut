import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'medical_record.g.dart';

@JsonSerializable()
class MedicalRecord {
  const MedicalRecord({
    this.id,
    required this.title,
    required this.description,
  });

  final String? id;
  final String title;
  final String description;

  factory MedicalRecord.fromJson(Map<String, dynamic> json) =>
      _$MedicalRecordFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalRecordToJson(this);

  factory MedicalRecord.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return MedicalRecord(
      id: snapshot.id,
      title: data?['title'],
      description: data?['description'],
    );
  }

  Map<String, dynamic> toFirestore() => toJson();

  @override
  String toString() =>
      'MedicalRecord { id: $id title: $title, description: $description } ';
}

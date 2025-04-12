import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'diary.g.dart';

@JsonSerializable()
class Diary {
  const Diary({required this.content});

  final String content;

  static const empty = Diary(content: "");

  factory Diary.fromJson(Map<String, dynamic> json) => _$DiaryFromJson(json);

  Map<String, dynamic> toJson() => _$DiaryToJson(this);

  factory Diary.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Diary(content: data?['content'] ?? "");
  }

  Map<String, dynamic> toFirestore() => toJson();

  @override
  String toString() => 'Diary { content: $content }';
}

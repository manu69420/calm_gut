import 'package:calm_gut/repository/diary_repository/src/models/diary.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DiaryRepository {
  DiaryRepository({required String userId}) : _userId = userId;
  final String _userId;

  final _diaries = FirebaseFirestore.instance
      .collection('diaries')
      .withConverter(
        fromFirestore: Diary.fromFirestore,
        toFirestore: (Diary diary, _) => diary.toFirestore(),
      );

  Future<Diary> getDiary() async {
    try {
      final doc = await _diaries.doc(_userId).get();
      final diary = doc.data();
      return diary ?? Diary.empty;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updateDiary(Diary diary) async {
    try {
      await _diaries.doc(_userId).set(diary);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

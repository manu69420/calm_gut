import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/medical_record.dart';

class MedicalRepository {
  MedicalRepository({required String userId})
    : _medicalRecordsCollection = FirebaseFirestore.instance
          .collection('medical_records')
          .doc(userId)
          .collection('records')
          .withConverter(
            fromFirestore: MedicalRecord.fromFirestore,
            toFirestore: (MedicalRecord record, _) => record.toFirestore(),
          );

  final CollectionReference<MedicalRecord> _medicalRecordsCollection;

  Stream<List<MedicalRecord>> recordsStream() {
    return _medicalRecordsCollection.snapshots().map(
      (snap) => snap.docs.map((e) => e.data()).toList(),
    );
  }

  Future<void> createMedicalRecord({
    required String title,
    required String description,
  }) async {
    try {
      final newRecord = MedicalRecord(title: title, description: description);
      final newDoc = _medicalRecordsCollection.doc();
      await newDoc.set(newRecord);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> deleteMedicalRecord({required String id}) async {
    try {
      await _medicalRecordsCollection.doc(id).delete();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

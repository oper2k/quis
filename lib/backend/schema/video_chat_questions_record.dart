import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideoChatQuestionsRecord extends FirestoreRecord {
  VideoChatQuestionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  void _initializeFields() {
    _question = snapshotData['question'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('video_chat_questions');

  static Stream<VideoChatQuestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideoChatQuestionsRecord.fromSnapshot(s));

  static Future<VideoChatQuestionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => VideoChatQuestionsRecord.fromSnapshot(s));

  static VideoChatQuestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VideoChatQuestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideoChatQuestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideoChatQuestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideoChatQuestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideoChatQuestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideoChatQuestionsRecordData({
  String? question,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideoChatQuestionsRecordDocumentEquality
    implements Equality<VideoChatQuestionsRecord> {
  const VideoChatQuestionsRecordDocumentEquality();

  @override
  bool equals(VideoChatQuestionsRecord? e1, VideoChatQuestionsRecord? e2) {
    return e1?.question == e2?.question;
  }

  @override
  int hash(VideoChatQuestionsRecord? e) =>
      const ListEquality().hash([e?.question]);

  @override
  bool isValidKey(Object? o) => o is VideoChatQuestionsRecord;
}

// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InterviewParticipantStruct extends FFFirebaseStruct {
  InterviewParticipantStruct({
    DocumentReference? user,
    double? karma,
    String? role,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _user = user,
        _karma = karma,
        _role = role,
        super(firestoreUtilData);

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? val) => _user = val;
  bool hasUser() => _user != null;

  // "karma" field.
  double? _karma;
  double get karma => _karma ?? 0.0;
  set karma(double? val) => _karma = val;
  void incrementKarma(double amount) => _karma = karma + amount;
  bool hasKarma() => _karma != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;
  bool hasRole() => _role != null;

  static InterviewParticipantStruct fromMap(Map<String, dynamic> data) =>
      InterviewParticipantStruct(
        user: data['user'] as DocumentReference?,
        karma: castToType<double>(data['karma']),
        role: data['role'] as String?,
      );

  static InterviewParticipantStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? InterviewParticipantStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'user': _user,
        'karma': _karma,
        'role': _role,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user': serializeParam(
          _user,
          ParamType.DocumentReference,
        ),
        'karma': serializeParam(
          _karma,
          ParamType.double,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
      }.withoutNulls;

  static InterviewParticipantStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      InterviewParticipantStruct(
        user: deserializeParam(
          data['user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        karma: deserializeParam(
          data['karma'],
          ParamType.double,
          false,
        ),
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'InterviewParticipantStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InterviewParticipantStruct &&
        user == other.user &&
        karma == other.karma &&
        role == other.role;
  }

  @override
  int get hashCode => const ListEquality().hash([user, karma, role]);
}

InterviewParticipantStruct createInterviewParticipantStruct({
  DocumentReference? user,
  double? karma,
  String? role,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InterviewParticipantStruct(
      user: user,
      karma: karma,
      role: role,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InterviewParticipantStruct? updateInterviewParticipantStruct(
  InterviewParticipantStruct? interviewParticipant, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    interviewParticipant
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInterviewParticipantStructData(
  Map<String, dynamic> firestoreData,
  InterviewParticipantStruct? interviewParticipant,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (interviewParticipant == null) {
    return;
  }
  if (interviewParticipant.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && interviewParticipant.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final interviewParticipantData =
      getInterviewParticipantFirestoreData(interviewParticipant, forFieldValue);
  final nestedData =
      interviewParticipantData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      interviewParticipant.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInterviewParticipantFirestoreData(
  InterviewParticipantStruct? interviewParticipant, [
  bool forFieldValue = false,
]) {
  if (interviewParticipant == null) {
    return {};
  }
  final firestoreData = mapToFirestore(interviewParticipant.toMap());

  // Add any Firestore field values
  interviewParticipant.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInterviewParticipantListFirestoreData(
  List<InterviewParticipantStruct>? interviewParticipants,
) =>
    interviewParticipants
        ?.map((e) => getInterviewParticipantFirestoreData(e, true))
        .toList() ??
    [];

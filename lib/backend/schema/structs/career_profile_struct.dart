// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CareerProfileStruct extends FFFirebaseStruct {
  CareerProfileStruct({
    DocumentReference? role,
    DocumentReference? goalRole,
    int? expYears,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _role = role,
        _goalRole = goalRole,
        _expYears = expYears,
        super(firestoreUtilData);

  // "role" field.
  DocumentReference? _role;
  DocumentReference? get role => _role;
  set role(DocumentReference? val) => _role = val;
  bool hasRole() => _role != null;

  // "goal_role" field.
  DocumentReference? _goalRole;
  DocumentReference? get goalRole => _goalRole;
  set goalRole(DocumentReference? val) => _goalRole = val;
  bool hasGoalRole() => _goalRole != null;

  // "exp_years" field.
  int? _expYears;
  int get expYears => _expYears ?? 0;
  set expYears(int? val) => _expYears = val;
  void incrementExpYears(int amount) => _expYears = expYears + amount;
  bool hasExpYears() => _expYears != null;

  static CareerProfileStruct fromMap(Map<String, dynamic> data) =>
      CareerProfileStruct(
        role: data['role'] as DocumentReference?,
        goalRole: data['goal_role'] as DocumentReference?,
        expYears: castToType<int>(data['exp_years']),
      );

  static CareerProfileStruct? maybeFromMap(dynamic data) => data is Map
      ? CareerProfileStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'role': _role,
        'goal_role': _goalRole,
        'exp_years': _expYears,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'role': serializeParam(
          _role,
          ParamType.DocumentReference,
        ),
        'goal_role': serializeParam(
          _goalRole,
          ParamType.DocumentReference,
        ),
        'exp_years': serializeParam(
          _expYears,
          ParamType.int,
        ),
      }.withoutNulls;

  static CareerProfileStruct fromSerializableMap(Map<String, dynamic> data) =>
      CareerProfileStruct(
        role: deserializeParam(
          data['role'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['role'],
        ),
        goalRole: deserializeParam(
          data['goal_role'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['goal_role'],
        ),
        expYears: deserializeParam(
          data['exp_years'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CareerProfileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CareerProfileStruct &&
        role == other.role &&
        goalRole == other.goalRole &&
        expYears == other.expYears;
  }

  @override
  int get hashCode => const ListEquality().hash([role, goalRole, expYears]);
}

CareerProfileStruct createCareerProfileStruct({
  DocumentReference? role,
  DocumentReference? goalRole,
  int? expYears,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CareerProfileStruct(
      role: role,
      goalRole: goalRole,
      expYears: expYears,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CareerProfileStruct? updateCareerProfileStruct(
  CareerProfileStruct? careerProfile, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    careerProfile
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCareerProfileStructData(
  Map<String, dynamic> firestoreData,
  CareerProfileStruct? careerProfile,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (careerProfile == null) {
    return;
  }
  if (careerProfile.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && careerProfile.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final careerProfileData =
      getCareerProfileFirestoreData(careerProfile, forFieldValue);
  final nestedData =
      careerProfileData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = careerProfile.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCareerProfileFirestoreData(
  CareerProfileStruct? careerProfile, [
  bool forFieldValue = false,
]) {
  if (careerProfile == null) {
    return {};
  }
  final firestoreData = mapToFirestore(careerProfile.toMap());

  // Add any Firestore field values
  careerProfile.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCareerProfileListFirestoreData(
  List<CareerProfileStruct>? careerProfiles,
) =>
    careerProfiles
        ?.map((e) => getCareerProfileFirestoreData(e, true))
        .toList() ??
    [];

// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RatingStruct extends FFFirebaseStruct {
  RatingStruct({
    double? rating,
    int? number,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _rating = rating,
        _number = number,
        super(firestoreUtilData);

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  set rating(double? val) => _rating = val;
  void incrementRating(double amount) => _rating = rating + amount;
  bool hasRating() => _rating != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  set number(int? val) => _number = val;
  void incrementNumber(int amount) => _number = number + amount;
  bool hasNumber() => _number != null;

  static RatingStruct fromMap(Map<String, dynamic> data) => RatingStruct(
        rating: castToType<double>(data['rating']),
        number: castToType<int>(data['number']),
      );

  static RatingStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? RatingStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'rating': _rating,
        'number': _number,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'rating': serializeParam(
          _rating,
          ParamType.double,
        ),
        'number': serializeParam(
          _number,
          ParamType.int,
        ),
      }.withoutNulls;

  static RatingStruct fromSerializableMap(Map<String, dynamic> data) =>
      RatingStruct(
        rating: deserializeParam(
          data['rating'],
          ParamType.double,
          false,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'RatingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RatingStruct &&
        rating == other.rating &&
        number == other.number;
  }

  @override
  int get hashCode => const ListEquality().hash([rating, number]);
}

RatingStruct createRatingStruct({
  double? rating,
  int? number,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RatingStruct(
      rating: rating,
      number: number,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RatingStruct? updateRatingStruct(
  RatingStruct? ratingStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ratingStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRatingStructData(
  Map<String, dynamic> firestoreData,
  RatingStruct? ratingStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ratingStruct == null) {
    return;
  }
  if (ratingStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && ratingStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ratingStructData = getRatingFirestoreData(ratingStruct, forFieldValue);
  final nestedData =
      ratingStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = ratingStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRatingFirestoreData(
  RatingStruct? ratingStruct, [
  bool forFieldValue = false,
]) {
  if (ratingStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ratingStruct.toMap());

  // Add any Firestore field values
  ratingStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRatingListFirestoreData(
  List<RatingStruct>? ratingStructs,
) =>
    ratingStructs?.map((e) => getRatingFirestoreData(e, true)).toList() ?? [];

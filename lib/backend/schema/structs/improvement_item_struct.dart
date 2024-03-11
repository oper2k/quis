// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImprovementItemStruct extends FFFirebaseStruct {
  ImprovementItemStruct({
    String? title,
    String? description,
    int? sort,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _description = description,
        _sort = sort,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "sort" field.
  int? _sort;
  int get sort => _sort ?? 0;
  set sort(int? val) => _sort = val;
  void incrementSort(int amount) => _sort = sort + amount;
  bool hasSort() => _sort != null;

  static ImprovementItemStruct fromMap(Map<String, dynamic> data) =>
      ImprovementItemStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
        sort: castToType<int>(data['sort']),
      );

  static ImprovementItemStruct? maybeFromMap(dynamic data) => data is Map
      ? ImprovementItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
        'sort': _sort,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'sort': serializeParam(
          _sort,
          ParamType.int,
        ),
      }.withoutNulls;

  static ImprovementItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      ImprovementItemStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        sort: deserializeParam(
          data['sort'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ImprovementItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ImprovementItemStruct &&
        title == other.title &&
        description == other.description &&
        sort == other.sort;
  }

  @override
  int get hashCode => const ListEquality().hash([title, description, sort]);
}

ImprovementItemStruct createImprovementItemStruct({
  String? title,
  String? description,
  int? sort,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImprovementItemStruct(
      title: title,
      description: description,
      sort: sort,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ImprovementItemStruct? updateImprovementItemStruct(
  ImprovementItemStruct? improvementItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    improvementItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addImprovementItemStructData(
  Map<String, dynamic> firestoreData,
  ImprovementItemStruct? improvementItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (improvementItem == null) {
    return;
  }
  if (improvementItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && improvementItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final improvementItemData =
      getImprovementItemFirestoreData(improvementItem, forFieldValue);
  final nestedData =
      improvementItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = improvementItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getImprovementItemFirestoreData(
  ImprovementItemStruct? improvementItem, [
  bool forFieldValue = false,
]) {
  if (improvementItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(improvementItem.toMap());

  // Add any Firestore field values
  improvementItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getImprovementItemListFirestoreData(
  List<ImprovementItemStruct>? improvementItems,
) =>
    improvementItems
        ?.map((e) => getImprovementItemFirestoreData(e, true))
        .toList() ??
    [];

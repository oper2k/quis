// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiceStruct extends FFFirebaseStruct {
  ServiceStruct({
    String? name,
    double? priceKarma,
    double? price,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _priceKarma = priceKarma,
        _price = price,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "priceKarma" field.
  double? _priceKarma;
  double get priceKarma => _priceKarma ?? 0.0;
  set priceKarma(double? val) => _priceKarma = val;
  void incrementPriceKarma(double amount) => _priceKarma = priceKarma + amount;
  bool hasPriceKarma() => _priceKarma != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  static ServiceStruct fromMap(Map<String, dynamic> data) => ServiceStruct(
        name: data['name'] as String?,
        priceKarma: castToType<double>(data['priceKarma']),
        price: castToType<double>(data['price']),
      );

  static ServiceStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ServiceStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'priceKarma': _priceKarma,
        'price': _price,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'priceKarma': serializeParam(
          _priceKarma,
          ParamType.double,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
      }.withoutNulls;

  static ServiceStruct fromSerializableMap(Map<String, dynamic> data) =>
      ServiceStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        priceKarma: deserializeParam(
          data['priceKarma'],
          ParamType.double,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ServiceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ServiceStruct &&
        name == other.name &&
        priceKarma == other.priceKarma &&
        price == other.price;
  }

  @override
  int get hashCode => const ListEquality().hash([name, priceKarma, price]);
}

ServiceStruct createServiceStruct({
  String? name,
  double? priceKarma,
  double? price,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ServiceStruct(
      name: name,
      priceKarma: priceKarma,
      price: price,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ServiceStruct? updateServiceStruct(
  ServiceStruct? service, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    service
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addServiceStructData(
  Map<String, dynamic> firestoreData,
  ServiceStruct? service,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (service == null) {
    return;
  }
  if (service.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && service.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final serviceData = getServiceFirestoreData(service, forFieldValue);
  final nestedData = serviceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = service.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getServiceFirestoreData(
  ServiceStruct? service, [
  bool forFieldValue = false,
]) {
  if (service == null) {
    return {};
  }
  final firestoreData = mapToFirestore(service.toMap());

  // Add any Firestore field values
  service.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getServiceListFirestoreData(
  List<ServiceStruct>? services,
) =>
    services?.map((e) => getServiceFirestoreData(e, true)).toList() ?? [];

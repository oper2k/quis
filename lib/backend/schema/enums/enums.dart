import 'package:collection/collection.dart';

enum PaywallPrice {
  standard,
  off25,
  off50,
}

enum PaywallPickedOption {
  month1,
  month3,
  week1,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (PaywallPrice):
      return PaywallPrice.values.deserialize(value) as T?;
    case (PaywallPickedOption):
      return PaywallPickedOption.values.deserialize(value) as T?;
    default:
      return null;
  }
}

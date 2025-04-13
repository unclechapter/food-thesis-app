// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FoodorderpriceStruct extends BaseStruct {
  FoodorderpriceStruct({
    int? price,
    String? className,
  })  : _price = price,
        _className = className;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  set price(int? val) => _price = val;

  void incrementPrice(int amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "className" field.
  String? _className;
  String get className => _className ?? '';
  set className(String? val) => _className = val;

  bool hasClassName() => _className != null;

  static FoodorderpriceStruct fromMap(Map<String, dynamic> data) =>
      FoodorderpriceStruct(
        price: castToType<int>(data['price']),
        className: data['className'] as String?,
      );

  static FoodorderpriceStruct? maybeFromMap(dynamic data) => data is Map
      ? FoodorderpriceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'price': _price,
        'className': _className,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'price': serializeParam(
          _price,
          ParamType.int,
        ),
        'className': serializeParam(
          _className,
          ParamType.String,
        ),
      }.withoutNulls;

  static FoodorderpriceStruct fromSerializableMap(Map<String, dynamic> data) =>
      FoodorderpriceStruct(
        price: deserializeParam(
          data['price'],
          ParamType.int,
          false,
        ),
        className: deserializeParam(
          data['className'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FoodorderpriceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FoodorderpriceStruct &&
        price == other.price &&
        className == other.className;
  }

  @override
  int get hashCode => const ListEquality().hash([price, className]);
}

FoodorderpriceStruct createFoodorderpriceStruct({
  int? price,
  String? className,
}) =>
    FoodorderpriceStruct(
      price: price,
      className: className,
    );

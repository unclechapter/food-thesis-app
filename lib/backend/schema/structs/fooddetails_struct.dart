// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FooddetailsStruct extends BaseStruct {
  FooddetailsStruct({
    int? orderID,
    String? username,
    FoodorderdetailsStruct? foodorderdetails,
    List<String>? foodorderprice,
    String? createdAt,
  })  : _orderID = orderID,
        _username = username,
        _foodorderdetails = foodorderdetails,
        _foodorderprice = foodorderprice,
        _createdAt = createdAt;

  // "orderID" field.
  int? _orderID;
  int get orderID => _orderID ?? 0;
  set orderID(int? val) => _orderID = val;

  void incrementOrderID(int amount) => orderID = orderID + amount;

  bool hasOrderID() => _orderID != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;

  bool hasUsername() => _username != null;

  // "foodorderdetails" field.
  FoodorderdetailsStruct? _foodorderdetails;
  FoodorderdetailsStruct get foodorderdetails =>
      _foodorderdetails ?? FoodorderdetailsStruct();
  set foodorderdetails(FoodorderdetailsStruct? val) => _foodorderdetails = val;

  void updateFoodorderdetails(Function(FoodorderdetailsStruct) updateFn) {
    updateFn(_foodorderdetails ??= FoodorderdetailsStruct());
  }

  bool hasFoodorderdetails() => _foodorderdetails != null;

  // "foodorderprice" field.
  List<String>? _foodorderprice;
  List<String> get foodorderprice => _foodorderprice ?? const [];
  set foodorderprice(List<String>? val) => _foodorderprice = val;

  void updateFoodorderprice(Function(List<String>) updateFn) {
    updateFn(_foodorderprice ??= []);
  }

  bool hasFoodorderprice() => _foodorderprice != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  static FooddetailsStruct fromMap(Map<String, dynamic> data) =>
      FooddetailsStruct(
        orderID: castToType<int>(data['orderID']),
        username: data['username'] as String?,
        foodorderdetails: data['foodorderdetails'] is FoodorderdetailsStruct
            ? data['foodorderdetails']
            : FoodorderdetailsStruct.maybeFromMap(data['foodorderdetails']),
        foodorderprice: getDataList(data['foodorderprice']),
        createdAt: data['created_at'] as String?,
      );

  static FooddetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? FooddetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'orderID': _orderID,
        'username': _username,
        'foodorderdetails': _foodorderdetails?.toMap(),
        'foodorderprice': _foodorderprice,
        'created_at': _createdAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'orderID': serializeParam(
          _orderID,
          ParamType.int,
        ),
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'foodorderdetails': serializeParam(
          _foodorderdetails,
          ParamType.DataStruct,
        ),
        'foodorderprice': serializeParam(
          _foodorderprice,
          ParamType.String,
          isList: true,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static FooddetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      FooddetailsStruct(
        orderID: deserializeParam(
          data['orderID'],
          ParamType.int,
          false,
        ),
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        foodorderdetails: deserializeStructParam(
          data['foodorderdetails'],
          ParamType.DataStruct,
          false,
          structBuilder: FoodorderdetailsStruct.fromSerializableMap,
        ),
        foodorderprice: deserializeParam<String>(
          data['foodorderprice'],
          ParamType.String,
          true,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FooddetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FooddetailsStruct &&
        orderID == other.orderID &&
        username == other.username &&
        foodorderdetails == other.foodorderdetails &&
        listEquality.equals(foodorderprice, other.foodorderprice) &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([orderID, username, foodorderdetails, foodorderprice, createdAt]);
}

FooddetailsStruct createFooddetailsStruct({
  int? orderID,
  String? username,
  FoodorderdetailsStruct? foodorderdetails,
  String? createdAt,
}) =>
    FooddetailsStruct(
      orderID: orderID,
      username: username,
      foodorderdetails: foodorderdetails ?? FoodorderdetailsStruct(),
      createdAt: createdAt,
    );

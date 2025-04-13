import '../database.dart';

class OrderDetailsTable extends SupabaseTable<OrderDetailsRow> {
  @override
  String get tableName => 'OrderDetails';

  @override
  OrderDetailsRow createRow(Map<String, dynamic> data) => OrderDetailsRow(data);
}

class OrderDetailsRow extends SupabaseDataRow {
  OrderDetailsRow(super.data);

  @override
  SupabaseTable get table => OrderDetailsTable();

  int get orderID => getField<int>('orderID')!;
  set orderID(int value) => setField<int>('orderID', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  dynamic get foodorderdetails => getField<dynamic>('foodorderdetails');
  set foodorderdetails(dynamic value) =>
      setField<dynamic>('foodorderdetails', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  dynamic get foodorderprice => getField<dynamic>('foodorderprice');
  set foodorderprice(dynamic value) =>
      setField<dynamic>('foodorderprice', value);

  String? get userID => getField<String>('userID');
  set userID(String? value) => setField<String>('userID', value);
}

import '../database.dart';

class FoodClassesTable extends SupabaseTable<FoodClassesRow> {
  @override
  String get tableName => 'FoodClasses';

  @override
  FoodClassesRow createRow(Map<String, dynamic> data) => FoodClassesRow(data);
}

class FoodClassesRow extends SupabaseDataRow {
  FoodClassesRow(super.data);

  @override
  SupabaseTable get table => FoodClassesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get classField => getField<String>('class');
  set classField(String? value) => setField<String>('class', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  String? get className => getField<String>('className');
  set className(String? value) => setField<String>('className', value);
}

// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'dart:convert';

String extractFoodOrderPriceText(String jsonResponse) {
  final data = jsonDecode(jsonResponse);
  final foodOrderPrice = data['foodorderprice'];

  final priceText = foodOrderPrice.map((item) {
    final dish = item[0];
    final price = item[1];
    return '$dish: $price VND';
  }).join('\n');

  return priceText;
}

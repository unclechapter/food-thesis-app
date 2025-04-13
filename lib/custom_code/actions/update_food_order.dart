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

// Additional Imports
import 'dart:convert';

import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> updateFoodOrder(
  dynamic jsonResponse,
  String? username,
  DateTime? datetime,
  String userID,
) async {
  // Use FlutterFlow's integrated Supabase client
  final supabase = Supabase.instance.client;

  // Parse the JSON response
  final predictions = jsonResponse['predictions'];

  // Query the FoodClasses table to get the className and price data
  final foodClassesResponse =
      await supabase.from('FoodClasses').select('class, className, price');

  // Ensure the response contains valid data
  final foodClassesData = foodClassesResponse;
  if (foodClassesData == null || foodClassesData.isEmpty) {
    throw Exception('No data received from FoodClasses query.');
  }

  // Create maps for className and price lookup
  final foodClassesMap = {
    for (var row in foodClassesData) row['class']: row['className']
  };
  final foodClassesPriceMap = {
    for (var row in foodClassesData) row['className']: row['price']
  };

  // Create the foodorderprice data as a list of maps
  final foodOrderPriceData =
      predictions.map<Map<String, dynamic>>((prediction) {
    final className = foodClassesMap[prediction['class']] ?? '';
    final price = foodClassesPriceMap[className] ?? 0.0;
    return {'className': className, 'price': price};
  }).toList();

  // Insert data into the OrderDetails table
  final response = await supabase.from('OrderDetails').insert([
    {
      'username': username,
      'userID': userID,
      'foodorderdetails': jsonResponse,
      'foodorderprice': foodOrderPriceData,
      'created_at': '$datetime',
    },
  ]);
}

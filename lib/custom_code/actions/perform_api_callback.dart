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

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> performApiCallback(String url) async {
  try {
    // Make HTTP GET request to the URL
    final response = await http.get(Uri.parse(url));

    // Check if request was successful
    if (response.statusCode == 200) {
      // Parse JSON response
      final responseData = jsonDecode(response.body);
      final int returnCode = responseData['returncode'];
      final String returnMessage = responseData['returnmessage'];

      return {"returnCode": returnCode, "returnMessage": returnMessage};
    }
  } catch (e) {
    return "Error extracting order URL: $e";
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

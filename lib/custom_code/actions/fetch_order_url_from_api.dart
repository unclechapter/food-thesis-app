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
import 'dart:io';

Future<String?> fetchOrderUrlFromApi(String apiUrl) async {
  try {
    // Open the API URL and fetch its content
    final HttpClient httpClient = HttpClient();
    final Uri uri = Uri.parse(apiUrl);
    final HttpClientRequest request = await httpClient.getUrl(uri);
    final HttpClientResponse response = await request.close();

    // Check if the response is successful
    if (response.statusCode == 200) {
      // Read and decode the response
      final String responseBody = await response.transform(utf8.decoder).join();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);

      // Extract the "orderurl" field
      if (jsonResponse.containsKey('orderurl')) {
        return jsonResponse['orderurl'] as String;
      } else {
        throw Exception('The "orderurl" field is missing in the response.');
      }
    } else {
      throw Exception(
          'Failed to load API. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle errors
    print('Error: $e');
    return null;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

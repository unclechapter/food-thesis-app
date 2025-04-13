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
import 'dart:developer';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

Future<dynamic> processCallback(String apptransid) async {
  const String appid = "2554"; // Your app ID
  const String key1 = "sdngKKJmqEMzvh5QQcdD2A9XBSKUNaYn"; // Your HMAC key
  const String queryOrderUrl =
      "https://sandbox.zalopay.com.vn/v001/tpe/getstatusbyapptransid";

  try {
    // Prepare parameters
    final String data = "$appid|$apptransid|$key1";
    final keyBytes = utf8.encode(key1);
    final messageBytes = utf8.encode(data);
    final hmac = Hmac(sha256, keyBytes);
    final digest = hmac.convert(messageBytes);
    final mac =
        digest.bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();

    // Build request parameters
    final Map<String, String> param = {
      "appid": appid,
      "apptransid": apptransid,
      "mac": mac,
    };

    // Construct query string for GET request URL
    final String queryParams = param.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');

    // Build the final URL
    final String requestUrl = "$queryOrderUrl?$queryParams";

    // Return URL and apptransid for use
    final Map<String, dynamic> result = {
      "apptransid": apptransid,
      "requestUrl": requestUrl
    };

    return result;
  } catch (e) {
    // Handle errors
    throw Exception("Error querying order status: $e");
  }
}

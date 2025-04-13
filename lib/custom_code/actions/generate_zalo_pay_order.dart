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
import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'dart:math';
import 'package:http/http.dart' as http;

Future<dynamic> generateZaloPayOrder(
  String appuser,
  String amount,
  String item,
) async {
  final String baseUrl = "https://sandbox.zalopay.com.vn/v001/tpe/createorder";
  final String appid = "2554";
  final String key1 = "sdngKKJmqEMzvh5QQcdD2A9XBSKUNaYn";

  // Generate a random numeric string of 6 digits
  final Random random = Random();
  final String randomString =
      List.generate(6, (_) => random.nextInt(10).toString()).join();

  // Current timestamp in milliseconds since epoch
  final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();

  // Combine parts for a unique transid
  final String transid =
      '${timestamp.substring(timestamp.length - 6)}$randomString';

  // Generate a unique transaction ID and timestamp
  final String apptransid =
      DateFormat('yyMMdd').format(DateTime.now()) + "_$transid";
  final int apptime = DateTime.now().millisecondsSinceEpoch;

  // Example data
  final embeddata = {
    "promotioninfo": "",
    "merchantinfo": "embeddata123",
    "redirecturl": "comviet://comviet.com/paymentResults"
  };

  // Parameters
  final Map<String, String> param = {
    "appid": appid,
    "appuser": appuser,
    "apptime": apptime.toString(),
    "amount": amount,
    "apptransid": apptransid,
    "embeddata":
        """{"promotioninfo": "","merchantinfo": "embeddata123", "redirecturl": "comviet://comviet.com/paymentResults"}""",
    "item": item,
    "description": "Demo - Thanh toan don hang",
    "bankcode": "",
  };

  // Generate the data string for HMAC calculation
  final String data =
      "${param["appid"]}|${param["apptransid"]}|${param["appuser"]}|${param["amount"]}|${param["apptime"]}|${param["embeddata"]}|${param["item"]}";

  final keyBytes = utf8.encode(key1);
  final messageBytes = utf8.encode(data);
  final hmac = Hmac(sha256, keyBytes);
  final digest = hmac.convert(messageBytes);
  final mac =
      digest.bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();

  // Build the final URL with parameters and the secure hash
  final String paymentUrl =
      "$baseUrl?${param.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&')}&mac=$mac";

  // Return a JSON-encoded string containing both values
  final Map<String, dynamic> result = {
    "apptransid": apptransid,
    "paymentUrl": paymentUrl,
    "embeddata": "${embeddata}"
  };

  return result;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

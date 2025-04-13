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
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';

String generatePaymentUrl(
  String tmnCode,
  String hashSecret,
  String orderId,
  String orderInfo,
  String orderType,
  double amount,
  String locale,
  String? bankCode,
  String ipAddr,
) {
  final String baseUrl = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
  final String returnUrl = "http://localhost:8080/vnpay_jsp/vnpay_return.jsp";

  // Get current time in Vietnam timezone
  DateTime vietnamTime = DateTime.now().toUtc().add(Duration(hours: 7));

  // Generate create date string
  String createDate =
      vietnamTime.toString().replaceAll(RegExp(r'[^0-9]'), '').substring(0, 14);

  // Generate expire date (current time + 5 minutes)
  String expireDate = vietnamTime
      .add(Duration(minutes: 5))
      .toString()
      .replaceAll(RegExp(r'[^0-9]'), '')
      .substring(0, 14);

  // Generate the vnp_OrderInfo as 'Thanh toan GD:' + orderId
  String orderInfoString = 'Thanh toan GD:$orderId';

  // Create input data map
  Map<String, String> inputData = {
    "vnp_Version": "2.1.0",
    "vnp_TmnCode": tmnCode,
    "vnp_Amount": (amount * 100).round().toString(),
    "vnp_Command": "pay",
    "vnp_CreateDate": createDate,
    "vnp_CurrCode": "VND",
    "vnp_IpAddr": ipAddr,
    "vnp_Locale": locale,
    "vnp_OrderInfo": orderInfoString,
    "vnp_OrderType": orderType,
    "vnp_ReturnUrl": returnUrl,
    "vnp_TxnRef": orderId,
    "vnp_ExpireDate": expireDate,
  };

  // Add optional bankCode if provided
  if (bankCode != null && bankCode.isNotEmpty) {
    inputData["vnp_BankCode"] = bankCode;
  }

  // Sort the input data by key
  final sortedInputData = Map.fromEntries(
    inputData.entries
        .where((entry) => entry.value.isNotEmpty) // Skip empty values
        .toList()
      ..sort((a, b) => a.key.compareTo(b.key)),
  );

  // Build the query string
  final queryParams = sortedInputData.entries.map((entry) {
    final key = Uri.encodeComponent(entry.key);
    final value = Uri.encodeComponent(entry.value);
    return '$key=$value';
  }).toList();

  final query = queryParams.join('&');

  // Generate the secure hash
  String paymentUrl = '$baseUrl?$query';
  if (hashSecret.isNotEmpty) {
    // Remove leading '?' when hashing, similar to Node.js `.slice(1)`
    final hmac = Hmac(sha512, utf8.encode(hashSecret));
    final digest = hmac.convert(utf8.encode(query));
    final secureHash = digest.toString();

    // Append the secure hash to the query
    paymentUrl += '&vnp_SecureHash=$secureHash';
  }

  return paymentUrl;
}

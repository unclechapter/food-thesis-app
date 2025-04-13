import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class InferenceAPICall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? image = '',
  }) async {
    final ffApiRequestBody = '''
$image''';
    return ApiManager.instance.makeApiCall(
      callName: 'Inference API',
      apiUrl:
          'https://detect.roboflow.com/food-items-j9iud/10?api_key=$apiKey',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ZaloPayPortalAPICall {
  static Future<ApiCallResponse> call({
    int? appid = 554,
    String? appuser = 'jschlatt',
    int? apptime = 1459823610957,
    int? amount = 600,
    String? apptransid = 'orderIDHere',
    String? embeddata =
        '{\"promotioninfo\":\"\",\"merchantinfo\":\"du lieu rieng cua ung dung\"}',
    String? item =
        '[{\"itemid\":\"knb\",\"itemname\":\"kim nguyen bao\",\"itemquantity\":10,\"itemprice\":50000}]',
    String? mac = 'cc',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ZaloPay Portal API',
      apiUrl: 'https://sandbox.zalopay.com.vn/v001/tpe/createorder',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

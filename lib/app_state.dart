import 'package:flutter/material.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _username = 'akaasuka';
  String get username => _username;
  set username(String value) {
    _username = value;
  }

  dynamic _jsonDummy = jsonDecode(
      '{\"inference_id\":\"14735983-7eb6-4f22-98f7-d1f000e16556\",\"time\":0.31308610299993234,\"image\":{\"width\":1200,\"height\":900},\"predictions\":[{\"x\":330.0,\"y\":283.5,\"width\":402.0,\"height\":395.0,\"confidence\":0.9686251878738403,\"class\":\"dau-hu-nhoi-thit\",\"class_id\":25,\"detection_id\":\"e5b20057-22c8-47a5-a89c-28be1318b8a0\"},{\"x\":314.5,\"y\":636.5,\"width\":331.0,\"height\":341.0,\"confidence\":0.9629759788513184,\"class\":\"canh-rau-cai\",\"class_id\":13,\"detection_id\":\"78a1a6db-f9e8-4dd5-8e7a-dafd38a5e8d2\"},{\"x\":762.5,\"y\":606.0,\"width\":443.0,\"height\":440.0,\"confidence\":0.9579993486404419,\"class\":\"com\",\"class_id\":15,\"detection_id\":\"6793f9e0-056a-4c2e-af33-cc803d4a3d57\"},{\"x\":781.0,\"y\":201.0,\"width\":422.0,\"height\":402.0,\"confidence\":0.8260453939437866,\"class\":\"ca-basa-kho-hanh\",\"class_id\":2,\"detection_id\":\"36a27280-7107-4dd0-a0eb-801435e441b6\"}]}');
  dynamic get jsonDummy => _jsonDummy;
  set jsonDummy(dynamic value) {
    _jsonDummy = value;
  }

  int _orderPriceTotal = 0;
  int get orderPriceTotal => _orderPriceTotal;
  set orderPriceTotal(int value) {
    _orderPriceTotal = value;
  }

  String _paymentPage = '';
  String get paymentPage => _paymentPage;
  set paymentPage(String value) {
    _paymentPage = value;
  }

  String _datetime = '';
  String get datetime => _datetime;
  set datetime(String value) {
    _datetime = value;
  }

  DateTime? _datetime2;
  DateTime? get datetime2 => _datetime2;
  set datetime2(DateTime? value) {
    _datetime2 = value;
  }

  String _paymentURL = '';
  String get paymentURL => _paymentURL;
  set paymentURL(String value) {
    _paymentURL = value;
  }

  String _appid = '';
  String get appid => _appid;
  set appid(String value) {
    _appid = value;
  }

  String _apptransid = '';
  String get apptransid => _apptransid;
  set apptransid(String value) {
    _apptransid = value;
  }

  String _mac = '';
  String get mac => _mac;
  set mac(String value) {
    _mac = value;
  }

  int _successCode = 0;
  int get successCode => _successCode;
  set successCode(int value) {
    _successCode = value;
  }

  String _paymentMessage = '';
  String get paymentMessage => _paymentMessage;
  set paymentMessage(String value) {
    _paymentMessage = value;
  }

  bool _paymentChecked = false;
  bool get paymentChecked => _paymentChecked;
  set paymentChecked(bool value) {
    _paymentChecked = value;
  }
}

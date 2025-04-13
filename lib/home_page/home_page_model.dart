import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - encodeBase64] action in Button widget.
  String? encodedImage;
  // Stores action output result for [Backend Call - API (Inference API)] action in Button widget.
  ApiCallResponse? apiResultsja;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? currentUsername;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<OrderDetailsRow>? foodOrderInference;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<OrderDetailsRow>? foodOrderInferenceTest;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

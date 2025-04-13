import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'purchase_details_inference_widget.dart'
    show PurchaseDetailsInferenceWidget;
import 'package:flutter/material.dart';

class PurchaseDetailsInferenceModel
    extends FlutterFlowModel<PurchaseDetailsInferenceWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<dynamic>();
  // Stores action output result for [Custom Action - calculateTotalPrice] action in Button widget.
  int? totalFoodPrice;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? currentUsername;
  // Stores action output result for [Custom Action - generateZaloPayOrder] action in Button widget.
  dynamic paymentUrl;
  // Stores action output result for [Custom Action - performApiCall] action in Button widget.
  String? paymentLink;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paginatedDataTableController.dispose();
  }
}

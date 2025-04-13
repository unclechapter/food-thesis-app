import '/flutter_flow/flutter_flow_util.dart';
import 'payment_results_widget.dart' show PaymentResultsWidget;
import 'package:flutter/material.dart';

class PaymentResultsModel extends FlutterFlowModel<PaymentResultsWidget> {
  ///  Local state fields for this page.

  String pageText = 'Check payment please';

  bool resultChecked = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - processCallback] action in Button widget.
  dynamic paymentResults;
  // Stores action output result for [Custom Action - performApiCallback] action in Button widget.
  dynamic paymentStatus;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future<String?> paymentPage(BuildContext context) async {
    return null;
  }
}

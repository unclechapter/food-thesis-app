import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'payment_results_model.dart';
export 'payment_results_model.dart';

class PaymentResultsWidget extends StatefulWidget {
  /// Payment Results Page
  const PaymentResultsWidget({
    super.key,
    this.totalFoodPrice,
    this.successCode,
  });

  final int? totalFoodPrice;
  final dynamic successCode;

  @override
  State<PaymentResultsWidget> createState() => _PaymentResultsWidgetState();
}

class _PaymentResultsWidgetState extends State<PaymentResultsWidget> {
  late PaymentResultsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentResultsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF592B14),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/main_screen_image.png',
                    width: 350.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                    alignment: const Alignment(0.0, 0.0),
                  ),
                ),
              ),
              Text(
                _model.pageText,
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).cornsilk,
                      fontSize: 28.0,
                      letterSpacing: 0.0,
                    ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 150.0, 0.0, 40.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          var shouldSetState = false;
                          _model.paymentResults = await actions.processCallback(
                            FFAppState().apptransid,
                          );
                          shouldSetState = true;
                          _model.paymentStatus =
                              await actions.performApiCallback(
                            getJsonField(
                              _model.paymentResults,
                              r'''$.requestUrl''',
                            ).toString(),
                          );
                          shouldSetState = true;
                          FFAppState().successCode = getJsonField(
                            _model.paymentStatus,
                            r'''$.returnCode''',
                          );
                          FFAppState().paymentMessage = getJsonField(
                            _model.paymentStatus,
                            r'''$.returnMessage''',
                          ).toString();
                          if (FFAppState().successCode == 1) {
                            _model.pageText = 'Payment Success';
                            _model.resultChecked = true;
                            safeSetState(() {});
                            if (shouldSetState) safeSetState(() {});
                            return;
                          } else {
                            await OrderDetailsTable().delete(
                              matchingRows: (rows) => rows.eqOrNull(
                                'created_at',
                                supaSerialize<DateTime>(FFAppState().datetime2),
                              ),
                            );
                            _model.pageText = 'Payment Failed';
                            _model.resultChecked = true;
                            safeSetState(() {});
                            if (shouldSetState) safeSetState(() {});
                            return;
                          }

                          if (shouldSetState) safeSetState(() {});
                        },
                        text: 'Check Payment Results',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.65,
                          height: MediaQuery.sizeOf(context).height * 0.1,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).darkMossGreen,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).cornsilk,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                              ),
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  if (_model.resultChecked)
                    Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed('HomePage');
                        },
                        text: 'Back to Home',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.65,
                          height: MediaQuery.sizeOf(context).height * 0.1,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).darkMossGreen,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).cornsilk,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                              ),
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                ],
              ),
            ].divide(const SizedBox(height: 30.0)),
          ),
        ),
      ),
    );
  }
}

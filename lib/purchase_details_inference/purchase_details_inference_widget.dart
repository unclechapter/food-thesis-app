import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'purchase_details_inference_model.dart';
export 'purchase_details_inference_model.dart';

class PurchaseDetailsInferenceWidget extends StatefulWidget {
  /// Detailed view of a purchase
  const PurchaseDetailsInferenceWidget({
    super.key,
    required this.foodOrderInfo,
  });

  final OrderDetailsRow? foodOrderInfo;

  @override
  State<PurchaseDetailsInferenceWidget> createState() =>
      _PurchaseDetailsInferenceWidgetState();
}

class _PurchaseDetailsInferenceWidgetState
    extends State<PurchaseDetailsInferenceWidget> {
  late PurchaseDetailsInferenceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PurchaseDetailsInferenceModel());

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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).tigersEye,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Order Details',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, -1.0),
                  child: Text(
                    'Order details',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).cornsilk,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                    child: AutoSizeText(
                      dateTimeFormat(
                          "d/M h:mm a", widget.foodOrderInfo!.createdAt!),
                      textAlign: TextAlign.start,
                      minFontSize: 25.0,
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).cornsilk,
                                letterSpacing: 0.0,
                              ),
                    ),
                  ),
                ),
                Flexible(
                  child: Builder(
                    builder: (context) {
                      final foodOrderInfernceInfo =
                          widget.foodOrderInfo?.foodorderprice?.toList() ?? [];

                      return FlutterFlowDataTable<dynamic>(
                        controller: _model.paginatedDataTableController,
                        data: foodOrderInfernceInfo,
                        columnsBuilder: (onSortChanged) => [
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'Food dish',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .pakistanGreen,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'Price',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .pakistanGreen,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ],
                        dataRowBuilder: (foodOrderInfernceInfoItem,
                                foodOrderInfernceInfoIndex,
                                selected,
                                onSelectChanged) =>
                            DataRow(
                          color: WidgetStateProperty.all(
                            foodOrderInfernceInfoIndex % 2 == 0
                                ? FlutterFlowTheme.of(context).cornsilk
                                : const Color(0xFFEECEAD),
                          ),
                          cells: [
                            Text(
                              getJsonField(
                                foodOrderInfernceInfoItem,
                                r'''$.className''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .pakistanGreen,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Text(
                              getJsonField(
                                foodOrderInfernceInfoItem,
                                r'''$.price''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .pakistanGreen,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].map((c) => DataCell(c)).toList(),
                        ),
                        paginated: true,
                        selectable: false,
                        hidePaginator: true,
                        showFirstLastButtons: false,
                        headingRowHeight: 56.0,
                        dataRowHeight: 48.0,
                        columnSpacing: 20.0,
                        headingRowColor:
                            FlutterFlowTheme.of(context).earthYellow,
                        borderRadius: BorderRadius.circular(1.0),
                        addHorizontalDivider: true,
                        addTopAndBottomDivider: false,
                        hideDefaultHorizontalDivider: true,
                        horizontalDividerColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        horizontalDividerThickness: 1.0,
                        addVerticalDivider: false,
                      );
                    },
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                    child: Text(
                      'Total Price:',
                      textAlign: TextAlign.start,
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).cornsilk,
                                letterSpacing: 0.0,
                              ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                    child: Text(
                      functions
                          .calculateSumPrice(
                              widget.foodOrderInfo?.foodorderprice)
                          .toString(),
                      textAlign: TextAlign.start,
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).cornsilk,
                                letterSpacing: 0.0,
                              ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 75.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        _model.totalFoodPrice =
                            actions.calculateTotalPrice(
                          widget.foodOrderInfo!.foodorderprice!,
                        );
                        FFAppState().orderPriceTotal = _model.totalFoodPrice!;
                        _model.currentUsername = await UsersTable().queryRows(
                          queryFn: (q) => q,
                        );
                        _model.paymentUrl = await actions.generateZaloPayOrder(
                          _model.currentUsername!.firstOrNull!.username,
                          FFAppState().orderPriceTotal.toString(),
                          widget.foodOrderInfo!.foodorderprice!.toString(),
                        );
                        _model.paymentLink = await actions.performApiCall(
                          getJsonField(
                            _model.paymentUrl,
                            r'''$.paymentUrl''',
                          ).toString(),
                        );
                        FFAppState().paymentPage = _model.paymentLink!;
                        FFAppState().paymentURL = getJsonField(
                          _model.paymentUrl,
                          r'''$.paymentUrl''',
                        ).toString();
                        FFAppState().apptransid = getJsonField(
                          _model.paymentUrl,
                          r'''$.apptransid''',
                        ).toString();
                        await launchURL(_model.paymentLink!);
                        await Future.delayed(const Duration(milliseconds: 800));

                        context.pushNamed(
                          'PaymentResults',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );

                        safeSetState(() {});
                      },
                      text: 'Go to Checkout',
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        height: 65.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).darkMossGreen,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
              ].addToStart(const SizedBox(height: 50.0)),
            ),
          ),
        ),
      ),
    );
  }
}

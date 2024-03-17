import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/onboarding/minus_element/minus_element_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'onboarding19_o_n_b_c_o_m_p_l_e_t_e_d_model.dart';
export 'onboarding19_o_n_b_c_o_m_p_l_e_t_e_d_model.dart';

class Onboarding19ONBCOMPLETEDWidget extends StatefulWidget {
  const Onboarding19ONBCOMPLETEDWidget({super.key});

  @override
  State<Onboarding19ONBCOMPLETEDWidget> createState() =>
      _Onboarding19ONBCOMPLETEDWidgetState();
}

class _Onboarding19ONBCOMPLETEDWidgetState
    extends State<Onboarding19ONBCOMPLETEDWidget> {
  late Onboarding19ONBCOMPLETEDModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Onboarding19ONBCOMPLETEDModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Onboarding19ONBCOMPLETED'});
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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('ONBOARDING19_O_N_B_C_O_M_P_L_E_T_E_D_Con');
                  logFirebaseEvent('Container_navigate_back');
                  context.safePop();
                },
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: const BoxDecoration(),
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Icon(
                    FFIcons.karrowBack,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 30.0,
                  ),
                ),
              ),
            ],
          ),
          actions: const [],
          centerTitle: false,
          toolbarHeight: 40.0,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(),
                Stack(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.45,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              14.0, 14.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Without Quis',
                                style: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      fontFamily: 'Sofia Pro',
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 14.0, 14.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    wrapWithModel(
                                      model: _model.minusElementModel1,
                                      updateCallback: () => setState(() {}),
                                      child: const MinusElementWidget(
                                        text:
                                            'Wondering what to do before/after interview',
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.minusElementModel2,
                                      updateCallback: () => setState(() {}),
                                      child: const MinusElementWidget(
                                        text:
                                            'Getting nervous every time & not sure if you are not ready for an interview',
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.minusElementModel3,
                                      updateCallback: () => setState(() {}),
                                      child: const MinusElementWidget(
                                        text:
                                            'Worried about what you will be asked',
                                        isPlus: false,
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.minusElementModel4,
                                      updateCallback: () => setState(() {}),
                                      child: const MinusElementWidget(
                                        text:
                                            'Unsure what the interview process will be like',
                                        isPlus: false,
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 12.0)),
                                ),
                              ),
                              if (MediaQuery.sizeOf(context).height > 815.0)
                                Align(
                                  alignment: const AlignmentDirectional(1.0, 1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Onb21.webp',
                                        height: 120.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(1.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        height: 440.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).melon,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    14.0, 0.0, 14.0, 14.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/Onb20.webp',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  14.0, 14.0, 14.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'With Quis',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .override(
                                          fontFamily: 'Sofia Pro',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 50.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        wrapWithModel(
                                          model: _model.minusElementModel5,
                                          updateCallback: () => setState(() {}),
                                          child: const MinusElementWidget(
                                            text: 'Know exactly what to do',
                                            isPlus: true,
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.minusElementModel6,
                                          updateCallback: () => setState(() {}),
                                          child: const MinusElementWidget(
                                            text:
                                                'Feel positive and ready for interview',
                                            isPlus: true,
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.minusElementModel7,
                                          updateCallback: () => setState(() {}),
                                          child: const MinusElementWidget(
                                            text:
                                                'Mindful and aware about interview questions',
                                            isPlus: true,
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.minusElementModel8,
                                          updateCallback: () => setState(() {}),
                                          child: const MinusElementWidget(
                                            text:
                                                'Having clear structure about the hiring\nprocess',
                                            isPlus: true,
                                          ),
                                        ),
                                      ].divide(const SizedBox(height: 12.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 2),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'ONBOARDING19_O_N_B_C_O_M_P_L_E_T_E_D_CON');
                      if (valueOrDefault(currentUserDocument?.brevoId, 0) <=
                          0) {
                        logFirebaseEvent('Button_backend_call');
                        _model.apiResultsj6 =
                            await BrevoGroup.createAContactCall.call(
                          firstname: valueOrDefault(
                              currentUserDocument?.firstName, ''),
                          lastname:
                              valueOrDefault(currentUserDocument?.lastName, ''),
                          email: currentUserEmail,
                        );
                        if ((_model.apiResultsj6?.succeeded ?? true)) {
                          logFirebaseEvent('Button_backend_call');

                          await currentUserReference!
                              .update(createUsersRecordData(
                            brevoId: BrevoGroup.createAContactCall.brevoID(
                              (_model.apiResultsj6?.jsonBody ?? ''),
                            ),
                          ));
                        }
                      }
                      if (FFAppState().dailyNotificationID <= 0) {
                        logFirebaseEvent('Button_update_app_state');
                        setState(() {
                          FFAppState().dailyNotificationID =
                              random_data.randomInteger(100, 10000);
                        });
                        logFirebaseEvent('Button_custom_action');
                        await actions.awesomeNotificationScheduleLocal(
                          FFAppState().dailyNotificationID,
                          'Hooray! You\'ve just earned Karma ☯️',
                          'Tap to find out more',
                          12,
                          00,
                          null,
                          null,
                          null,
                          null,
                          null,
                          null,
                          true,
                          true,
                        );
                      }
                      logFirebaseEvent('Button_backend_call');
                      unawaited(
                        () async {
                          await currentUserReference!
                              .update(createUsersRecordData(
                            isOnboardingCompleted: true,
                          ));
                        }(),
                      );
                      if (currentUserDocument?.refUser != null) {
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed(
                          'Pricing',
                          queryParameters: {
                            'offers': serializeParam(
                              PaywallPrice.off25,
                              ParamType.Enum,
                            ),
                            'backButton': serializeParam(
                              PricingBackButton.onboarding1,
                              ParamType.Enum,
                            ),
                          }.withoutNulls,
                        );
                      } else {
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed(
                          'Pricing',
                          queryParameters: {
                            'offers': serializeParam(
                              PaywallPrice.standard,
                              ParamType.Enum,
                            ),
                            'backButton': serializeParam(
                              PricingBackButton.onboarding1,
                              ParamType.Enum,
                            ),
                          }.withoutNulls,
                        );
                      }

                      setState(() {});
                    },
                    text: 'Continue',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 52.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: 'Sofia Pro',
                                color: FlutterFlowTheme.of(context).info,
                                useGoogleFonts: false,
                              ),
                      elevation: 0.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

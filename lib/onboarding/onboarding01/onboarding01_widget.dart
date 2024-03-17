import '/components/check_mark_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onboarding01_model.dart';
export 'onboarding01_model.dart';

class Onboarding01Widget extends StatefulWidget {
  const Onboarding01Widget({super.key});

  @override
  State<Onboarding01Widget> createState() => _Onboarding01WidgetState();
}

class _Onboarding01WidgetState extends State<Onboarding01Widget> {
  late Onboarding01Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Onboarding01Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Onboarding01'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/NEWOnb05.webp',
                      width: 300.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  'We are glad you’re here!',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).displayMedium.override(
                        fontFamily: 'Sofia Pro',
                        color: FlutterFlowTheme.of(context).info,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: false,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                  child: Text(
                    'Let’s start with a couple of questions to help us personalize your experience',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Sofia Pro',
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 26.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'ONBOARDING01_Container_dd1mmsam_ON_TAP');
                          if (_model.isPravicyPolicyConsent) {
                            logFirebaseEvent('Container_update_page_state');
                            setState(() {
                              _model.isPravicyPolicyConsent = false;
                            });
                          } else {
                            logFirebaseEvent('Container_update_page_state');
                            setState(() {
                              _model.isPravicyPolicyConsent = true;
                              _model.isPolicyRed = false;
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 13.0, 10.0),
                            child: wrapWithModel(
                              model: _model.checkMarkModel1,
                              updateCallback: () => setState(() {}),
                              child: CheckMarkWidget(
                                boolean: _model.isPravicyPolicyConsent,
                                backgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'I consent to Quis ',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Sofia Pro',
                                      color: _model.isPolicyRed
                                          ? FlutterFlowTheme.of(context).error
                                          : FlutterFlowTheme.of(context).info,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              TextSpan(
                                text: 'Privacy Policy ',
                                style: TextStyle(
                                  color: _model.isPolicyRed
                                      ? FlutterFlowTheme.of(context).error
                                      : FlutterFlowTheme.of(context).info,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                ),
                                mouseCursor: SystemMouseCursors.click,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    logFirebaseEvent(
                                        'ONBOARDING01_RichTextSpan_zq4tzld5_ON_TA');
                                    logFirebaseEvent(
                                        'RichTextSpan_launch_u_r_l');
                                    await launchURL(
                                        'https://quisapp.notion.site/Privacy-Policy-e8d3ed6fbfab45b7aff4170895695b7c');
                                  },
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Sofia Pro',
                                  color: FlutterFlowTheme.of(context).info,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                  lineHeight: 1.16,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'ONBOARDING01_Container_sv14sajc_ON_TAP');
                        if (_model.isTermsOfUseConsent) {
                          logFirebaseEvent('Container_update_page_state');
                          setState(() {
                            _model.isTermsOfUseConsent = false;
                          });
                        } else {
                          logFirebaseEvent('Container_update_page_state');
                          setState(() {
                            _model.isTermsOfUseConsent = true;
                            _model.isTermsRed = false;
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 13.0, 10.0),
                          child: wrapWithModel(
                            model: _model.checkMarkModel2,
                            updateCallback: () => setState(() {}),
                            child: CheckMarkWidget(
                              boolean: _model.isTermsOfUseConsent,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'I agree to the ',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Sofia Pro',
                                    color: _model.isTermsRed
                                        ? FlutterFlowTheme.of(context).error
                                        : FlutterFlowTheme.of(context).info,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            TextSpan(
                              text: 'Terms of Use',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Sofia Pro',
                                    color: _model.isTermsRed
                                        ? FlutterFlowTheme.of(context).error
                                        : FlutterFlowTheme.of(context).info,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                    useGoogleFonts: false,
                                  ),
                              mouseCursor: SystemMouseCursors.click,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  logFirebaseEvent(
                                      'ONBOARDING01_RichTextSpan_efny8omi_ON_TA');
                                  logFirebaseEvent('RichTextSpan_launch_u_r_l');
                                  await launchURL(
                                      'https://quisapp.notion.site/Terms-of-Use-6e0163631b634a80ae3b5265054de6d3');
                                },
                            )
                          ],
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Sofia Pro',
                                color: FlutterFlowTheme.of(context).info,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: false,
                                lineHeight: 1.16,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(flex: 2),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('ONBOARDING01_PAGE_CONTINUE_BTN_ON_TAP');
                      if (!_model.isPravicyPolicyConsent) {
                        logFirebaseEvent('Button_update_page_state');
                        setState(() {
                          _model.isPolicyRed = true;
                        });
                        if (!_model.isTermsOfUseConsent) {
                          logFirebaseEvent('Button_update_page_state');
                          setState(() {
                            _model.isTermsRed = true;
                          });
                          return;
                        }
                        return;
                      }
                      if (!_model.isTermsOfUseConsent) {
                        logFirebaseEvent('Button_update_page_state');
                        setState(() {
                          _model.isTermsRed = true;
                        });
                        return;
                      }
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed('Onboarding02');
                    },
                    text: 'Continue',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 52.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).white,
                      textStyle:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: 'Sofia Pro',
                                color: FlutterFlowTheme.of(context).primary,
                                useGoogleFonts: false,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
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

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'onboarding12referral_model.dart';
export 'onboarding12referral_model.dart';

class Onboarding12referralWidget extends StatefulWidget {
  const Onboarding12referralWidget({super.key});

  @override
  State<Onboarding12referralWidget> createState() =>
      _Onboarding12referralWidgetState();
}

class _Onboarding12referralWidgetState
    extends State<Onboarding12referralWidget> {
  late Onboarding12referralModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Onboarding12referralModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Onboarding12referral'});
    _model.refFieldController ??= TextEditingController();
    _model.refFieldFocusNode ??= FocusNode();
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
                  logFirebaseEvent('ONBOARDING12REFERRAL_Container_8ghnyye5_');
                  logFirebaseEvent('Container_navigate_back');
                  context.safePop();
                },
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(),
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Icon(
                    FFIcons.karrowBack,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 30.0,
                  ),
                ),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          toolbarHeight: 40.0,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 27.0, 0.0, 0.0),
                  child: GradientText(
                    'Quis for Friends',
                    style: FlutterFlowTheme.of(context).displayLarge,
                    colors: [
                      FlutterFlowTheme.of(context).aquaBreeze,
                      Color(0xFF326A9F)
                    ],
                    gradientDirection: GradientDirection.ttb,
                    gradientType: GradientType.linear,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 30.0, 10.0, 0.0),
                  child: Text(
                    'Do you have Referral code?',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).displayMedium.override(
                          fontFamily: 'Sofia Pro',
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Text(
                    'Enter your referral code for exclusive benefits!',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineLarge,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 0.0),
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: _model.isFieldRed
                              ? FlutterFlowTheme.of(context).error
                              : Colors.transparent,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(1.0),
                        child: TextFormField(
                          controller: _model.refFieldController,
                          focusNode: _model.refFieldFocusNode,
                          textCapitalization: TextCapitalization.characters,
                          textInputAction: TextInputAction.done,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'REFERRAL CODE',
                            hintStyle: FlutterFlowTheme.of(context)
                                .displayLarge
                                .override(
                                  fontFamily: 'Sofia Pro',
                                  color: FlutterFlowTheme.of(context).accent3,
                                  useGoogleFonts: false,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).champagnePink,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .displayLarge
                              .override(
                                fontFamily: 'Sofia Pro',
                                color: FlutterFlowTheme.of(context).primary,
                                useGoogleFonts: false,
                              ),
                          textAlign: TextAlign.center,
                          maxLength: 6,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          buildCounter: (context,
                                  {required currentLength,
                                  required isFocused,
                                  maxLength}) =>
                              null,
                          validator: _model.refFieldControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 10.0),
                  child: FFButtonWidget(
                    onPressed: (/* NOT RECOMMENDED */ _model
                                .refFieldController.text ==
                            'true')
                        ? null
                        : () async {
                            logFirebaseEvent(
                                'ONBOARDING12REFERRAL_CONTINUE_BTN_ON_TAP');
                            var _shouldSetState = false;
                            logFirebaseEvent('Button_update_page_state');
                            setState(() {
                              _model.isRefValid = true;
                            });
                            logFirebaseEvent('Button_validate_form');
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              return;
                            }
                            logFirebaseEvent('Button_firestore_query');
                            _model.refUserOutput = await queryUsersRecordOnce(
                              queryBuilder: (usersRecord) => usersRecord.where(
                                'ref_code',
                                isEqualTo: _model.refFieldController.text,
                              ),
                            );
                            _shouldSetState = true;
                            if (_model.refUserOutput!.length > 0) {
                              logFirebaseEvent('Button_update_app_state');
                              setState(() {
                                FFAppState().refUser =
                                    _model.refUserOutput?.first?.reference;
                              });
                              logFirebaseEvent('Button_update_page_state');
                              setState(() {
                                _model.isFieldRed = false;
                              });
                            } else {
                              logFirebaseEvent('Button_update_page_state');
                              setState(() {
                                _model.isFieldRed = true;
                              });
                              if (_shouldSetState) setState(() {});
                              return;
                            }

                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed('Onboarding13');

                            if (_shouldSetState) setState(() {});
                          },
                    text: 'Continue',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 52.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: 'Sofia Pro',
                                color: FlutterFlowTheme.of(context).info,
                                useGoogleFonts: false,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                      disabledColor: FlutterFlowTheme.of(context).secondary,
                      disabledTextColor: FlutterFlowTheme.of(context).white,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'ONBOARDING12REFERRAL_Text_hjjrjs1i_ON_TA');
                      logFirebaseEvent('Text_navigate_to');

                      context.pushNamed('Onboarding13');
                    },
                    child: Text(
                      'I don’t have',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).headlineMedium,
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

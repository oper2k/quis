import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/check_mark_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'signup_old_model.dart';
export 'signup_old_model.dart';

class SignupOldWidget extends StatefulWidget {
  const SignupOldWidget({super.key});

  @override
  State<SignupOldWidget> createState() => _SignupOldWidgetState();
}

class _SignupOldWidgetState extends State<SignupOldWidget> {
  late SignupOldModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignupOldModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'SignupOld'});
    _model.emailFieldController ??= TextEditingController();
    _model.emailFieldFocusNode ??= FocusNode();

    _model.passwordField1Controller ??= TextEditingController();
    _model.passwordField1FocusNode ??= FocusNode();

    _model.passwordField2Controller ??= TextEditingController();
    _model.passwordField2FocusNode ??= FocusNode();

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
                  logFirebaseEvent('SIGNUP_OLD_Container_wb0zcnwe_ON_TAP');
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
              Text(
                'Sign up',
                style: FlutterFlowTheme.of(context).headlineLarge,
              ),
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          toolbarHeight: 40.0,
          elevation: 0.0,
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 6.0),
                  child: Text(
                    'Email address',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Sofia Pro',
                          useGoogleFonts: false,
                          lineHeight: 1.16,
                        ),
                  ),
                ),
                Container(
                  height: 56.0,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.emailFieldController,
                          focusNode: _model.emailFieldFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.emailFieldController',
                            Duration(milliseconds: 100),
                            () async {
                              logFirebaseEvent(
                                  'SIGNUP_OLD_EmailField_ON_TEXTFIELD_CHANG');
                              logFirebaseEvent('EmailField_update_page_state');
                              setState(() {
                                _model.isEmailValid = functions.emailValidation(
                                    _model.emailFieldController.text);
                              });
                            },
                          ),
                          textInputAction: TextInputAction.done,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'example@mail.com',
                            hintStyle: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Sofia Pro',
                                  color: FlutterFlowTheme.of(context).accent2,
                                  useGoogleFonts: false,
                                  lineHeight: 2.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context).white,
                            contentPadding: EdgeInsets.all(16.0),
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Sofia Pro',
                                useGoogleFonts: false,
                                lineHeight: 2.0,
                              ),
                          keyboardType: TextInputType.emailAddress,
                          validator: _model.emailFieldControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 16.0, 0.0),
                          child: wrapWithModel(
                            model: _model.checkMarkModel1,
                            updateCallback: () => setState(() {}),
                            child: CheckMarkWidget(
                              boolean: _model.isEmailValid,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: _model.formKey2,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 6.0),
                        child: Text(
                          'Create Password',
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Sofia Pro',
                                useGoogleFonts: false,
                                lineHeight: 1.16,
                              ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.passwordField1Controller,
                          focusNode: _model.passwordField1FocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.passwordField1Controller',
                            Duration(milliseconds: 100),
                            () async {
                              logFirebaseEvent(
                                  'SIGNUP_OLD_PasswordField1_ON_TEXTFIELD_C');
                              logFirebaseEvent(
                                  'PasswordField1_update_page_state');
                              setState(() {
                                _model.isPassword1Valid =
                                    functions.passwordValidation(
                                        _model.passwordField1Controller.text);
                              });
                            },
                          ),
                          obscureText: !_model.passwordField1Visibility,
                          decoration: InputDecoration(
                            hintText: 'Must be 8 characters',
                            hintStyle: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Sofia Pro',
                                  color: FlutterFlowTheme.of(context).accent2,
                                  useGoogleFonts: false,
                                  lineHeight: 2.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context).white,
                            contentPadding: EdgeInsets.all(16.0),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => _model.passwordField1Visibility =
                                    !_model.passwordField1Visibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                _model.passwordField1Visibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 22,
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Sofia Pro',
                                useGoogleFonts: false,
                                lineHeight: 2.0,
                              ),
                          validator: _model.passwordField1ControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 6.0),
                        child: Text(
                          'Confirm password',
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Sofia Pro',
                                useGoogleFonts: false,
                                lineHeight: 1.16,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.passwordField2Controller,
                            focusNode: _model.passwordField2FocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.passwordField2Controller',
                              Duration(milliseconds: 100),
                              () async {
                                logFirebaseEvent(
                                    'SIGNUP_OLD_PasswordField2_ON_TEXTFIELD_C');
                                logFirebaseEvent(
                                    'PasswordField2_update_page_state');
                                setState(() {
                                  _model.isPassword2Valid =
                                      functions.passwordValidation(
                                          _model.passwordField2Controller.text);
                                });
                              },
                            ),
                            obscureText: !_model.passwordField2Visibility,
                            decoration: InputDecoration(
                              hintText: 'Repeat password',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Sofia Pro',
                                    color: FlutterFlowTheme.of(context).accent2,
                                    useGoogleFonts: false,
                                    lineHeight: 2.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).white,
                              contentPadding: EdgeInsets.all(16.0),
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () => _model.passwordField2Visibility =
                                      !_model.passwordField2Visibility,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  _model.passwordField2Visibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 22,
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Sofia Pro',
                                  useGoogleFonts: false,
                                  lineHeight: 2.0,
                                ),
                            validator: _model.passwordField2ControllerValidator
                                .asValidator(context),
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
                            'SIGNUP_OLD_Container_71apneoa_ON_TAP');
                        if (_model.isConsent) {
                          logFirebaseEvent('Container_update_page_state');
                          setState(() {
                            _model.isConsent = false;
                          });
                        } else {
                          logFirebaseEvent('Container_update_page_state');
                          setState(() {
                            _model.isConsent = true;
                            _model.isConsentRed = false;
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 5.0, 10.0),
                          child: wrapWithModel(
                            model: _model.checkMarkModel2,
                            updateCallback: () => setState(() {}),
                            child: CheckMarkWidget(
                              boolean: _model.isConsent,
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
                                    color: _model.isConsentRed
                                        ? FlutterFlowTheme.of(context).error
                                        : FlutterFlowTheme.of(context)
                                            .primaryText,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            TextSpan(
                              text: 'Privacy Policy ',
                              style: TextStyle(
                                color: _model.isConsentRed
                                    ? FlutterFlowTheme.of(context).error
                                    : FlutterFlowTheme.of(context).primaryText,
                                decoration: TextDecoration.underline,
                              ),
                              mouseCursor: SystemMouseCursors.click,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  logFirebaseEvent(
                                      'SIGNUP_OLD_RichTextSpan_337g4njv_ON_TAP');
                                  logFirebaseEvent('RichTextSpan_launch_u_r_l');
                                  await launchURL(
                                      'https://quisapp.notion.site/Privacy-Policy-e8d3ed6fbfab45b7aff4170895695b7c');
                                },
                            ),
                            TextSpan(
                              text: 'and ',
                              style: TextStyle(
                                color: _model.isConsentRed
                                    ? FlutterFlowTheme.of(context).error
                                    : FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            TextSpan(
                              text: 'Terms of Use.',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Sofia Pro',
                                    color: _model.isConsentRed
                                        ? FlutterFlowTheme.of(context).error
                                        : FlutterFlowTheme.of(context)
                                            .primaryText,
                                    decoration: TextDecoration.underline,
                                    useGoogleFonts: false,
                                  ),
                              mouseCursor: SystemMouseCursors.click,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  logFirebaseEvent(
                                      'SIGNUP_OLD_RichTextSpan_5dpimqqd_ON_TAP');
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
                                useGoogleFonts: false,
                                lineHeight: 1.16,
                              ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 7.0)),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent('SIGNUP_OLD_PAGE_Row_qovlvbc2_ON_TAP');
                        if (_model.isRef) {
                          logFirebaseEvent('Row_update_page_state');
                          setState(() {
                            _model.isRef = false;
                          });
                        } else {
                          logFirebaseEvent('Row_update_page_state');
                          setState(() {
                            _model.isRef = true;
                          });
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 5.0, 10.0),
                            child: wrapWithModel(
                              model: _model.checkMarkModel3,
                              updateCallback: () => setState(() {}),
                              child: CheckMarkWidget(
                                boolean: _model.isRef,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 14.0, 0.0, 14.0),
                            child: Text(
                              'I have a referral code',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Sofia Pro',
                                    useGoogleFonts: false,
                                    lineHeight: 1.16,
                                  ),
                            ),
                          ),
                        ].divide(SizedBox(width: 7.0)),
                      ),
                    ),
                  ),
                ),
                Form(
                  key: _model.formKey1,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: _model.isRefValid
                              ? Color(0x00000000)
                              : FlutterFlowTheme.of(context).error,
                        ),
                      ),
                      child: Visibility(
                        visible: _model.isRef,
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.refFieldController,
                            focusNode: _model.refFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.refFieldController',
                              Duration(milliseconds: 2000),
                              () async {
                                logFirebaseEvent(
                                    'SIGNUP_OLD_RefField_ON_TEXTFIELD_CHANGE');
                                if (_model.refFieldController.text != null &&
                                    _model.refFieldController.text != '') {
                                  logFirebaseEvent(
                                      'RefField_update_page_state');
                                  setState(() {
                                    _model.isRefValid = true;
                                  });
                                } else {
                                  logFirebaseEvent(
                                      'RefField_update_page_state');
                                  setState(() {
                                    _model.isRefValid = false;
                                  });
                                }
                              },
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Please enter your referral code',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Sofia Pro',
                                    color: FlutterFlowTheme.of(context).accent2,
                                    useGoogleFonts: false,
                                    lineHeight: 2.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).white,
                              contentPadding: EdgeInsets.all(16.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Sofia Pro',
                                  useGoogleFonts: false,
                                  lineHeight: 2.0,
                                ),
                            maxLength: 6,
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
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: !_model.isEmailValid
                        ? null
                        : () async {
                            logFirebaseEvent(
                                'SIGNUP_OLD_PAGE_SIGN_UP_BTN_ON_TAP');
                            var _shouldSetState = false;
                            if (_model.isRef) {
                              if (_model.refFieldController.text != null &&
                                  _model.refFieldController.text != '') {
                                logFirebaseEvent('Button_update_page_state');
                                setState(() {
                                  _model.isRefValid = true;
                                });
                                logFirebaseEvent('Button_validate_form');
                                if (_model.formKey2.currentState == null ||
                                    !_model.formKey2.currentState!.validate()) {
                                  return;
                                }
                              } else {
                                logFirebaseEvent('Button_update_page_state');
                                setState(() {
                                  _model.isRefValid = false;
                                });
                                logFirebaseEvent('Button_validate_form');
                                if (_model.formKey2.currentState == null ||
                                    !_model.formKey2.currentState!.validate()) {
                                  return;
                                }
                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              logFirebaseEvent('Button_firestore_query');
                              _model.refUserOutput = await queryUsersRecordOnce(
                                queryBuilder: (usersRecord) =>
                                    usersRecord.where(
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
                              } else {
                                logFirebaseEvent('Button_update_page_state');
                                setState(() {
                                  _model.isRefValid = false;
                                });
                                if (_shouldSetState) setState(() {});
                                return;
                              }
                            }
                            if (_model.isConsent) {
                              logFirebaseEvent('Button_update_page_state');
                              setState(() {
                                _model.isConsentRed = false;
                              });
                            } else {
                              logFirebaseEvent('Button_update_page_state');
                              setState(() {
                                _model.isConsentRed = true;
                              });
                              if (_shouldSetState) setState(() {});
                              return;
                            }

                            logFirebaseEvent('Button_auth');
                            GoRouter.of(context).prepareAuthEvent();
                            if (_model.passwordField1Controller.text !=
                                _model.passwordField2Controller.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Passwords don\'t match!',
                                  ),
                                ),
                              );
                              return;
                            }

                            final user =
                                await authManager.createAccountWithEmail(
                              context,
                              _model.emailFieldController.text,
                              _model.passwordField1Controller.text,
                            );
                            if (user == null) {
                              return;
                            }

                            logFirebaseEvent('Button_auth');
                            await authManager.sendEmailVerification();
                            logFirebaseEvent('Button_navigate_to');

                            context.goNamedAuth(
                              'ConfirmEmail',
                              context.mounted,
                              queryParameters: {
                                'isAfterReg': serializeParam(
                                  true,
                                  ParamType.bool,
                                ),
                              }.withoutNulls,
                            );

                            if (_shouldSetState) setState(() {});
                          },
                    text: 'Sign up',
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
                                color: FlutterFlowTheme.of(context).white,
                                useGoogleFonts: false,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                      disabledColor: FlutterFlowTheme.of(context).primary,
                      disabledTextColor: FlutterFlowTheme.of(context).white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          height: 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent2,
                          ),
                        ),
                      ),
                      Text(
                        'or',
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Sofia Pro',
                                  useGoogleFonts: false,
                                  lineHeight: 1.16,
                                ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent2,
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 15.0)),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent('SIGNUP_OLD_PAGE_Google_ON_TAP');
                          var _shouldSetState = false;
                          if (_model.isRef) {
                            if (_model.refFieldController.text != null &&
                                _model.refFieldController.text != '') {
                              logFirebaseEvent('Google_update_page_state');
                              setState(() {
                                _model.isRefValid = true;
                              });
                            } else {
                              logFirebaseEvent('Google_update_page_state');
                              setState(() {
                                _model.isRefValid = false;
                              });
                              if (_shouldSetState) setState(() {});
                              return;
                            }

                            logFirebaseEvent('Google_firestore_query');
                            _model.refUserOutputGoogle =
                                await queryUsersRecordOnce(
                              queryBuilder: (usersRecord) => usersRecord.where(
                                'ref_code',
                                isEqualTo: _model.refFieldController.text,
                              ),
                            );
                            _shouldSetState = true;
                            if (_model.refUserOutputGoogle!.length > 0) {
                              logFirebaseEvent('Google_update_app_state');
                              setState(() {
                                FFAppState().refUser = _model
                                    .refUserOutputGoogle?.first?.reference;
                              });
                            } else {
                              logFirebaseEvent('Google_update_page_state');
                              setState(() {
                                _model.isRefValid = false;
                              });
                              if (_shouldSetState) setState(() {});
                              return;
                            }
                          }
                          if (_model.isConsent) {
                            logFirebaseEvent('Google_update_page_state');
                            setState(() {
                              _model.isConsentRed = false;
                            });
                          } else {
                            logFirebaseEvent('Google_update_page_state');
                            setState(() {
                              _model.isConsentRed = true;
                            });
                            if (_shouldSetState) setState(() {});
                            return;
                          }

                          logFirebaseEvent('Google_auth');
                          GoRouter.of(context).prepareAuthEvent();
                          final user =
                              await authManager.signInWithGoogle(context);
                          if (user == null) {
                            return;
                          }
                          logFirebaseEvent('Google_navigate_to');

                          context.goNamedAuth('ConfirmEmail', context.mounted);

                          if (_shouldSetState) setState(() {});
                        },
                        child: Container(
                          width: 108.0,
                          height: 56.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).accent2,
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/_Google.webp',
                                  width: 20.0,
                                  height: 20.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent('SIGNUP_OLD_PAGE_Apple_ON_TAP');
                          var _shouldSetState = false;
                          if (_model.isRef) {
                            if (_model.refFieldController.text != null &&
                                _model.refFieldController.text != '') {
                              logFirebaseEvent('Apple_update_page_state');
                              setState(() {
                                _model.isRefValid = true;
                              });
                            } else {
                              logFirebaseEvent('Apple_update_page_state');
                              setState(() {
                                _model.isRefValid = false;
                              });
                              if (_shouldSetState) setState(() {});
                              return;
                            }

                            logFirebaseEvent('Apple_firestore_query');
                            _model.refUserOutputApple =
                                await queryUsersRecordOnce(
                              queryBuilder: (usersRecord) => usersRecord.where(
                                'ref_code',
                                isEqualTo: _model.refFieldController.text,
                              ),
                            );
                            _shouldSetState = true;
                            if (_model.refUserOutputApple!.length > 0) {
                              logFirebaseEvent('Apple_update_app_state');
                              setState(() {
                                FFAppState().refUser =
                                    _model.refUserOutputApple?.first?.reference;
                              });
                            } else {
                              logFirebaseEvent('Apple_update_page_state');
                              setState(() {
                                _model.isRefValid = false;
                              });
                              if (_shouldSetState) setState(() {});
                              return;
                            }
                          }
                          if (_model.isConsent) {
                            logFirebaseEvent('Apple_update_page_state');
                            setState(() {
                              _model.isConsentRed = false;
                            });
                          } else {
                            logFirebaseEvent('Apple_update_page_state');
                            setState(() {
                              _model.isConsentRed = true;
                            });
                            if (_shouldSetState) setState(() {});
                            return;
                          }

                          logFirebaseEvent('Apple_auth');
                          GoRouter.of(context).prepareAuthEvent();
                          final user =
                              await authManager.signInWithApple(context);
                          if (user == null) {
                            return;
                          }
                          logFirebaseEvent('Apple_navigate_to');

                          context.goNamedAuth('ConfirmEmail', context.mounted);

                          if (_shouldSetState) setState(() {});
                        },
                        child: Container(
                          width: 108.0,
                          height: 56.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).accent2,
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/_Apple.webp',
                                  width: 20.0,
                                  height: 20.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 22.0)),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'SIGNUP_OLD_Container_240lx5px_ON_TAP');
                        logFirebaseEvent('Container_navigate_to');
                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        }
                        context.pushNamed('Login');
                      },
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Already have an account? ',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                ),
                                TextSpan(
                                  text: 'Log in',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Sofia Pro',
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                      ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ].addToEnd(SizedBox(height: 50.0)),
            ),
          ),
        ),
      ),
    );
  }
}

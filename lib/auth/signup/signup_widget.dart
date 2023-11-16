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
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'signup_model.dart';
export 'signup_model.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({Key? key}) : super(key: key);

  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  late SignupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignupModel());

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
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

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
                  context.safePop();
                },
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(),
                  alignment: AlignmentDirectional(-1.00, 0.00),
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
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 16.0),
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
                        alignment: AlignmentDirectional(1.00, 0.00),
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
                  key: _model.formKey,
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
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 16.0),
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
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
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
                        if (_model.isConsent) {
                          setState(() {
                            _model.isConsent = false;
                          });
                        } else {
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
                        textScaleFactor: MediaQuery.of(context).textScaleFactor,
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
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (_model.isRef) {
                          setState(() {
                            _model.isRef = false;
                          });
                        } else {
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
                if (_model.isRef)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 15.0),
                    child: Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.refFieldController,
                        focusNode: _model.refFieldFocusNode,
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
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                        ),
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Sofia Pro',
                                  useGoogleFonts: false,
                                  lineHeight: 2.0,
                                ),
                        validator: _model.refFieldControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: !_model.isEmailValid
                        ? null
                        : () async {
                            var _shouldSetState = false;
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              return;
                            }
                            if (_model.isConsent) {
                              setState(() {
                                _model.isConsentRed = false;
                              });
                            } else {
                              setState(() {
                                _model.isConsentRed = true;
                              });
                              if (_shouldSetState) setState(() {});
                              return;
                            }

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

                            if (_model.isRef &&
                                (_model.refFieldController.text != null &&
                                    _model.refFieldController.text != '')) {
                              _model.refUserOutput = await queryUsersRecordOnce(
                                queryBuilder: (usersRecord) =>
                                    usersRecord.where(
                                  'ref_code',
                                  isEqualTo: _model.refFieldController.text,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              _shouldSetState = true;
                              setState(() {
                                FFAppState().refUser =
                                    _model.refUserOutput?.reference;
                              });
                            }
                            await authManager.sendEmailVerification();

                            context.goNamedAuth(
                                'ConfirmEmail', context.mounted);

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
                          var _shouldSetState = false;
                          if (_model.isConsent) {
                            setState(() {
                              _model.isConsentRed = false;
                            });
                          } else {
                            setState(() {
                              _model.isConsentRed = true;
                            });
                            if (_shouldSetState) setState(() {});
                            return;
                          }

                          GoRouter.of(context).prepareAuthEvent();
                          final user =
                              await authManager.signInWithGoogle(context);
                          if (user == null) {
                            return;
                          }
                          if (_model.isRef &&
                              (_model.refFieldController.text != null &&
                                  _model.refFieldController.text != '')) {
                            _model.refUserOutputGoogle =
                                await queryUsersRecordOnce(
                              queryBuilder: (usersRecord) => usersRecord.where(
                                'ref_code',
                                isEqualTo: _model.refFieldController.text,
                              ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);
                            _shouldSetState = true;
                            setState(() {
                              FFAppState().refUser =
                                  _model.refUserOutputGoogle?.reference;
                            });
                          }
                          await authManager.sendEmailVerification();

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
                          var _shouldSetState = false;
                          if (_model.isConsent) {
                            setState(() {
                              _model.isConsentRed = false;
                            });
                          } else {
                            setState(() {
                              _model.isConsentRed = true;
                            });
                            if (_shouldSetState) setState(() {});
                            return;
                          }

                          GoRouter.of(context).prepareAuthEvent();
                          final user =
                              await authManager.signInWithApple(context);
                          if (user == null) {
                            return;
                          }
                          if (_model.isRef &&
                              (_model.refFieldController.text != null &&
                                  _model.refFieldController.text != '')) {
                            _model.refUserOutputApple =
                                await queryUsersRecordOnce(
                              queryBuilder: (usersRecord) => usersRecord.where(
                                'ref_code',
                                isEqualTo: _model.refFieldController.text,
                              ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);
                            _shouldSetState = true;
                            setState(() {
                              FFAppState().refUser =
                                  _model.refUserOutputApple?.reference;
                            });
                          }
                          await authManager.sendEmailVerification();

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
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        }
                        context.pushNamed('Login');
                      },
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 10.0),
                          child: RichText(
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor,
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

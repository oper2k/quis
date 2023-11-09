import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'exchange_karma_model.dart';
export 'exchange_karma_model.dart';

class ExchangeKarmaWidget extends StatefulWidget {
  const ExchangeKarmaWidget({Key? key}) : super(key: key);

  @override
  _ExchangeKarmaWidgetState createState() => _ExchangeKarmaWidgetState();
}

class _ExchangeKarmaWidgetState extends State<ExchangeKarmaWidget> {
  late ExchangeKarmaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExchangeKarmaModel());
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
                'Exchange Karma',
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0.00, 0.00),
              child: Lottie.asset(
                'assets/lottie_animations/animation_lnz09grs.json',
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 0.24,
                fit: BoxFit.contain,
                animate: true,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Text(
                'Get expert coaching, mock interviews',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineLarge,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
              child: Text(
                'Connect with an expert in your field to practice mock interviews, review your resume in-person, or create a study plan.',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Sofia Pro',
                      fontWeight: FontWeight.w300,
                      useGoogleFonts: false,
                      lineHeight: 1.16,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setState(() {
                          _model.pickedService = 'Job Referral';
                        });
                      },
                      child: Container(
                        width: 113.0,
                        height: 113.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).melon,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: _model.pickedService == 'Job Referral'
                                ? FlutterFlowTheme.of(context).customColor1
                                : Color(0x00000000),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              9.0, 9.0, 9.0, 9.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 43.6,
                                height: 43.6,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  FFIcons.kmaterialSymbolsWorkOutline,
                                  color:
                                      FlutterFlowTheme.of(context).customColor1,
                                  size: 20.8,
                                ),
                              ),
                              Text(
                                'Job Referral',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Sofia Pro',
                                  color:
                                      FlutterFlowTheme.of(context).customColor1,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13.0,
                                ),
                              ),
                              Text(
                                '15 Karma',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).customColor1,
                                  fontSize: 11.0,
                                  height: 1.16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setState(() {
                          _model.pickedService = 'CV Feedback Review';
                        });
                      },
                      child: Container(
                        width: 113.0,
                        height: 113.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).powderBlue,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: _model.pickedService == 'CV Feedback Review'
                                ? FlutterFlowTheme.of(context).customColor2
                                : Color(0x00000000),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              9.0, 9.0, 9.0, 9.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 43.6,
                                height: 43.6,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  FFIcons.kgroup514582,
                                  color:
                                      FlutterFlowTheme.of(context).customColor2,
                                  size: 20.8,
                                ),
                              ),
                              Text(
                                'CV Feedback Review',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Sofia Pro',
                                  color:
                                      FlutterFlowTheme.of(context).customColor2,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13.0,
                                ),
                              ),
                              Text(
                                '10 Karma',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).customColor2,
                                  fontSize: 11.0,
                                  height: 1.16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 113.0,
                      height: 113.0,
                      child: Stack(
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _model.pickedService =
                                    'Mock Interview with Recruiter';
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).champagnePink,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: _model.pickedService ==
                                          'Mock Interview with Recruiter'
                                      ? FlutterFlowTheme.of(context)
                                          .customColor3
                                      : Color(0x00000000),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    9.0, 9.0, 9.0, 9.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 43.6,
                                      height: 43.6,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        FFIcons.kfluentPersonFeedback20Regular,
                                        color: FlutterFlowTheme.of(context)
                                            .customColor3,
                                        size: 20.8,
                                      ),
                                    ),
                                    Text(
                                      'Mock Interview with Recruiter',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Sofia Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .customColor3,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13.0,
                                      ),
                                    ),
                                    Text(
                                      '10 Karma',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor3,
                                        fontSize: 11.0,
                                        height: 1.16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.00, -1.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 7.0, 4.0, 0.0),
                              child: Text(
                                '45 min',
                                style: TextStyle(
                                  fontFamily: 'Sofia Pro',
                                  color:
                                      FlutterFlowTheme.of(context).customColor3,
                                  fontSize: 8.3,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 113.0,
                      height: 113.0,
                      child: Stack(
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _model.pickedService = '1х1 Coaching Session';
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).blueOcean,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: _model.pickedService ==
                                          '1х1 Coaching Session'
                                      ? FlutterFlowTheme.of(context)
                                          .customColor4
                                      : Color(0x00000000),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    9.0, 9.0, 9.0, 9.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 43.6,
                                      height: 43.6,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        FFIcons.kphChalkboardTeacher,
                                        color: FlutterFlowTheme.of(context)
                                            .customColor4,
                                        size: 20.8,
                                      ),
                                    ),
                                    Text(
                                      '1х1 Coaching Session',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Sofia Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .customColor4,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13.0,
                                      ),
                                    ),
                                    Text(
                                      '10 Karma',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor4,
                                        fontSize: 11.0,
                                        height: 1.16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.00, -1.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 7.0, 4.0, 0.0),
                              child: Text(
                                '45 min',
                                style: TextStyle(
                                  fontFamily: 'Sofia Pro',
                                  color:
                                      FlutterFlowTheme.of(context).customColor4,
                                  fontSize: 8.3,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
                      .divide(SizedBox(width: 7.6))
                      .addToStart(SizedBox(width: 16.0))
                      .addToEnd(SizedBox(width: 16.0)),
                ),
              ),
            ),
            Spacer(),
            Align(
              alignment: AlignmentDirectional(0.00, 1.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 50.0),
                child: FFButtonWidget(
                  onPressed:
                      _model.pickedService != null && _model.pickedService != ''
                          ? null
                          : () {
                              print('Button pressed ...');
                            },
                  text: 'Exchange',
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
                    disabledColor: FlutterFlowTheme.of(context).secondary,
                    disabledTextColor: FlutterFlowTheme.of(context).white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

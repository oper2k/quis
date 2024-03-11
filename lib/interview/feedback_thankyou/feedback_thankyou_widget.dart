import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'feedback_thankyou_model.dart';
export 'feedback_thankyou_model.dart';

class FeedbackThankyouWidget extends StatefulWidget {
  const FeedbackThankyouWidget({super.key});

  @override
  State<FeedbackThankyouWidget> createState() => _FeedbackThankyouWidgetState();
}

class _FeedbackThankyouWidgetState extends State<FeedbackThankyouWidget> {
  late FeedbackThankyouModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedbackThankyouModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'FeedbackThankyou'});
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'FEEDBACK_THANKYOU_Container_5wtqhdiw_ON_');
                    if (valueOrDefault(
                            currentUserDocument?.interviewSessions, 0) ==
                        1) {
                      logFirebaseEvent('Container_navigate_to');

                      context.pushNamed(
                        'Pricing',
                        queryParameters: {
                          'offers': serializeParam(
                            PaywallPrice.off25,
                            ParamType.Enum,
                          ),
                        }.withoutNulls,
                      );
                    } else {
                      logFirebaseEvent('Container_navigate_to');

                      context.goNamed('Home');
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 10.0),
                      child: Icon(
                        FFIcons.kxmark,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
              ),
              Lottie.asset(
                'assets/lottie_animations/animation_loeodjhs.json',
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 276.0,
                fit: BoxFit.contain,
                animate: true,
              ),
              Spacer(),
              Text(
                'Thank you for your feedback!',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineLarge,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Text(
                  'We glad seeing your improvement and your help to improve Quis at the same time!',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Sofia Pro',
                        useGoogleFonts: false,
                        lineHeight: 1.16,
                      ),
                ),
              ),
              Spacer(),
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('FEEDBACK_THANKYOU_BACK_HOME_BTN_ON_TAP');
                  if (valueOrDefault(
                          currentUserDocument?.interviewSessions, 0) ==
                      1) {
                    logFirebaseEvent('Button_navigate_to');

                    context.pushNamed(
                      'Pricing',
                      queryParameters: {
                        'offers': serializeParam(
                          PaywallPrice.off25,
                          ParamType.Enum,
                        ),
                      }.withoutNulls,
                    );
                  } else {
                    logFirebaseEvent('Button_navigate_to');

                    context.goNamed('Home');
                  }
                },
                text: 'Back home',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 52.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
                ),
              ),
              Builder(
                builder: (context) => Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'FEEDBACK_THANKYOU_SHARE_WITH_FRIENDS_BTN');
                      logFirebaseEvent('Button_share');
                      await Share.share(
                        'Join me on Quis to supercharge your Interview Skills! All you need to do is download the Quis app: https://quisapp.click/referral_link ',
                        sharePositionOrigin: getWidgetBoundingBox(context),
                      );
                    },
                    text: 'Share with friends',
                    icon: Icon(
                      FFIcons.ksystemUiconsShare2,
                      size: 24.0,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 52.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 5.0),
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
                    ),
                  ),
                ),
              ),
            ]
                .addToStart(SizedBox(height: 40.0))
                .addToEnd(SizedBox(height: 50.0)),
          ),
        ),
      ),
    );
  }
}

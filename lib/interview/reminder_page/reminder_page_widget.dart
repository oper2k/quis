import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'reminder_page_model.dart';
export 'reminder_page_model.dart';

class ReminderPageWidget extends StatefulWidget {
  const ReminderPageWidget({super.key});

  @override
  State<ReminderPageWidget> createState() => _ReminderPageWidgetState();
}

class _ReminderPageWidgetState extends State<ReminderPageWidget> {
  late ReminderPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReminderPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ReminderPage'});
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
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -0.25),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Lottie.asset(
                          'assets/lottie_animations/XLjIcIgZfU.json',
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                          animate: true,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 17.0, 0.0, 0.0),
                        child: Wrap(
                          spacing: 5.0,
                          runSpacing: 0.0,
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Text(
                              'Please log in 5 minutes prior to starting ☺️',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Sofia Pro',
                                    useGoogleFonts: false,
                                    lineHeight: 1.16,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: Text(
                                'You have successfully registered for an interview',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      fontFamily: 'Sofia Pro',
                                      useGoogleFonts: false,
                                      lineHeight: 1.16,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'REMINDER_PAGE_PAGE_THANK_YOU_BTN_ON_TAP');
                      logFirebaseEvent('Button_custom_action');
                      unawaited(
                        () async {
                          await actions.awesomeNotificationScheduleLocal(
                            random_data.randomInteger(0, 10000),
                            'Your Interview is in 15 Minutes!',
                            'Your dream job awaits – let\'s get you ready! ✨',
                            functions.getHourInInt(functions.timeMinusMinutes(
                                functions.getSameTime(
                                    getRemoteConfigInt(
                                        'unixTimeSecForInterview'),
                                    getCurrentTimestamp)!,
                                '15')),
                            functions.getMinutesInInt(
                                functions.timeMinusMinutes(
                                    functions.getSameTime(
                                        getRemoteConfigInt(
                                            'unixTimeSecForInterview'),
                                        getCurrentTimestamp)!,
                                    '15')),
                            functions.getYearInInt(functions.timeMinusMinutes(
                                functions.getSameTime(
                                    getRemoteConfigInt(
                                        'unixTimeSecForInterview'),
                                    getCurrentTimestamp)!,
                                '15')),
                            functions.getMonthInInt(functions.timeMinusMinutes(
                                functions.getSameTime(
                                    getRemoteConfigInt(
                                        'unixTimeSecForInterview'),
                                    getCurrentTimestamp)!,
                                '15')),
                            functions.getDayInInt(functions.timeMinusMinutes(
                                functions.getSameTime(
                                    getRemoteConfigInt(
                                        'unixTimeSecForInterview'),
                                    getCurrentTimestamp)!,
                                '15')),
                            null,
                            null,
                            null,
                            false,
                            true,
                          );
                        }(),
                      );
                      logFirebaseEvent('Button_backend_call');
                      unawaited(
                        () async {
                          await BrevoGroup.sendAScheduledEmailCall.call(
                            time: functions.timeToRFC3339(
                                functions.timeMinusMinutes(
                                    functions.getSameTime(
                                        getRemoteConfigInt(
                                            'unixTimeSecForInterview'),
                                        getCurrentTimestamp)!,
                                    '15')),
                            userEmail: currentUserEmail,
                            templateId: 9,
                          );
                        }(),
                      );
                      logFirebaseEvent('Button_custom_action');
                      unawaited(
                        () async {
                          await actions.awesomeNotificationScheduleLocal(
                            random_data.randomInteger(0, 10000),
                            'Practice Interview Session in 1 Hour! 💼',
                            'Don\'t wait to be ready. Start preparing for your Interview today! ',
                            functions.getHourInInt(functions.timeMinusMinutes(
                                functions.getSameTime(
                                    getRemoteConfigInt(
                                        'unixTimeSecForInterview'),
                                    getCurrentTimestamp)!,
                                '59')),
                            functions.getMinutesInInt(
                                functions.timeMinusMinutes(
                                    functions.getSameTime(
                                        getRemoteConfigInt(
                                            'unixTimeSecForInterview'),
                                        getCurrentTimestamp)!,
                                    '59')),
                            functions.getYearInInt(functions.timeMinusMinutes(
                                functions.getSameTime(
                                    getRemoteConfigInt(
                                        'unixTimeSecForInterview'),
                                    getCurrentTimestamp)!,
                                '59')),
                            functions.getMonthInInt(functions.timeMinusMinutes(
                                functions.getSameTime(
                                    getRemoteConfigInt(
                                        'unixTimeSecForInterview'),
                                    getCurrentTimestamp)!,
                                '59')),
                            functions.getDayInInt(functions.timeMinusMinutes(
                                functions.getSameTime(
                                    getRemoteConfigInt(
                                        'unixTimeSecForInterview'),
                                    getCurrentTimestamp)!,
                                '59')),
                            null,
                            null,
                            null,
                            false,
                            true,
                          );
                        }(),
                      );
                      logFirebaseEvent('Button_backend_call');
                      unawaited(
                        () async {
                          await BrevoGroup.sendAScheduledEmailCall.call(
                            time: functions.timeToRFC3339(
                                functions.timeMinusMinutes(
                                    functions.getSameTime(
                                        getRemoteConfigInt(
                                            'unixTimeSecForInterview'),
                                        getCurrentTimestamp)!,
                                    '59')),
                            userEmail: currentUserEmail,
                            templateId: 7,
                          );
                        }(),
                      );
                      logFirebaseEvent('Button_backend_call');
                      unawaited(
                        () async {
                          await BrevoGroup.sendAnEmailCall.call(
                            userEmail: currentUserEmail,
                            templateId: 21,
                          );
                        }(),
                      );
                      logFirebaseEvent('Button_navigate_back');
                      context.safePop();
                    },
                    text: 'Thank you',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 52.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 7.0),
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
            ],
          ),
        ),
      ),
    );
  }
}

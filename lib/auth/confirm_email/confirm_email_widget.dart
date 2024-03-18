import '/auth/email_dialog/email_dialog_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'confirm_email_model.dart';
export 'confirm_email_model.dart';

class ConfirmEmailWidget extends StatefulWidget {
  const ConfirmEmailWidget({
    super.key,
    bool? isAfterReg,
  }) : isAfterReg = isAfterReg ?? false;

  final bool isAfterReg;

  @override
  State<ConfirmEmailWidget> createState() => _ConfirmEmailWidgetState();
}

class _ConfirmEmailWidgetState extends State<ConfirmEmailWidget>
    with TickerProviderStateMixin {
  late ConfirmEmailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 500.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmEmailModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ConfirmEmail'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CONFIRM_EMAIL_ConfirmEmail_ON_INIT_STATE');
      await authManager.refreshUser();
      if (widget.isAfterReg) {
        logFirebaseEvent('ConfirmEmail_update_page_state');
        setState(() {
          _model.isSendEmailVisible = false;
        });
        logFirebaseEvent('ConfirmEmail_wait__delay');
        await Future.delayed(const Duration(milliseconds: 1000));
        logFirebaseEvent('ConfirmEmail_timer');
        _model.timerController.onStartTimer();
      }
      if (!(valueOrDefault(currentUserDocument?.refCode, '') != '')) {
        logFirebaseEvent('ConfirmEmail_backend_call');
        unawaited(
          () async {
            await currentUserReference!.update(createUsersRecordData(
              refCode: functions.generateRefCode(),
            ));
          }(),
        );
      }
      if ((FFAppState().refUser != null) &&
          (currentUserDocument?.refUser == null)) {
        logFirebaseEvent('ConfirmEmail_backend_call');
        unawaited(
          () async {
            await currentUserReference!.update(createUsersRecordData(
              refUser: FFAppState().refUser,
            ));
          }(),
        );
        logFirebaseEvent('ConfirmEmail_backend_call');
        unawaited(
          () async {
            await FFAppState().refUser!.update({
              ...mapToFirestore(
                {
                  'karma': FieldValue.increment(5.0),
                },
              ),
            });
          }(),
        );
      }
      if (currentUserEmailVerified) {
        logFirebaseEvent('ConfirmEmail_navigate_to');

        context.goNamed(
          'Home',
          extra: <String, dynamic>{
            kTransitionInfoKey: const TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      } else {
        logFirebaseEvent('ConfirmEmail_start_periodic_action');
        _model.instantTimer = InstantTimer.periodic(
          duration: const Duration(milliseconds: 3000),
          callback: (timer) async {
            if (currentUserEmailVerified) {
              logFirebaseEvent('ConfirmEmail_stop_periodic_action');
              _model.instantTimer?.cancel();
              logFirebaseEvent('ConfirmEmail_navigate_to');

              context.goNamed('ConfirmedEmail');
            }
          },
          startImmediately: true,
        );
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
        backgroundColor: FlutterFlowTheme.of(context).white,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).white,
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
                  logFirebaseEvent('CONFIRM_EMAIL_Container_y9yrraf3_ON_TAP');
                  logFirebaseEvent('Container_auth');
                  GoRouter.of(context).prepareAuthEvent();
                  await authManager.signOut();
                  GoRouter.of(context).clearRedirectLocation();

                  context.goNamedAuth('Onboarding01', context.mounted);
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
              Text(
                'Sign up',
                style: FlutterFlowTheme.of(context).headlineLarge,
              ),
              Container(
                width: 40.0,
                height: 40.0,
                decoration: const BoxDecoration(),
              ),
            ],
          ),
          actions: const [],
          centerTitle: false,
          toolbarHeight: 40.0,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 42.0, 0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/Hands_opening_envelope_with_hearts_inside_1.webp',
                    width: 229.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Text(
                    'Check your mail',
                    style: FlutterFlowTheme.of(context).headlineLarge,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Text(
                    'We have send an account activation link to your email ”$currentUserEmail\".',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineSmall,
                  ),
                ),
              ),
              const Spacer(),
              if (!_model.isSendEmailVisible)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlutterFlowTimer(
                      initialTime: _model.timerMilliseconds,
                      getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                        value,
                        hours: false,
                        milliSecond: false,
                      ),
                      controller: _model.timerController,
                      updateStateInterval: const Duration(milliseconds: 1000),
                      onChanged: (value, displayTime, shouldUpdate) {
                        _model.timerMilliseconds = value;
                        _model.timerValue = displayTime;
                        if (shouldUpdate) setState(() {});
                      },
                      onEnded: () async {
                        logFirebaseEvent(
                            'CONFIRM_EMAIL_Timer_0e9ooyxl_ON_TIMER_EN');
                        logFirebaseEvent('Timer_update_page_state');
                        setState(() {
                          _model.isSendEmailVisible = true;
                        });
                      },
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).headlineSmall,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'minutes to \'Resend\' availability.',
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                    ),
                  ],
                ),
              if (_model.isSendEmailVisible)
                Builder(
                  builder: (context) => Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'CONFIRM_EMAIL_Container_usejle6w_ON_TAP');
                        logFirebaseEvent('Container_alert_dialog');
                        showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: const AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: WebViewAware(
                                child: GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: const EmailDialogWidget(),
                                ),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));

                        logFirebaseEvent('Container_update_page_state');
                        setState(() {
                          _model.isSendEmailVisible = false;
                        });
                        logFirebaseEvent('Container_timer');
                        _model.timerController.onResetTimer();

                        logFirebaseEvent('Container_timer');
                        _model.timerController.onStartTimer();
                        logFirebaseEvent('Container_auth');
                        await authManager.sendEmailVerification();
                      },
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      'Check your spam folder for an email from *** or ',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                TextSpan(
                                  text: 'send again.',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Sofia Pro',
                                        decoration: TextDecoration.underline,
                                        useGoogleFonts: false,
                                      ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ]
                .addToStart(const SizedBox(height: 50.0))
                .addToEnd(const SizedBox(height: 50.0)),
          ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
        ),
      ),
    );
  }
}

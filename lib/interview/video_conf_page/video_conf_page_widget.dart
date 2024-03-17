import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/interview/interview_questions_bottom_sheet/interview_questions_bottom_sheet_widget.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'video_conf_page_model.dart';
export 'video_conf_page_model.dart';

class VideoConfPageWidget extends StatefulWidget {
  const VideoConfPageWidget({
    super.key,
    required this.token,
    required this.channelName,
    required this.userProfileImage,
    required this.uid,
    required this.userRef,
    required this.role,
    required this.roomDoc,
  });

  final String? token;
  final String? channelName;
  final String? userProfileImage;
  final int? uid;
  final DocumentReference? userRef;
  final String? role;
  final ConferenceRoomRecord? roomDoc;

  @override
  State<VideoConfPageWidget> createState() => _VideoConfPageWidgetState();
}

class _VideoConfPageWidgetState extends State<VideoConfPageWidget> {
  late VideoConfPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoConfPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'VideoConfPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('VIDEO_CONF_VideoConfPage_ON_INIT_STATE');
      logFirebaseEvent('VideoConfPage_timer');
      _model.initialTimerController.onStartTimer();
      logFirebaseEvent('VideoConfPage_timer');
      _model.introTimerController.onStartTimer();
      logFirebaseEvent('VideoConfPage_timer');
      _model.user1TimerController.onStartTimer();
      logFirebaseEvent('VideoConfPage_timer');
      _model.user2TimerController.onStartTimer();
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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          decoration: const BoxDecoration(),
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: custom_widgets.VideoConfWidget(
                  width: double.infinity,
                  height: double.infinity,
                  uid: widget.uid!,
                  channelName: widget.channelName!,
                  token: widget.token!,
                  userProfileImage: widget.userProfileImage!,
                  onMuteTap: () async {},
                  onTurnOffTap: () async {},
                  onChatTap: () async {},
                  onEndTap: () async {
                    logFirebaseEvent('VIDEO_CONF_Container_uto00mer_CALLBACK');
                    logFirebaseEvent('VideoConfWidget_backend_call');
                    unawaited(
                      () async {
                        await currentUserReference!.update({
                          ...mapToFirestore(
                            {
                              'interview_sessions': FieldValue.increment(1),
                            },
                          ),
                        });
                      }(),
                    );
                    logFirebaseEvent('VideoConfWidget_navigate_to');

                    context.goNamed(
                      'LIQ',
                      queryParameters: {
                        'userItem': serializeParam(
                          widget.userRef,
                          ParamType.DocumentReference,
                        ),
                        'roomDoc': serializeParam(
                          widget.roomDoc,
                          ParamType.Document,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'roomDoc': widget.roomDoc,
                      },
                    );
                  },
                  onRemoteUserJoin: () async {},
                  onRemoteUserLeave: () async {},
                ),
              ),
              Opacity(
                opacity: 0.0,
                child: FlutterFlowTimer(
                  initialTime: _model.initialTimerMilliseconds,
                  getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                    value,
                    hours: false,
                    milliSecond: false,
                  ),
                  controller: _model.initialTimerController,
                  updateStateInterval: const Duration(milliseconds: 1000),
                  onChanged: (value, displayTime, shouldUpdate) {
                    _model.initialTimerMilliseconds = value;
                    _model.initialTimerValue = displayTime;
                    if (shouldUpdate) setState(() {});
                  },
                  onEnded: () async {
                    logFirebaseEvent('VIDEO_CONF_InitialTimer_ON_TIMER_END');
                    logFirebaseEvent('InitialTimer_backend_call');
                    unawaited(
                      () async {
                        await currentUserReference!.update({
                          ...mapToFirestore(
                            {
                              'interview_sessions': FieldValue.increment(1),
                            },
                          ),
                        });
                      }(),
                    );
                    logFirebaseEvent('InitialTimer_navigate_to');

                    context.goNamed(
                      'LIQ',
                      queryParameters: {
                        'userItem': serializeParam(
                          widget.userRef,
                          ParamType.DocumentReference,
                        ),
                        'roomDoc': serializeParam(
                          widget.roomDoc,
                          ParamType.Document,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'roomDoc': widget.roomDoc,
                      },
                    );
                  },
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).displayLarge.override(
                        fontFamily: 'Sofia Pro',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        useGoogleFonts: false,
                      ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.5),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('VIDEO_CONF_SELECT_A_QUESTION_BTN_ON_TAP');
                    logFirebaseEvent('Button_bottom_sheet');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return WebViewAware(
                          child: GestureDetector(
                            onTap: () => _model.unfocusNode.canRequestFocus
                                ? FocusScope.of(context)
                                    .requestFocus(_model.unfocusNode)
                                : FocusScope.of(context).unfocus(),
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: InterviewQuestionsBottomSheetWidget(
                                role: widget.role!,
                              ),
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  text: 'Select a question',
                  options: FFButtonOptions(
                    height: 44.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).white,
                    textStyle: FlutterFlowTheme.of(context).headlineMedium,
                    elevation: 0.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 9.0),
                        child: StreamBuilder<UsersRecord>(
                          stream: UsersRecord.getDocument(widget.userRef!),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            final textUsersRecord = snapshot.data!;
                            return Text(
                              '${textUsersRecord.firstName} ${textUsersRecord.lastName}',
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Sofia Pro',
                                    color: FlutterFlowTheme.of(context).white,
                                    useGoogleFonts: false,
                                  ),
                            );
                          },
                        ),
                      ),
                      Stack(
                        children: [
                          if (_model.isIntro)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 4.0,
                                  sigmaY: 4.0,
                                ),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.4,
                                  decoration: BoxDecoration(
                                    color: const Color(0x70FFFFFF),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Intro ',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'Sofia Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .white,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        FlutterFlowTimer(
                                          initialTime: functions.subtractTime(
                                              widget.roomDoc!.date!,
                                              getCurrentTimestamp),
                                          getDisplayTime: (value) =>
                                              StopWatchTimer.getDisplayTime(
                                            value,
                                            hours: false,
                                            milliSecond: false,
                                          ),
                                          controller:
                                              _model.introTimerController,
                                          updateStateInterval:
                                              const Duration(milliseconds: 1000),
                                          onChanged: (value, displayTime,
                                              shouldUpdate) {
                                            _model.introTimerMilliseconds =
                                                value;
                                            _model.introTimerValue =
                                                displayTime;
                                            if (shouldUpdate) setState(() {});
                                          },
                                          onEnded: () async {
                                            logFirebaseEvent(
                                                'VIDEO_CONF_IntroTimer_ON_TIMER_END');
                                            logFirebaseEvent(
                                                'IntroTimer_update_page_state');
                                            setState(() {
                                              _model.isIntro = false;
                                              _model.isUser1 = true;
                                            });
                                          },
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                fontFamily: 'Sofia Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .white,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          Opacity(
                            opacity: _model.isUser1 ? 1.0 : 0.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 4.0,
                                  sigmaY: 4.0,
                                ),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  decoration: BoxDecoration(
                                    color: const Color(0x70FFFFFF),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: FutureBuilder<UsersRecord>(
                                            future: UsersRecord.getDocumentOnce(
                                                widget.roomDoc!.users.first),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              final containerUsersRecord =
                                                  snapshot.data!;
                                              return Container(
                                                decoration: const BoxDecoration(),
                                                child: Text(
                                                  '${containerUsersRecord.firstName} ${containerUsersRecord.lastName} answers ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Sofia Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .white,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: FlutterFlowTimer(
                                            initialTime: functions.subtractTime(
                                                functions.timePlusMinutes(
                                                    widget.roomDoc!.date!,
                                                    '20'),
                                                getCurrentTimestamp),
                                            getDisplayTime: (value) =>
                                                StopWatchTimer.getDisplayTime(
                                              value,
                                              hours: false,
                                              milliSecond: false,
                                            ),
                                            controller:
                                                _model.user1TimerController,
                                            updateStateInterval:
                                                const Duration(milliseconds: 1000),
                                            onChanged: (value, displayTime,
                                                shouldUpdate) {
                                              _model.user1TimerMilliseconds =
                                                  value;
                                              _model.user1TimerValue =
                                                  displayTime;
                                              if (shouldUpdate) setState(() {});
                                            },
                                            onEnded: () async {
                                              logFirebaseEvent(
                                                  'VIDEO_CONF_User1Timer_ON_TIMER_END');
                                              logFirebaseEvent(
                                                  'User1Timer_update_page_state');
                                              setState(() {
                                                _model.isUser2 = true;
                                                _model.isUser1 = false;
                                              });
                                            },
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineLarge
                                                .override(
                                                  fontFamily: 'Sofia Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: _model.isUser2 ? 1.0 : 0.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 4.0,
                                  sigmaY: 4.0,
                                ),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  decoration: BoxDecoration(
                                    color: const Color(0x70FFFFFF),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: StreamBuilder<UsersRecord>(
                                            stream: UsersRecord.getDocument(
                                                widget.roomDoc!.users.last),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              final containerUsersRecord =
                                                  snapshot.data!;
                                              return Container(
                                                decoration: const BoxDecoration(),
                                                child: Text(
                                                  '${containerUsersRecord.firstName} ${containerUsersRecord.lastName} answers ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Sofia Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .white,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: FlutterFlowTimer(
                                            initialTime: functions.subtractTime(
                                                functions.timePlusMinutes(
                                                    widget.roomDoc!.date!,
                                                    '40'),
                                                getCurrentTimestamp),
                                            getDisplayTime: (value) =>
                                                StopWatchTimer.getDisplayTime(
                                              value,
                                              hours: false,
                                              milliSecond: false,
                                            ),
                                            controller:
                                                _model.user2TimerController,
                                            updateStateInterval:
                                                const Duration(milliseconds: 1000),
                                            onChanged: (value, displayTime,
                                                shouldUpdate) {
                                              _model.user2TimerMilliseconds =
                                                  value;
                                              _model.user2TimerValue =
                                                  displayTime;
                                              if (shouldUpdate) setState(() {});
                                            },
                                            onEnded: () async {
                                              logFirebaseEvent(
                                                  'VIDEO_CONF_User2Timer_ON_TIMER_END');
                                              logFirebaseEvent(
                                                  'User2Timer_backend_call');
                                              unawaited(
                                                () async {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'interview_sessions':
                                                            FieldValue
                                                                .increment(1),
                                                      },
                                                    ),
                                                  });
                                                }(),
                                              );
                                              logFirebaseEvent(
                                                  'User2Timer_navigate_to');

                                              context.goNamed(
                                                'LIQ',
                                                queryParameters: {
                                                  'userItem': serializeParam(
                                                    widget.userRef,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'roomDoc': serializeParam(
                                                    widget.roomDoc,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'roomDoc': widget.roomDoc,
                                                },
                                              );
                                            },
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineLarge
                                                .override(
                                                  fontFamily: 'Sofia Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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

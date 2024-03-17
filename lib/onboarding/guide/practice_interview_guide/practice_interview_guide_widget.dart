import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/pick_bottom_sheet_widget.dart';
import '/components/pseudo_drop_down_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/interview/no_user_found_dialog/no_user_found_dialog_widget.dart';
import '/interview/sorry_dialog/sorry_dialog_widget.dart';
import '/walkthroughs/guide_interveiw4.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'practice_interview_guide_model.dart';
export 'practice_interview_guide_model.dart';

class PracticeInterviewGuideWidget extends StatefulWidget {
  const PracticeInterviewGuideWidget({super.key});

  @override
  State<PracticeInterviewGuideWidget> createState() =>
      _PracticeInterviewGuideWidgetState();
}

class _PracticeInterviewGuideWidgetState
    extends State<PracticeInterviewGuideWidget> {
  late PracticeInterviewGuideModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PracticeInterviewGuideModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PracticeInterviewGuide'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PRACTICE_INTERVIEW_GUIDE_PracticeIntervi');
      logFirebaseEvent('PracticeInterviewGuide_start_walkthrough');
      _model.guideInterveiw4Controller = _model.createPageWalkthrough(context);
      _model.guideInterveiw4Controller?.show(context: context);
    });

    _model.expandableController1 = ExpandableController(initialExpanded: false);
    _model.expandableController2 = ExpandableController(initialExpanded: false);
    _model.expandableController3 = ExpandableController(initialExpanded: false);
    _model.expandableController4 = ExpandableController(initialExpanded: false);
    _model.expandableController5 = ExpandableController(initialExpanded: false);
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          actions: [],
          centerTitle: false,
          toolbarHeight: 0.0,
          elevation: 0.0,
        ),
        body: Container(
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Lottie.asset(
                          'assets/lottie_animations/animation_lodp1m2k.json',
                          width: 200.0,
                          height: 150.0,
                          fit: BoxFit.contain,
                          repeat: false,
                          animate: true,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 5.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/b4ljt_.webp',
                                  width: 20.0,
                                  height: 20.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 0.0, 0.0),
                              child: Text(
                                'Practice Interviews',
                                style:
                                    FlutterFlowTheme.of(context).headlineLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Text(
                          'Practice makes perfect! Prepare for your interviews with thousands of Quis members.',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Sofia Pro',
                                fontWeight: FontWeight.w300,
                                useGoogleFonts: false,
                                lineHeight: 1.16,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 40.0, 10.0, 40.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 24.0,
                                          height: 24.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            FFIcons.kcontent,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 4.0),
                                          child: Container(
                                            width: 2.0,
                                            height: 89.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .white,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 2.0, 0.0, 0.0),
                                              child: Text(
                                                'Register for a Practice Interview by selecting your Interview type and tap “Get Reminder”. You will receive a notification prior to Interview start, registration is open everyday until 6:50 PM +4 GST.',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineSmall
                                                    .override(
                                                      fontFamily: 'Sofia Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .white,
                                                      useGoogleFonts: false,
                                                      lineHeight: 1.16,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 24.0,
                                          height: 24.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            FFIcons.kcontent,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 4.0),
                                          child: Container(
                                            width: 2.0,
                                            height: 71.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .white,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 2.0, 0.0, 0.0),
                                              child: Text(
                                                'Come back 5 minutes before the interview starts and tap \'Join Now.\' Join your Interview over live video and take turns interviewing each other.',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineSmall
                                                    .override(
                                                      fontFamily: 'Sofia Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .white,
                                                      useGoogleFonts: false,
                                                      lineHeight: 1.16,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 24.0,
                                          height: 24.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            FFIcons.kcontent,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 4.0),
                                          child: Container(
                                            width: 2.0,
                                            height: 70.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .white,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 2.0, 0.0, 0.0),
                                              child: Text(
                                                'Match with an interview partner by swiping the screen at the end of the practice interview. Once matched, you will be provided with a LinkedIn link for networking.',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineSmall
                                                    .override(
                                                      fontFamily: 'Sofia Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .white,
                                                      useGoogleFonts: false,
                                                      lineHeight: 1.16,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 24.0,
                                          height: 24.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            FFIcons.kcontent,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 2.0, 0.0, 0.0),
                                              child: Text(
                                                'Fill out the feedback form after your interview. Be as specific as possible to help each other improve!',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineSmall
                                                    .override(
                                                      fontFamily: 'Sofia Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .white,
                                                      useGoogleFonts: false,
                                                      lineHeight: 1.16,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 19.0, 0.0, 0.0),
                        child: Text(
                          'Please choose your role to practice:',
                          style: FlutterFlowTheme.of(context).headlineMedium,
                        ),
                      ),
                      StreamBuilder<List<InterviewParticipantsOfDayRecord>>(
                        stream: queryInterviewParticipantsOfDayRecord(
                          queryBuilder: (interviewParticipantsOfDayRecord) =>
                              interviewParticipantsOfDayRecord.where(
                            'date',
                            isEqualTo: functions.getSameTime(
                                getRemoteConfigInt('unixTimeSecForInterview'),
                                getCurrentTimestamp),
                          ),
                          singleRecord: true,
                        ),
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
                          List<InterviewParticipantsOfDayRecord>
                              interviewParticipantsItemInterviewParticipantsOfDayRecordList =
                              snapshot.data!;
                          final interviewParticipantsItemInterviewParticipantsOfDayRecord =
                              interviewParticipantsItemInterviewParticipantsOfDayRecordList
                                      .isNotEmpty
                                  ? interviewParticipantsItemInterviewParticipantsOfDayRecordList
                                      .first
                                  : null;
                          return Container(
                            decoration: BoxDecoration(),
                            child: StreamBuilder<List<ConferenceRoomRecord>>(
                              stream: queryConferenceRoomRecord(
                                queryBuilder: (conferenceRoomRecord) =>
                                    conferenceRoomRecord
                                        .where(
                                          'date',
                                          isEqualTo: functions.getSameTime(
                                              getRemoteConfigInt(
                                                  'unixTimeSecForInterview'),
                                              getCurrentTimestamp),
                                        )
                                        .where(
                                          'users',
                                          arrayContains: currentUserReference,
                                        ),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<ConferenceRoomRecord>
                                    confirenceRoomItemConferenceRoomRecordList =
                                    snapshot.data!;
                                final confirenceRoomItemConferenceRoomRecord =
                                    confirenceRoomItemConferenceRoomRecordList
                                            .isNotEmpty
                                        ? confirenceRoomItemConferenceRoomRecordList
                                            .first
                                        : null;
                                return Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if ((interviewParticipantsItemInterviewParticipantsOfDayRecord !=
                                                  null) &&
                                              (interviewParticipantsItemInterviewParticipantsOfDayRecord!
                                                      .participants
                                                      .where((e) =>
                                                          e.user ==
                                                          currentUserReference)
                                                      .toList()
                                                      .length >
                                                  0)) {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(18.0, 11.0,
                                                          18.0, 11.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    5.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            interviewParticipantsItemInterviewParticipantsOfDayRecord
                                                                ?.participants
                                                                ?.where((e) =>
                                                                    e.user ==
                                                                    currentUserReference)
                                                                .toList()
                                                                ?.first
                                                                ?.role,
                                                            'role',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Sofia Pro',
                                                                useGoogleFonts:
                                                                    false,
                                                                lineHeight:
                                                                    1.16,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 6.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'PRACTICE_INTERVIEW_GUIDE_Container_nkhvi');
                                                  logFirebaseEvent(
                                                      'Container_bottom_sheet');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return WebViewAware(
                                                        child: GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                PickBottomSheetWidget(
                                                              stringList:
                                                                  FFAppState()
                                                                      .filterRoleList,
                                                              title:
                                                                  'Choose from the list below',
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() => _model
                                                          .roleOutput = value));

                                                  if (_model.roleOutput !=
                                                          null &&
                                                      _model.roleOutput != '') {
                                                    logFirebaseEvent(
                                                        'Container_update_page_state');
                                                    setState(() {
                                                      _model.pickedRole =
                                                          _model.roleOutput;
                                                    });
                                                    logFirebaseEvent(
                                                        'Container_update_page_state');
                                                    setState(() {
                                                      _model.isRoleValid = true;
                                                    });
                                                  }

                                                  setState(() {});
                                                },
                                                child: Container(
                                                  height: 52.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color: _model.isRoleValid
                                                          ? Color(0x00000000)
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                    ),
                                                  ),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .pseudoDropDownModel,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: PseudoDropDownWidget(
                                                      defText: 'Role',
                                                      text: _model.pickedRole,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 19.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if ((getCurrentTimestamp >
                                                    functions.timeMinusMinutes(
                                                        functions.getSameTime(
                                                            getRemoteConfigInt(
                                                                'unixTimeSecForInterview'),
                                                            getCurrentTimestamp)!,
                                                        '5')) ||
                                                (getCurrentTimestamp <
                                                    functions.timeMinusMinutes(
                                                        functions.getSameTime(
                                                            getRemoteConfigInt(
                                                                'unixTimeSecForInterview'),
                                                            getCurrentTimestamp)!,
                                                        '1435')))
                                              Builder(
                                                builder: (context) =>
                                                    FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'PRACTICE_INTERVIEW_GUIDE_JOIN_NOW_BTN_ON');
                                                    var _shouldSetState = false;
                                                    logFirebaseEvent(
                                                        'Button_backend_call');

                                                    await interviewParticipantsItemInterviewParticipantsOfDayRecord!
                                                        .reference
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'joined_users':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            currentUserReference
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                    if ((interviewParticipantsItemInterviewParticipantsOfDayRecord !=
                                                            null) &&
                                                        (interviewParticipantsItemInterviewParticipantsOfDayRecord!
                                                                .participants
                                                                .where((e) =>
                                                                    e.user ==
                                                                    currentUserReference)
                                                                .toList()
                                                                .length >
                                                            0)) {
                                                      if (confirenceRoomItemConferenceRoomRecord !=
                                                          null) {
                                                        logFirebaseEvent(
                                                            'Button_action_block');
                                                        await _model
                                                            .roomConnection(
                                                          context,
                                                          roomID:
                                                              confirenceRoomItemConferenceRoomRecord
                                                                  ?.reference
                                                                  .id,
                                                          uid: random_data
                                                              .randomInteger(
                                                                  10, 1000),
                                                          userRef:
                                                              confirenceRoomItemConferenceRoomRecord
                                                                  ?.users
                                                                  ?.where((e) =>
                                                                      e !=
                                                                      currentUserReference)
                                                                  .toList()
                                                                  ?.first,
                                                          role:
                                                              confirenceRoomItemConferenceRoomRecord
                                                                  ?.role,
                                                          roomDoc:
                                                              confirenceRoomItemConferenceRoomRecord,
                                                        );
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Button_firestore_query');
                                                        _model.secondAttemptRoomQueryOutput =
                                                            await queryConferenceRoomRecordOnce(
                                                          queryBuilder:
                                                              (conferenceRoomRecord) =>
                                                                  conferenceRoomRecord
                                                                      .where(
                                                                        'date',
                                                                        isEqualTo: functions.getSameTime(
                                                                            getRemoteConfigInt('unixTimeSecForInterview'),
                                                                            getCurrentTimestamp),
                                                                      )
                                                                      .where(
                                                                        'users',
                                                                        arrayContains:
                                                                            currentUserReference,
                                                                      ),
                                                          singleRecord: true,
                                                        ).then((s) =>
                                                                s.firstOrNull);
                                                        _shouldSetState = true;
                                                        if (_model
                                                                .secondAttemptRoomQueryOutput
                                                                ?.reference !=
                                                            null) {
                                                          logFirebaseEvent(
                                                              'Button_action_block');
                                                          await _model
                                                              .roomConnection(
                                                            context,
                                                            roomID: _model
                                                                .secondAttemptRoomQueryOutput
                                                                ?.reference
                                                                .id,
                                                            uid: random_data
                                                                .randomInteger(
                                                                    10, 1000),
                                                            userRef: _model
                                                                .secondAttemptRoomQueryOutput
                                                                ?.users
                                                                ?.where((e) =>
                                                                    e !=
                                                                    currentUserReference)
                                                                .toList()
                                                                ?.first,
                                                            role: _model
                                                                .secondAttemptRoomQueryOutput
                                                                ?.role,
                                                            roomDoc: _model
                                                                .secondAttemptRoomQueryOutput,
                                                          );
                                                        } else {
                                                          if ((interviewParticipantsItemInterviewParticipantsOfDayRecord!
                                                                      .participants
                                                                      .where((e) =>
                                                                          e.user !=
                                                                          currentUserReference)
                                                                      .toList()
                                                                      .length >
                                                                  interviewParticipantsItemInterviewParticipantsOfDayRecord!
                                                                      .takenUsers
                                                                      .length) &&
                                                              (interviewParticipantsItemInterviewParticipantsOfDayRecord!
                                                                      .participants
                                                                      .where((e) =>
                                                                          !interviewParticipantsItemInterviewParticipantsOfDayRecord!.takenUsers.contains(e
                                                                              .user) &&
                                                                          functions.checkUserKarmaMatch(
                                                                              valueOrDefault(currentUserDocument?.karma, 0.0),
                                                                              e.karma) &&
                                                                          (e.user != currentUserReference) &&
                                                                          (e.role == interviewParticipantsItemInterviewParticipantsOfDayRecord?.participants?.where((e) => e.user == currentUserReference).toList()?.first?.role))
                                                                      .toList()
                                                                      .length >
                                                                  0)) {
                                                            logFirebaseEvent(
                                                                'Button_backend_call');

                                                            var conferenceRoomRecordReference =
                                                                ConferenceRoomRecord
                                                                    .collection
                                                                    .doc();
                                                            await conferenceRoomRecordReference
                                                                .set({
                                                              ...createConferenceRoomRecordData(
                                                                date: functions.getSameTime(
                                                                    getRemoteConfigInt(
                                                                        'unixTimeSecForInterview'),
                                                                    getCurrentTimestamp),
                                                                role: interviewParticipantsItemInterviewParticipantsOfDayRecord
                                                                    ?.participants
                                                                    ?.where((e) =>
                                                                        e.user ==
                                                                        currentUserReference)
                                                                    .toList()
                                                                    ?.first
                                                                    ?.role,
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'users': [
                                                                    interviewParticipantsItemInterviewParticipantsOfDayRecord
                                                                        ?.participants
                                                                        ?.where((e) =>
                                                                            !interviewParticipantsItemInterviewParticipantsOfDayRecord!.takenUsers.contains(e.user) &&
                                                                            functions.checkUserKarmaMatch(valueOrDefault(currentUserDocument?.karma, 0.0),
                                                                                e.karma) &&
                                                                            (e.user != currentUserReference) &&
                                                                            (e.role == interviewParticipantsItemInterviewParticipantsOfDayRecord?.participants?.where((e) => e.user == currentUserReference).toList()?.first?.role))
                                                                        .toList()
                                                                        ?.first
                                                                        ?.user
                                                                  ],
                                                                },
                                                              ),
                                                            });
                                                            _model.createdRoomOutput =
                                                                ConferenceRoomRecord
                                                                    .getDocumentFromData({
                                                              ...createConferenceRoomRecordData(
                                                                date: functions.getSameTime(
                                                                    getRemoteConfigInt(
                                                                        'unixTimeSecForInterview'),
                                                                    getCurrentTimestamp),
                                                                role: interviewParticipantsItemInterviewParticipantsOfDayRecord
                                                                    ?.participants
                                                                    ?.where((e) =>
                                                                        e.user ==
                                                                        currentUserReference)
                                                                    .toList()
                                                                    ?.first
                                                                    ?.role,
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'users': [
                                                                    interviewParticipantsItemInterviewParticipantsOfDayRecord
                                                                        ?.participants
                                                                        ?.where((e) =>
                                                                            !interviewParticipantsItemInterviewParticipantsOfDayRecord!.takenUsers.contains(e.user) &&
                                                                            functions.checkUserKarmaMatch(valueOrDefault(currentUserDocument?.karma, 0.0),
                                                                                e.karma) &&
                                                                            (e.user != currentUserReference) &&
                                                                            (e.role == interviewParticipantsItemInterviewParticipantsOfDayRecord?.participants?.where((e) => e.user == currentUserReference).toList()?.first?.role))
                                                                        .toList()
                                                                        ?.first
                                                                        ?.user
                                                                  ],
                                                                },
                                                              ),
                                                            }, conferenceRoomRecordReference);
                                                            _shouldSetState =
                                                                true;
                                                            logFirebaseEvent(
                                                                'Button_backend_call');

                                                            await interviewParticipantsItemInterviewParticipantsOfDayRecord!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'taken_users':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    _model
                                                                        .createdRoomOutput
                                                                        ?.users
                                                                        ?.first
                                                                  ]),
                                                                },
                                                              ),
                                                            });
                                                            logFirebaseEvent(
                                                                'Button_backend_call');

                                                            await _model
                                                                .createdRoomOutput!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'users':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    currentUserReference
                                                                  ]),
                                                                },
                                                              ),
                                                            });
                                                            logFirebaseEvent(
                                                                'Button_backend_call');

                                                            await interviewParticipantsItemInterviewParticipantsOfDayRecord!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'taken_users':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    currentUserReference
                                                                  ]),
                                                                },
                                                              ),
                                                            });
                                                            logFirebaseEvent(
                                                                'Button_action_block');
                                                            await _model
                                                                .roomConnection(
                                                              context,
                                                              roomID: _model
                                                                  .createdRoomOutput
                                                                  ?.reference
                                                                  .id,
                                                              uid: random_data
                                                                  .randomInteger(
                                                                      10, 1000),
                                                              userRef: _model
                                                                  .createdRoomOutput
                                                                  ?.users
                                                                  ?.where((e) =>
                                                                      e !=
                                                                      currentUserReference)
                                                                  .toList()
                                                                  ?.first,
                                                              role: _model
                                                                  .createdRoomOutput
                                                                  ?.role,
                                                              roomDoc: _model
                                                                  .createdRoomOutput,
                                                            );
                                                          } else {
                                                            logFirebaseEvent(
                                                                'Button_alert_dialog');
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      WebViewAware(
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap: () => _model
                                                                              .unfocusNode
                                                                              .canRequestFocus
                                                                          ? FocusScope.of(context).requestFocus(_model
                                                                              .unfocusNode)
                                                                          : FocusScope.of(context)
                                                                              .unfocus(),
                                                                      child:
                                                                          NoUserFoundDialogWidget(),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));

                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          }
                                                        }
                                                      }
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Button_alert_dialog');
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child: WebViewAware(
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child:
                                                                    SorryDialogWidget(),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));

                                                      if (_shouldSetState)
                                                        setState(() {});
                                                      return;
                                                    }

                                                    if (_shouldSetState)
                                                      setState(() {});
                                                  },
                                                  text: 'Join now',
                                                  options: FFButtonOptions(
                                                    width: double.infinity,
                                                    height: 52.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              'Sofia Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .white,
                                                          useGoogleFonts: false,
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                ),
                                              ),
                                            if (!((getCurrentTimestamp >
                                                        functions.timeMinusMinutes(
                                                            functions.getSameTime(
                                                                getRemoteConfigInt(
                                                                    'unixTimeSecForInterview'),
                                                                getCurrentTimestamp)!,
                                                            '5')) ||
                                                    (getCurrentTimestamp <
                                                        functions.timeMinusMinutes(
                                                            functions.getSameTime(
                                                                getRemoteConfigInt(
                                                                    'unixTimeSecForInterview'),
                                                                getCurrentTimestamp)!,
                                                            '1435'))) &&
                                                responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                  tabletLandscape: false,
                                                  desktop: false,
                                                ))
                                              FFButtonWidget(
                                                onPressed: ((interviewParticipantsItemInterviewParticipantsOfDayRecord !=
                                                            null) &&
                                                        (interviewParticipantsItemInterviewParticipantsOfDayRecord!
                                                                .participants
                                                                .where((e) =>
                                                                    e.user ==
                                                                    currentUserReference)
                                                                .toList()
                                                                .length >
                                                            0))
                                                    ? null
                                                    : () async {
                                                        logFirebaseEvent(
                                                            'PRACTICE_INTERVIEW_GUIDE_GET_REMINDER_BT');
                                                        if ((valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.interviewSessions,
                                                                    0) >=
                                                                2) &&
                                                            !revenue_cat
                                                                .activeEntitlementIds
                                                                .contains(
                                                                    FFAppState()
                                                                        .entitlementID)) {
                                                          logFirebaseEvent(
                                                              'Button_navigate_to');

                                                          context.pushNamed(
                                                            'Pricing',
                                                            queryParameters: {
                                                              'offers':
                                                                  serializeParam(
                                                                PaywallPrice
                                                                    .standard,
                                                                ParamType.Enum,
                                                              ),
                                                            }.withoutNulls,
                                                          );

                                                          return;
                                                        }
                                                        if (_model.pickedRole !=
                                                                null &&
                                                            _model.pickedRole !=
                                                                '') {
                                                          logFirebaseEvent(
                                                              'Button_update_page_state');
                                                          setState(() {
                                                            _model.isRoleValid =
                                                                true;
                                                          });
                                                        } else {
                                                          logFirebaseEvent(
                                                              'Button_update_page_state');
                                                          setState(() {
                                                            _model.isRoleValid =
                                                                false;
                                                          });
                                                          return;
                                                        }

                                                        if (interviewParticipantsItemInterviewParticipantsOfDayRecord
                                                                ?.date ==
                                                            functions.getSameTime(
                                                                getRemoteConfigInt(
                                                                    'unixTimeSecForInterview'),
                                                                getCurrentTimestamp)) {
                                                          logFirebaseEvent(
                                                              'Button_backend_call');

                                                          await interviewParticipantsItemInterviewParticipantsOfDayRecord!
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'participants':
                                                                    FieldValue
                                                                        .arrayUnion([
                                                                  getInterviewParticipantFirestoreData(
                                                                    createInterviewParticipantStruct(
                                                                      user:
                                                                          currentUserReference,
                                                                      karma: valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.karma,
                                                                          0.0),
                                                                      role: _model
                                                                          .pickedRole,
                                                                      clearUnsetFields:
                                                                          false,
                                                                    ),
                                                                    true,
                                                                  )
                                                                ]),
                                                              },
                                                            ),
                                                          });
                                                        } else {
                                                          logFirebaseEvent(
                                                              'Button_backend_call');

                                                          await InterviewParticipantsOfDayRecord
                                                              .collection
                                                              .doc()
                                                              .set({
                                                            ...createInterviewParticipantsOfDayRecordData(
                                                              date: functions.getSameTime(
                                                                  getRemoteConfigInt(
                                                                      'unixTimeSecForInterview'),
                                                                  getCurrentTimestamp),
                                                              isChecked: false,
                                                            ),
                                                            ...mapToFirestore(
                                                              {
                                                                'participants':
                                                                    [
                                                                  getInterviewParticipantFirestoreData(
                                                                    updateInterviewParticipantStruct(
                                                                      InterviewParticipantStruct(
                                                                        user:
                                                                            currentUserReference,
                                                                        karma: valueOrDefault(
                                                                            currentUserDocument?.karma,
                                                                            0.0),
                                                                        role: _model
                                                                            .pickedRole,
                                                                      ),
                                                                      clearUnsetFields:
                                                                          false,
                                                                      create:
                                                                          true,
                                                                    ),
                                                                    true,
                                                                  )
                                                                ],
                                                              },
                                                            ),
                                                          });
                                                        }

                                                        logFirebaseEvent(
                                                            'Button_navigate_to');

                                                        context.pushNamed(
                                                            'ReminderPage');
                                                      },
                                                text: 'Get Reminder',
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 52.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily: 'Sofia Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .white,
                                                        useGoogleFonts: false,
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  disabledColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent2,
                                                  disabledTextColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent3,
                                                ),
                                              ),
                                            if (!((getCurrentTimestamp >
                                                    functions.timeMinusMinutes(
                                                        functions.getSameTime(
                                                            getRemoteConfigInt(
                                                                'unixTimeSecForInterview'),
                                                            getCurrentTimestamp)!,
                                                        '5')) ||
                                                (getCurrentTimestamp <
                                                    functions.timeMinusMinutes(
                                                        functions.getSameTime(
                                                            getRemoteConfigInt(
                                                                'unixTimeSecForInterview'),
                                                            getCurrentTimestamp)!,
                                                        '1435'))))
                                              Builder(
                                                builder: (context) {
                                                  if (!((interviewParticipantsItemInterviewParticipantsOfDayRecord !=
                                                          null) &&
                                                      (interviewParticipantsItemInterviewParticipantsOfDayRecord!
                                                              .participants
                                                              .where((e) =>
                                                                  e.user ==
                                                                  currentUserReference)
                                                              .toList()
                                                              .length >
                                                          0))) {
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'PRACTICE_INTERVIEW_GUIDE_Container_ad0rb');
                                                        if (_model
                                                            .getReminderButtonState) {
                                                          logFirebaseEvent(
                                                              'Container_update_page_state');
                                                          setState(() {
                                                            _model.getReminderButtonState =
                                                                false;
                                                          });
                                                          if ((valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.interviewSessions,
                                                                      0) >=
                                                                  2) &&
                                                              !revenue_cat
                                                                  .activeEntitlementIds
                                                                  .contains(
                                                                      FFAppState()
                                                                          .entitlementID)) {
                                                            logFirebaseEvent(
                                                                'Container_navigate_to');

                                                            context.pushNamed(
                                                              'Pricing',
                                                              queryParameters: {
                                                                'offers':
                                                                    serializeParam(
                                                                  PaywallPrice
                                                                      .standard,
                                                                  ParamType
                                                                      .Enum,
                                                                ),
                                                              }.withoutNulls,
                                                            );

                                                            logFirebaseEvent(
                                                                'Container_update_page_state');
                                                            setState(() {
                                                              _model.getReminderButtonState =
                                                                  true;
                                                            });
                                                            return;
                                                          }
                                                          if (_model.pickedRole !=
                                                                  null &&
                                                              _model.pickedRole !=
                                                                  '') {
                                                            logFirebaseEvent(
                                                                'Container_update_page_state');
                                                            setState(() {
                                                              _model.isRoleValid =
                                                                  true;
                                                            });
                                                          } else {
                                                            logFirebaseEvent(
                                                                'Container_update_page_state');
                                                            setState(() {
                                                              _model.isRoleValid =
                                                                  false;
                                                            });
                                                            logFirebaseEvent(
                                                                'Container_update_page_state');
                                                            setState(() {
                                                              _model.getReminderButtonState =
                                                                  true;
                                                            });
                                                            return;
                                                          }

                                                          if (interviewParticipantsItemInterviewParticipantsOfDayRecord
                                                                  ?.date ==
                                                              functions.getSameTime(
                                                                  getRemoteConfigInt(
                                                                      'unixTimeSecForInterview'),
                                                                  getCurrentTimestamp)) {
                                                            logFirebaseEvent(
                                                                'Container_backend_call');

                                                            await interviewParticipantsItemInterviewParticipantsOfDayRecord!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'participants':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    getInterviewParticipantFirestoreData(
                                                                      createInterviewParticipantStruct(
                                                                        user:
                                                                            currentUserReference,
                                                                        karma: valueOrDefault(
                                                                            currentUserDocument?.karma,
                                                                            0.0),
                                                                        role: _model
                                                                            .pickedRole,
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                      true,
                                                                    )
                                                                  ]),
                                                                },
                                                              ),
                                                            });
                                                          } else {
                                                            logFirebaseEvent(
                                                                'Container_backend_call');

                                                            await InterviewParticipantsOfDayRecord
                                                                .collection
                                                                .doc()
                                                                .set({
                                                              ...createInterviewParticipantsOfDayRecordData(
                                                                date: functions.getSameTime(
                                                                    getRemoteConfigInt(
                                                                        'unixTimeSecForInterview'),
                                                                    getCurrentTimestamp),
                                                                isChecked:
                                                                    false,
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'participants':
                                                                      [
                                                                    getInterviewParticipantFirestoreData(
                                                                      updateInterviewParticipantStruct(
                                                                        InterviewParticipantStruct(
                                                                          user:
                                                                              currentUserReference,
                                                                          karma: valueOrDefault(
                                                                              currentUserDocument?.karma,
                                                                              0.0),
                                                                          role:
                                                                              _model.pickedRole,
                                                                        ),
                                                                        clearUnsetFields:
                                                                            false,
                                                                        create:
                                                                            true,
                                                                      ),
                                                                      true,
                                                                    )
                                                                  ],
                                                                },
                                                              ),
                                                            });
                                                          }

                                                          logFirebaseEvent(
                                                              'Container_update_page_state');
                                                          setState(() {
                                                            _model.getReminderButtonState =
                                                                true;
                                                          });
                                                          logFirebaseEvent(
                                                              'Container_navigate_to');

                                                          context.pushNamed(
                                                              'ReminderPage');
                                                        }
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 52.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .gradient2,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .aquaBreeze
                                                            ],
                                                            stops: [0.0, 1.0],
                                                            begin:
                                                                AlignmentDirectional(
                                                                    0.0, 1.0),
                                                            end:
                                                                AlignmentDirectional(
                                                                    0, -1.0),
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          'Get Reminder',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Sofia Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ),
                                                    );
                                                  } else {
                                                    return Container(
                                                      width: double.infinity,
                                                      height: 52.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        'Get Reminder',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Sofia Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent3,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ).addWalkthrough(
                                    column2axfwjh6,
                                    _model.guideInterveiw4Controller,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 19.0, 0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            if (getCurrentTimestamp <
                                functions.timeMinusMinutes(
                                    functions.getSameTime(
                                        getRemoteConfigInt(
                                            'unixTimeSecForInterview'),
                                        getCurrentTimestamp)!,
                                    '30')) {
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FFIcons.kclarityCalendarLine,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      '7:00 PM +04 GST every day',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall,
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FFIcons.kclarityCalendarLine,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Interview starts in',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: FlutterFlowTimer(
                                      initialTime: functions.subtractTime(
                                          functions.getSameTime(
                                              getRemoteConfigInt(
                                                  'unixTimeSecForInterview'),
                                              getCurrentTimestamp)!,
                                          getCurrentTimestamp),
                                      getDisplayTime: (value) =>
                                          StopWatchTimer.getDisplayTime(
                                        value,
                                        hours: false,
                                        milliSecond: false,
                                      ),
                                      controller: _model.timerController,
                                      updateStateInterval:
                                          Duration(milliseconds: 1000),
                                      onChanged:
                                          (value, displayTime, shouldUpdate) {
                                        _model.timerMilliseconds = value;
                                        _model.timerValue = displayTime;
                                        if (shouldUpdate) setState(() {});
                                      },
                                      onEnded: () async {
                                        logFirebaseEvent(
                                            'PRACTICE_INTERVIEW_GUIDE_Timer_u5an0oqd_');
                                        logFirebaseEvent(
                                            'Timer_update_page_state');
                                        setState(() {
                                          _model.timer = true;
                                        });
                                      },
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall,
                                    ),
                                  ),
                                ],
                              );
                            }
                          },
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 42.0, 0.0, 0.0),
                          child: Text(
                            'Want to practice mock interviews with an expert coach?',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'PRACTICE_INTERVIEW_GUIDE_Text_igjns1ou_O');
                              logFirebaseEvent('Text_navigate_to');

                              context.pushNamed('Add-ons');
                            },
                            child: Text(
                              'Learn More',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Sofia Pro',
                                    color:
                                        FlutterFlowTheme.of(context).aquaBreeze,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 37.0, 0.0, 0.0),
                          child: Text(
                            'FAQ',
                            style: FlutterFlowTheme.of(context).headlineLarge,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Divider(
                                thickness: 3.0,
                                color: Color(0x4DD8DADC),
                              ),
                              Container(
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Container(
                                    width: double.infinity,
                                    color: Color(0x00000000),
                                    child: ExpandableNotifier(
                                      controller: _model.expandableController1,
                                      child: ExpandablePanel(
                                        header: Text(
                                          'What would happen if I missed Practice Interview?',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium,
                                        ),
                                        collapsed: Container(
                                          decoration: BoxDecoration(),
                                        ),
                                        expanded: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 0.0),
                                          child: Text(
                                            'Ooh that\'s sad to hear! We understand that plans can change, however we want you to know that your no show up will leave potential Practice Partner without opportunity to improve and practice. That’s why we do not recommend missing a Practice Interview that you registered for. To encourage practice more Quis giving a reward of +0.5 Karma and penalty for no show -0.5 Karma.',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Sofia Pro',
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.16,
                                                ),
                                          ),
                                        ),
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: false,
                                          tapBodyToCollapse: false,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: true,
                                          expandIcon: FFIcons.kplus,
                                          collapseIcon: FFIcons.kxmark,
                                          iconSize: 24.0,
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 3.0,
                                color: Color(0x4DD8DADC),
                              ),
                              Container(
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Container(
                                    width: double.infinity,
                                    color: Color(0x00000000),
                                    child: ExpandableNotifier(
                                      controller: _model.expandableController2,
                                      child: ExpandablePanel(
                                        header: Text(
                                          'How does matching happen?',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium,
                                        ),
                                        collapsed: Container(
                                          decoration: BoxDecoration(),
                                        ),
                                        expanded: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 0.0),
                                          child: RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      'Matching happened based on your Karma level. To know more about Practice Interview Matching please visit our ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall,
                                                ),
                                                TextSpan(
                                                  text:
                                                      'Karma & Karma Exchange page',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Sofia Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        useGoogleFonts: false,
                                                      ),
                                                  mouseCursor:
                                                      SystemMouseCursors.click,
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () async {
                                                          logFirebaseEvent(
                                                              'PRACTICE_INTERVIEW_GUIDE_RichTextSpan_l5');
                                                          logFirebaseEvent(
                                                              'RichTextSpan_launch_u_r_l');
                                                          await launchURL(
                                                              'https://quisapp.notion.site/Karma-Karma-Exchange-5327c89c0dc04558add1d77aef5586b1');
                                                        },
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Sofia Pro',
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.16,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: false,
                                          tapBodyToCollapse: false,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: true,
                                          expandIcon: FFIcons.kplus,
                                          collapseIcon: FFIcons.kxmark,
                                          iconSize: 24.0,
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 3.0,
                                color: Color(0x4DD8DADC),
                              ),
                              Container(
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Container(
                                    width: double.infinity,
                                    color: Color(0x00000000),
                                    child: ExpandableNotifier(
                                      controller: _model.expandableController3,
                                      child: ExpandablePanel(
                                        header: Text(
                                          'I didn’t like my Practice partner, what should I do?',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium,
                                        ),
                                        collapsed: Container(
                                          decoration: BoxDecoration(),
                                        ),
                                        expanded: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 0.0),
                                          child: Text(
                                            'After every Practice Interview everyone is prompted to share their feedback, we will do our best not to match you with the same person again.',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Sofia Pro',
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.16,
                                                ),
                                          ),
                                        ),
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: false,
                                          tapBodyToCollapse: false,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: true,
                                          expandIcon: FFIcons.kplus,
                                          collapseIcon: FFIcons.kxmark,
                                          iconSize: 24.0,
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 3.0,
                                color: Color(0x4DD8DADC),
                              ),
                              Container(
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Container(
                                    width: double.infinity,
                                    color: Color(0x00000000),
                                    child: ExpandableNotifier(
                                      controller: _model.expandableController4,
                                      child: ExpandablePanel(
                                        header: Text(
                                          'Can I get contact details of a person after a Practice Interview?',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium,
                                        ),
                                        collapsed: Container(
                                          decoration: BoxDecoration(),
                                        ),
                                        expanded: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 0.0),
                                          child: Text(
                                            'Yes! You will be directed to a swipe stage where both Practice Partners to match, if both Partners choose to network, you will be revealed with a LinkedIn profile link where you continue to network. You may find “People I matched with” in your User Profile.',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Sofia Pro',
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.16,
                                                ),
                                          ),
                                        ),
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: false,
                                          tapBodyToCollapse: false,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: true,
                                          expandIcon: FFIcons.kplus,
                                          collapseIcon: FFIcons.kxmark,
                                          iconSize: 24.0,
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 3.0,
                                color: Color(0x4DD8DADC),
                              ),
                              Container(
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Container(
                                    width: double.infinity,
                                    color: Color(0x00000000),
                                    child: ExpandableNotifier(
                                      controller: _model.expandableController5,
                                      child: ExpandablePanel(
                                        header: Text(
                                          'I got additional “Thumps Up” after Practice Interview, what does it mean?',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium,
                                        ),
                                        collapsed: Container(
                                          decoration: BoxDecoration(),
                                        ),
                                        expanded: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 0.0),
                                          child: Text(
                                            'Here at Quis we call it “Endorsement”. They are the indication of a great Practice Interview experience partner. You can view all stats by navigating to the Leadership Board.',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Sofia Pro',
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.16,
                                                ),
                                          ),
                                        ),
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: false,
                                          tapBodyToCollapse: false,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: true,
                                          expandIcon: FFIcons.kplus,
                                          collapseIcon: FFIcons.kxmark,
                                          iconSize: 24.0,
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ].addToEnd(SizedBox(height: 150.0)),
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

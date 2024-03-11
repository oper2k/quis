import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
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
import 'practice_interview_guide_widget.dart' show PracticeInterviewGuideWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PracticeInterviewGuideModel
    extends FlutterFlowModel<PracticeInterviewGuideWidget> {
  ///  Local state fields for this page.

  String? pickedRole;

  bool isRoleValid = true;

  bool timer = false;

  String? roomID;

  bool getReminderButtonState = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  TutorialCoachMark? guideInterveiw4Controller;
  // Stores action output result for [Bottom Sheet - pickBottomSheet] action in Container widget.
  String? roleOutput;
  // Model for pseudoDropDown component.
  late PseudoDropDownModel pseudoDropDownModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ConferenceRoomRecord? secondAttemptRoomQueryOutput;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ConferenceRoomRecord? createdRoomOutput;
  // State field(s) for Timer widget.
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController3;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController4;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController5;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    pseudoDropDownModel = createModel(context, () => PseudoDropDownModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    guideInterveiw4Controller?.finish();
    pseudoDropDownModel.dispose();
    timerController.dispose();
    expandableController1.dispose();
    expandableController2.dispose();
    expandableController3.dispose();
    expandableController4.dispose();
    expandableController5.dispose();
  }

  /// Action blocks are added here.

  Future roomConnection(
    BuildContext context, {
    String? roomID,
    int? uid,
    required DocumentReference? userRef,
    required String? role,
    required ConferenceRoomRecord? roomDoc,
  }) async {
    GenerateRtcTokenCallCloudFunctionCallResponse? cloudFunctions90;

    logFirebaseEvent('roomConnection_cloud_function');
    try {
      final result = await FirebaseFunctions.instance
          .httpsCallable('generateRtcTokenCall')
          .call({
        "channelName": roomID!,
        "uid": uid!,
      });
      cloudFunctions90 = GenerateRtcTokenCallCloudFunctionCallResponse(
        data: result.data,
        succeeded: true,
        resultAsString: result.data.toString(),
        jsonBody: result.data,
      );
    } on FirebaseFunctionsException catch (error) {
      cloudFunctions90 = GenerateRtcTokenCallCloudFunctionCallResponse(
        errorCode: error.code,
        succeeded: false,
      );
    }

    if (cloudFunctions90!.succeeded!) {
      logFirebaseEvent('roomConnection_navigate_to');

      context.pushNamed(
        'VideoConfPage',
        queryParameters: {
          'token': serializeParam(
            cloudFunctions90?.resultAsString,
            ParamType.String,
          ),
          'channelName': serializeParam(
            roomID,
            ParamType.String,
          ),
          'userProfileImage': serializeParam(
            currentUserPhoto,
            ParamType.String,
          ),
          'uid': serializeParam(
            uid,
            ParamType.int,
          ),
          'userRef': serializeParam(
            userRef,
            ParamType.DocumentReference,
          ),
          'role': serializeParam(
            role,
            ParamType.String,
          ),
          'roomDoc': serializeParam(
            roomDoc,
            ParamType.Document,
          ),
        }.withoutNulls,
        extra: <String, dynamic>{
          'roomDoc': roomDoc,
        },
      );
    } else {
      logFirebaseEvent('roomConnection_show_snack_bar');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Internal Error',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
    }
  }

  /// Additional helper methods are added here.

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          logFirebaseEvent('PRACTICE_INTERVIEW_GUIDE_PracticeIntervi');
          logFirebaseEvent('PracticeInterviewGuide_navigate_to');

          context.goNamed(
            'Home',
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );
        },
        onSkip: () {
          logFirebaseEvent('PRACTICE_INTERVIEW_GUIDE_PracticeIntervi');
          logFirebaseEvent('PracticeInterviewGuide_navigate_to');

          context.goNamed(
            'Home',
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );

          return true;
        },
      );
}

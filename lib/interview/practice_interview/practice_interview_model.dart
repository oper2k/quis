import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/components/nav_bar_widget.dart';
import '/components/pseudo_drop_down_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'practice_interview_widget.dart' show PracticeInterviewWidget;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class PracticeInterviewModel extends FlutterFlowModel<PracticeInterviewWidget> {
  ///  Local state fields for this page.

  String? pickedRole;

  bool isRoleValid = true;

  bool timer = false;

  String? roomID;

  bool getReminderButtonState = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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

  // Model for navBar component.
  late NavBarModel navBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    pseudoDropDownModel = createModel(context, () => PseudoDropDownModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    pseudoDropDownModel.dispose();
    timerController.dispose();
    expandableController1.dispose();
    expandableController2.dispose();
    expandableController3.dispose();
    expandableController4.dispose();
    expandableController5.dispose();
    navBarModel.dispose();
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

    if (cloudFunctions90.succeeded!) {
      logFirebaseEvent('roomConnection_navigate_to');

      context.pushNamed(
        'VideoConfPage',
        queryParameters: {
          'token': serializeParam(
            cloudFunctions90.resultAsString,
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
          duration: const Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
    }
  }

  /// Additional helper methods are added here.
}

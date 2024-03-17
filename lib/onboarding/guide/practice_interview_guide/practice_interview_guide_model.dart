import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'practice_interview_guide_widget.dart' show PracticeInterviewGuideWidget;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class PracticeInterviewGuideModel
    extends FlutterFlowModel<PracticeInterviewGuideWidget> {
  ///  Local state fields for this page.

  String? pickedRole;

  bool isRoleValid = true;

  bool timer = false;

  String? roomID;

  bool getReminderButtonState = true;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? guideInterveiw4Controller;
  final unfocusNode = FocusNode();
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
  void initState(BuildContext context) {}

  @override
  void dispose() {
    guideInterveiw4Controller?.finish();
    unfocusNode.dispose();
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

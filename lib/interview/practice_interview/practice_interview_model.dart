import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav_bar_widget.dart';
import '/components/no_user_found_dialog_widget.dart';
import '/components/pick_bottom_sheet_widget.dart';
import '/components/pseudo_drop_down_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/interview/reminder_dialog/reminder_dialog_widget.dart';
import '/interview/sorry_dialog/sorry_dialog_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'practice_interview_widget.dart' show PracticeInterviewWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PracticeInterviewModel extends FlutterFlowModel<PracticeInterviewWidget> {
  ///  Local state fields for this page.

  String? pickedRole;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Bottom Sheet - pickBottomSheet] action in Container widget.
  String? roleOutput;
  // Model for pseudoDropDown component.
  late PseudoDropDownModel pseudoDropDownModel;
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

  void initState(BuildContext context) {
    pseudoDropDownModel = createModel(context, () => PseudoDropDownModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

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

  /// Additional helper methods are added here.
}

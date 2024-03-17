import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'video_conf_page_widget.dart' show VideoConfPageWidget;
import 'package:flutter/material.dart';

class VideoConfPageModel extends FlutterFlowModel<VideoConfPageWidget> {
  ///  Local state fields for this page.

  bool isIntro = true;

  bool isUser1 = false;

  bool isUser2 = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for InitialTimer widget.
  int initialTimerMilliseconds = 2700000;
  String initialTimerValue = StopWatchTimer.getDisplayTime(
    2700000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController initialTimerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // State field(s) for IntroTimer widget.
  int introTimerMilliseconds = 0;
  String introTimerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController introTimerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // State field(s) for User1Timer widget.
  int user1TimerMilliseconds = 0;
  String user1TimerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController user1TimerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // State field(s) for User2Timer widget.
  int user2TimerMilliseconds = 0;
  String user2TimerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController user2TimerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    initialTimerController.dispose();
    introTimerController.dispose();
    user1TimerController.dispose();
    user2TimerController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

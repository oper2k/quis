import '/components/avatar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_guide1_widget.dart' show HomeGuide1Widget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class HomeGuide1Model extends FlutterFlowModel<HomeGuide1Widget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? guideHome1Controller;
  final unfocusNode = FocusNode();
  // Model for avatar component.
  late AvatarModel avatarModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    avatarModel = createModel(context, () => AvatarModel());
  }

  @override
  void dispose() {
    guideHome1Controller?.finish();
    unfocusNode.dispose();
    avatarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

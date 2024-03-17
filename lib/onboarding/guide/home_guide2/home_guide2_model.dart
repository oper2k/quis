import '/components/avatar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_guide2_widget.dart' show HomeGuide2Widget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class HomeGuide2Model extends FlutterFlowModel<HomeGuide2Widget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? guideHome4Controller;
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
    guideHome4Controller?.finish();
    unfocusNode.dispose();
    avatarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

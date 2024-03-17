import '/components/avatar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'leadership_widget.dart' show LeadershipWidget;
import 'package:flutter/material.dart';

class LeadershipModel extends FlutterFlowModel<LeadershipWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for avatar component.
  late AvatarModel avatarModel1;
  // Model for avatar component.
  late AvatarModel avatarModel2;
  // Model for avatar component.
  late AvatarModel avatarModel3;
  // Model for avatar component.
  late AvatarModel avatarModel4;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    avatarModel1 = createModel(context, () => AvatarModel());
    avatarModel2 = createModel(context, () => AvatarModel());
    avatarModel3 = createModel(context, () => AvatarModel());
    avatarModel4 = createModel(context, () => AvatarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    avatarModel1.dispose();
    avatarModel2.dispose();
    avatarModel3.dispose();
    avatarModel4.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

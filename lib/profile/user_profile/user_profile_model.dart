import '/components/avatar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_profile_widget.dart' show UserProfileWidget;
import 'package:flutter/material.dart';

class UserProfileModel extends FlutterFlowModel<UserProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for avatar component.
  late AvatarModel avatarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    avatarModel = createModel(context, () => AvatarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    avatarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

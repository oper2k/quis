import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/components/avatar_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'my_profile_widget.dart' show MyProfileWidget;
import 'package:flutter/material.dart';

class MyProfileModel extends FlutterFlowModel<MyProfileWidget> {
  ///  Local state fields for this page.

  int? videoCallId;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for avatar component.
  late AvatarModel avatarModel;
  // Stores action output result for [Cloud Function - generateRtcTokenCall] action in Container widget.
  GenerateRtcTokenCallCloudFunctionCallResponse? cloudFunctions63;
  // Model for navBar component.
  late NavBarModel navBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    avatarModel = createModel(context, () => AvatarModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    avatarModel.dispose();
    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

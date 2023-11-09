import '/backend/backend.dart';
import '/components/avatar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'user_profile_widget.dart' show UserProfileWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserProfileModel extends FlutterFlowModel<UserProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for avatar component.
  late AvatarModel avatarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    avatarModel = createModel(context, () => AvatarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    avatarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

import '/backend/backend.dart';
import '/components/avatar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'leadership_orig_widget.dart' show LeadershipOrigWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LeadershipOrigModel extends FlutterFlowModel<LeadershipOrigWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for avatar component.
  late AvatarModel avatarModel1;
  // Model for avatar component.
  late AvatarModel avatarModel2;
  // Model for avatar component.
  late AvatarModel avatarModel3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    avatarModel1 = createModel(context, () => AvatarModel());
    avatarModel2 = createModel(context, () => AvatarModel());
    avatarModel3 = createModel(context, () => AvatarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    avatarModel1.dispose();
    avatarModel2.dispose();
    avatarModel3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

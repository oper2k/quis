import '/backend/api_requests/api_calls.dart';
import '/components/back_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'welcome_video_widget.dart' show WelcomeVideoWidget;
import 'package:flutter/material.dart';

class WelcomeVideoModel extends FlutterFlowModel<WelcomeVideoWidget> {
  ///  Local state fields for this page.

  bool isFavorite = false;

  bool? isLiked;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Send a scheduled email)] action in WelcomeVideo widget.
  ApiCallResponse? email;
  // Model for BackButton component.
  late BackButtonModel backButtonModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    backButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

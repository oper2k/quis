import '/components/avatar_widget.dart';
import '/components/message_element_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'video_comments_bottom_sheet_widget.dart'
    show VideoCommentsBottomSheetWidget;
import 'package:flutter/material.dart';

class VideoCommentsBottomSheetModel
    extends FlutterFlowModel<VideoCommentsBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for messageElement dynamic component.
  late FlutterFlowDynamicModels<MessageElementModel> messageElementModels;
  // Model for avatar component.
  late AvatarModel avatarModel2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    messageElementModels =
        FlutterFlowDynamicModels(() => MessageElementModel());
    avatarModel2 = createModel(context, () => AvatarModel());
  }

  @override
  void dispose() {
    messageElementModels.dispose();
    avatarModel2.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

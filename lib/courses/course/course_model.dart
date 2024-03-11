import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/course_button_widget.dart';
import '/components/video_element_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'course_widget.dart' show CourseWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CourseModel extends FlutterFlowModel<CourseWidget> {
  ///  Local state fields for this page.

  String activeButton = 'lessons';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for courseButton component.
  late CourseButtonModel courseButtonModel1;
  // Model for courseButton component.
  late CourseButtonModel courseButtonModel2;
  // Model for courseButton component.
  late CourseButtonModel courseButtonModel3;
  // Models for videoElement dynamic component.
  late FlutterFlowDynamicModels<VideoElementModel> videoElementModels1;
  // Models for videoElement dynamic component.
  late FlutterFlowDynamicModels<VideoElementModel> videoElementModels2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    courseButtonModel1 = createModel(context, () => CourseButtonModel());
    courseButtonModel2 = createModel(context, () => CourseButtonModel());
    courseButtonModel3 = createModel(context, () => CourseButtonModel());
    videoElementModels1 = FlutterFlowDynamicModels(() => VideoElementModel());
    videoElementModels2 = FlutterFlowDynamicModels(() => VideoElementModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    courseButtonModel1.dispose();
    courseButtonModel2.dispose();
    courseButtonModel3.dispose();
    videoElementModels1.dispose();
    videoElementModels2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

import '/backend/backend.dart';
import '/components/course_button_widget.dart';
import '/components/video_element_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'course_widget.dart' show CourseWidget;
import 'package:flutter/material.dart';

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

  /// Query cache managers for this widget.

  final _lessonsQueryManager = StreamRequestManager<List<CourseVideoRecord>>();
  Stream<List<CourseVideoRecord>> lessonsQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CourseVideoRecord>> Function() requestFn,
  }) =>
      _lessonsQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearLessonsQueryCache() => _lessonsQueryManager.clear();
  void clearLessonsQueryCacheKey(String? uniqueKey) =>
      _lessonsQueryManager.clearRequest(uniqueKey);

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

    /// Dispose query cache managers for this widget.

    clearLessonsQueryCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

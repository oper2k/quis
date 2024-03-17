import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'course_button_model.dart';
export 'course_button_model.dart';

class CourseButtonWidget extends StatefulWidget {
  const CourseButtonWidget({
    super.key,
    required this.text,
    bool? isActive,
  }) : isActive = isActive ?? false;

  final String? text;
  final bool isActive;

  @override
  State<CourseButtonWidget> createState() => _CourseButtonWidgetState();
}

class _CourseButtonWidgetState extends State<CourseButtonWidget> {
  late CourseButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CourseButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 39.0,
      decoration: BoxDecoration(
        color: widget.isActive
            ? FlutterFlowTheme.of(context).primary
            : FlutterFlowTheme.of(context).blueOcean,
        borderRadius: BorderRadius.circular(10.0),
      ),
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Text(
        widget.text!,
        style: FlutterFlowTheme.of(context).headlineSmall.override(
              fontFamily: 'Sofia Pro',
              color: widget.isActive
                  ? FlutterFlowTheme.of(context).white
                  : FlutterFlowTheme.of(context).primary,
              useGoogleFonts: false,
            ),
      ),
    );
  }
}

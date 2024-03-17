import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'courses_list_component_model.dart';
export 'courses_list_component_model.dart';

class CoursesListComponentWidget extends StatefulWidget {
  const CoursesListComponentWidget({
    super.key,
    required this.courseItem,
  });

  final CourseRecord? courseItem;

  @override
  State<CoursesListComponentWidget> createState() =>
      _CoursesListComponentWidgetState();
}

class _CoursesListComponentWidgetState
    extends State<CoursesListComponentWidget> {
  late CoursesListComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoursesListComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('COURSES_LIST_COMPONENT_Container_u1bms8f');
        logFirebaseEvent('Container_navigate_to');

        context.pushNamed(
          'Course',
          queryParameters: {
            'courseItem': serializeParam(
              widget.courseItem,
              ParamType.Document,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            'courseItem': widget.courseItem,
          },
        );
      },
      child: Container(
        width: 170.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  widget.courseItem!.mainImage,
                  width: double.infinity,
                  height: 95.0,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.courseItem?.name,
                      'course',
                    ),
                    maxLines: 2,
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Sofia Pro',
                          color: FlutterFlowTheme.of(context).primary,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.courseItem?.rating.rating.toString(),
                            '0',
                          ),
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                        Icon(
                          FFIcons.kmaterialSymbolsStar,
                          color: FlutterFlowTheme.of(context).orange,
                          size: 13.7,
                        ),
                      ],
                    ),
                    Text(
                      'Learn more',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Sofia Pro',
                            color: FlutterFlowTheme.of(context).accent3,
                            useGoogleFonts: false,
                            lineHeight: 1.16,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

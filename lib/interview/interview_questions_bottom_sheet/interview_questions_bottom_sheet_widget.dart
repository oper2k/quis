import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'interview_questions_bottom_sheet_model.dart';
export 'interview_questions_bottom_sheet_model.dart';

class InterviewQuestionsBottomSheetWidget extends StatefulWidget {
  const InterviewQuestionsBottomSheetWidget({Key? key}) : super(key: key);

  @override
  _InterviewQuestionsBottomSheetWidgetState createState() =>
      _InterviewQuestionsBottomSheetWidgetState();
}

class _InterviewQuestionsBottomSheetWidgetState
    extends State<InterviewQuestionsBottomSheetWidget> {
  late InterviewQuestionsBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InterviewQuestionsBottomSheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
              child: Text(
                'Please select a question',
                style: FlutterFlowTheme.of(context).headlineMedium,
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxHeight: 150.0,
              ),
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          setState(() {});
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 15.0, 12.0, 15.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  FFIcons.kphQuestion,
                                  color:
                                      FlutterFlowTheme.of(context).powderBlue,
                                  size: 24.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 9.0, 0.0, 9.0),
                                    child: Text(
                                      'Hello World',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 8.0))
                        .addToStart(SizedBox(height: 8.0))
                        .addToEnd(SizedBox(height: 8.0)),
                  ),
                ),
              ),
            ),
            FFButtonWidget(
              onPressed: _model.activeItem == null || _model.activeItem == ''
                  ? null
                  : () async {
                      Navigator.pop(context);
                    },
              text: 'Get Started',
              options: FFButtonOptions(
                width: double.infinity,
                height: 52.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                      fontFamily: 'Sofia Pro',
                      color: FlutterFlowTheme.of(context).white,
                      useGoogleFonts: false,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 0.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
                disabledColor: FlutterFlowTheme.of(context).secondary,
                disabledTextColor: FlutterFlowTheme.of(context).white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

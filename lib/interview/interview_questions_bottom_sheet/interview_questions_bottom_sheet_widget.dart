import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'interview_questions_bottom_sheet_model.dart';
export 'interview_questions_bottom_sheet_model.dart';

class InterviewQuestionsBottomSheetWidget extends StatefulWidget {
  const InterviewQuestionsBottomSheetWidget({
    super.key,
    required this.role,
  });

  final String? role;

  @override
  State<InterviewQuestionsBottomSheetWidget> createState() =>
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
                maxHeight: 250.0,
              ),
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: FutureBuilder<List<InterviewQuestionRecord>>(
                  future: queryInterviewQuestionRecordOnce(
                    queryBuilder: (interviewQuestionRecord) =>
                        interviewQuestionRecord.where(
                      'role',
                      isEqualTo: widget.role,
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<InterviewQuestionRecord>
                        listViewInterviewQuestionRecordList = snapshot.data!;
                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewInterviewQuestionRecordList.length,
                      separatorBuilder: (_, __) => SizedBox(height: 8.0),
                      itemBuilder: (context, listViewIndex) {
                        final listViewInterviewQuestionRecord =
                            listViewInterviewQuestionRecordList[listViewIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'INTERVIEW_QUESTIONS_BOTTOM_SHEET_Contain');
                            logFirebaseEvent(
                                'Container_update_component_state');
                            setState(() {
                              _model.activeItem =
                                  listViewInterviewQuestionRecord.question;
                            });
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
                                        listViewInterviewQuestionRecord
                                            .question,
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
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

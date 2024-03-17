import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/latest_questions/question_comments_bottom_sheet/question_comments_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:share_plus/share_plus.dart';
import 'question_model.dart';
export 'question_model.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({
    super.key,
    required this.questionItem,
  });

  final InterviewQuestionRecord? questionItem;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  late QuestionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Question'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('QUESTION_PAGE_Question_ON_INIT_STATE');
      logFirebaseEvent('Question_update_page_state');
      setState(() {
        _model.isFavorite =
            (currentUserDocument?.favoriteQuestions.toList() ?? [])
                .contains(widget.questionItem?.reference);
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('QUESTION_PAGE_Container_r1pjft1x_ON_TAP');
                  logFirebaseEvent('Container_navigate_back');
                  context.safePop();
                },
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: const BoxDecoration(),
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Icon(
                    FFIcons.karrowBack,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 30.0,
                  ),
                ),
              ),
              Builder(
                builder: (context) => InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('QUESTION_PAGE_Row_zxa54tr3_ON_TAP');
                    logFirebaseEvent('Row_share');
                    await Share.share(
                      'Look what I found: ${widget.questionItem?.question} Download Quis: Interview Prep Tool today! Get your dream job!  IOS & Android Available!',
                      sharePositionOrigin: getWidgetBoundingBox(context),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                        child: Text(
                          'Share',
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(14.0, 4.0, 4.0, 4.0),
                        child: Icon(
                          FFIcons.ksystemUiconsShare2,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          actions: const [],
          centerTitle: false,
          toolbarHeight: 40.0,
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              valueOrDefault<String>(
                                widget.questionItem?.question,
                                'question',
                              ),
                              style: FlutterFlowTheme.of(context).headlineLarge,
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              if (_model.isFavorite) {
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'QUESTION_PAGE_Container_d59aykm4_ON_TAP');
                                    logFirebaseEvent('Container_backend_call');

                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'favorite_questions':
                                              FieldValue.arrayRemove([
                                            widget.questionItem?.reference
                                          ]),
                                        },
                                      ),
                                    });
                                    logFirebaseEvent(
                                        'Container_update_page_state');
                                    setState(() {
                                      _model.isFavorite = false;
                                    });
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        FFIcons.ksubwayHurt,
                                        color:
                                            FlutterFlowTheme.of(context).melon,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'QUESTION_PAGE_Container_e1u9vwj5_ON_TAP');
                                    logFirebaseEvent('Container_backend_call');

                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'favorite_questions':
                                              FieldValue.arrayUnion([
                                            widget.questionItem?.reference
                                          ]),
                                        },
                                      ),
                                    });
                                    logFirebaseEvent(
                                        'Container_update_page_state');
                                    setState(() {
                                      _model.isFavorite = true;
                                    });
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        FFIcons.ksubwayHurt1,
                                        color:
                                            FlutterFlowTheme.of(context).melon,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Text(
                        dateTimeFormat(
                            'd/M/y', widget.questionItem!.dateInterview!),
                        style: FlutterFlowTheme.of(context).labelMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Text(
                        widget.questionItem!.userAnswer,
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Sofia Pro',
                                  useGoogleFonts: false,
                                  lineHeight: 1.16,
                                ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.5,
                      decoration: const BoxDecoration(),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: wrapWithModel(
                model: _model.questionCommentsBottomSheetModel,
                updateCallback: () => setState(() {}),
                child: QuestionCommentsBottomSheetWidget(
                  questionRef: widget.questionItem!.reference,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

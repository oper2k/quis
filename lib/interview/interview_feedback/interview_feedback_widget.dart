import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/feedback_pick_element_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'interview_feedback_model.dart';
export 'interview_feedback_model.dart';

class InterviewFeedbackWidget extends StatefulWidget {
  const InterviewFeedbackWidget({
    super.key,
    required this.userRef,
    required this.roomDoc,
    bool? isLike,
  }) : isLike = isLike ?? false;

  final DocumentReference? userRef;
  final ConferenceRoomRecord? roomDoc;
  final bool isLike;

  @override
  State<InterviewFeedbackWidget> createState() =>
      _InterviewFeedbackWidgetState();
}

class _InterviewFeedbackWidgetState extends State<InterviewFeedbackWidget> {
  late InterviewFeedbackModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InterviewFeedbackModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'InterviewFeedback'});
    _model.improveUserFieldController ??= TextEditingController();
    _model.improveUserFieldFocusNode ??= FocusNode();

    _model.scaleFieldController ??= TextEditingController();
    _model.scaleFieldFocusNode ??= FocusNode();

    _model.improvequisFieldController ??= TextEditingController();
    _model.improvequisFieldFocusNode ??= FocusNode();

    _model.appFeedbackFieldController ??= TextEditingController();
    _model.appFeedbackFieldFocusNode ??= FocusNode();
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
                  logFirebaseEvent('INTERVIEW_FEEDBACK_Container_jtjf436y_ON');
                  logFirebaseEvent('Container_navigate_to');

                  context.goNamed('Home');
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
              Text(
                'Feedback',
                style: FlutterFlowTheme.of(context).headlineLarge,
              ),
              Container(
                width: 40.0,
                height: 40.0,
                decoration: const BoxDecoration(),
              ),
            ],
          ),
          actions: const [],
          centerTitle: false,
          toolbarHeight: 40.0,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'How was your interview?',
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    decoration: const BoxDecoration(),
                    child: GridView(
                      padding: EdgeInsets.zero,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 4.0,
                      ),
                      primary: false,
                      scrollDirection: Axis.vertical,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'INTERVIEW_FEEDBACK_Container_6e1td5c4_ON');
                            logFirebaseEvent(
                                'feedbackPickElement_update_page_state');
                            setState(() {
                              _model.satisfactionInterview = true;
                            });
                          },
                          child: wrapWithModel(
                            model: _model.feedbackPickElementModel1,
                            updateCallback: () => setState(() {}),
                            child: FeedbackPickElementWidget(
                              isPicked: _model.satisfactionInterview == true,
                              text: 'Satisfied',
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'INTERVIEW_FEEDBACK_Container_grsb52c3_ON');
                            logFirebaseEvent(
                                'feedbackPickElement_update_page_state');
                            setState(() {
                              _model.satisfactionInterview = false;
                            });
                          },
                          child: wrapWithModel(
                            model: _model.feedbackPickElementModel2,
                            updateCallback: () => setState(() {}),
                            child: FeedbackPickElementWidget(
                              isPicked: _model.satisfactionInterview == false,
                              text: 'Dissatisfied',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'How was your interview Partner?',
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.1,
                    decoration: const BoxDecoration(),
                    child: GridView(
                      padding: EdgeInsets.zero,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 4.0,
                      ),
                      primary: false,
                      scrollDirection: Axis.vertical,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'INTERVIEW_FEEDBACK_Container_k0wjc1g7_ON');
                            logFirebaseEvent(
                                'feedbackPickElement_update_page_state');
                            setState(() {
                              _model.partner = 'Top 1%';
                            });
                          },
                          child: wrapWithModel(
                            model: _model.feedbackPickElementModel3,
                            updateCallback: () => setState(() {}),
                            child: FeedbackPickElementWidget(
                              isPicked: _model.partner == 'Top 1%',
                              text: 'Top 1%',
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'INTERVIEW_FEEDBACK_Container_cnk4ebr1_ON');
                            logFirebaseEvent(
                                'feedbackPickElement_update_page_state');
                            setState(() {
                              _model.partner = '5%';
                            });
                          },
                          child: wrapWithModel(
                            model: _model.feedbackPickElementModel4,
                            updateCallback: () => setState(() {}),
                            child: FeedbackPickElementWidget(
                              isPicked: _model.partner == '5%',
                              text: '5%',
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'INTERVIEW_FEEDBACK_Container_wkibmes2_ON');
                            logFirebaseEvent(
                                'feedbackPickElement_update_page_state');
                            setState(() {
                              _model.partner = '10%';
                            });
                          },
                          child: wrapWithModel(
                            model: _model.feedbackPickElementModel5,
                            updateCallback: () => setState(() {}),
                            child: FeedbackPickElementWidget(
                              isPicked: _model.partner == '10%',
                              text: '10%',
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'INTERVIEW_FEEDBACK_Container_aibllmvi_ON');
                            logFirebaseEvent(
                                'feedbackPickElement_update_page_state');
                            setState(() {
                              _model.partner = '25%';
                            });
                          },
                          child: wrapWithModel(
                            model: _model.feedbackPickElementModel6,
                            updateCallback: () => setState(() {}),
                            child: FeedbackPickElementWidget(
                              isPicked: _model.partner == '25%',
                              text: '25%',
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'INTERVIEW_FEEDBACK_Container_wgc528o7_ON');
                            logFirebaseEvent(
                                'feedbackPickElement_update_page_state');
                            setState(() {
                              _model.partner = '50%';
                            });
                          },
                          child: wrapWithModel(
                            model: _model.feedbackPickElementModel7,
                            updateCallback: () => setState(() {}),
                            child: FeedbackPickElementWidget(
                              isPicked: _model.partner == '50%',
                              text: '50%',
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'INTERVIEW_FEEDBACK_Container_mvgzu48j_ON');
                            logFirebaseEvent(
                                'feedbackPickElement_update_page_state');
                            setState(() {
                              _model.partner = 'Not good';
                            });
                          },
                          child: wrapWithModel(
                            model: _model.feedbackPickElementModel8,
                            updateCallback: () => setState(() {}),
                            child: FeedbackPickElementWidget(
                              isPicked: _model.partner == 'Not good',
                              text: 'Not good',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'Did your Partner followed the structure?',
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    decoration: const BoxDecoration(),
                    child: GridView(
                      padding: EdgeInsets.zero,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 4.0,
                      ),
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'INTERVIEW_FEEDBACK_Container_oqtbb99b_ON');
                            logFirebaseEvent(
                                'feedbackPickElement_update_page_state');
                            setState(() {
                              _model.structure = true;
                            });
                          },
                          child: wrapWithModel(
                            model: _model.feedbackPickElementModel9,
                            updateCallback: () => setState(() {}),
                            child: FeedbackPickElementWidget(
                              isPicked: _model.structure == true,
                              text: 'Yes',
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'INTERVIEW_FEEDBACK_Container_aveoh2r0_ON');
                            logFirebaseEvent(
                                'feedbackPickElement_update_page_state');
                            setState(() {
                              _model.structure = false;
                            });
                          },
                          child: wrapWithModel(
                            model: _model.feedbackPickElementModel10,
                            updateCallback: () => setState(() {}),
                            child: FeedbackPickElementWidget(
                              isPicked: _model.structure == false,
                              text: 'No',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'Please share where you partner can improve? (Your answer will be share directly with user)',
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Container(
                    height: 82.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                      child: TextFormField(
                        controller: _model.improveUserFieldController,
                        focusNode: _model.improveUserFieldFocusNode,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Here you can share your thoughts',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Sofia Pro',
                                    color: FlutterFlowTheme.of(context).accent3,
                                    useGoogleFonts: false,
                                    lineHeight: 1.16,
                                  ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge,
                        maxLines: null,
                        validator: _model.improveUserFieldControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 42.0, 0.0, 0.0),
                  child: Text(
                    'On a scale of 1 to 10, how likely are you to recommend our product or service to others?',
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Container(
                    height: 82.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                      child: TextFormField(
                        controller: _model.scaleFieldController,
                        focusNode: _model.scaleFieldFocusNode,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: '1 to 10',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Sofia Pro',
                                    color: FlutterFlowTheme.of(context).accent3,
                                    useGoogleFonts: false,
                                    lineHeight: 1.16,
                                  ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge,
                        maxLines: null,
                        validator: _model.scaleFieldControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 42.0, 0.0, 0.0),
                  child: Text(
                    'Is there anything we could have done differently to improve Quis?',
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Container(
                    height: 82.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                      child: TextFormField(
                        controller: _model.improvequisFieldController,
                        focusNode: _model.improvequisFieldFocusNode,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Here you can share your thoughts',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Sofia Pro',
                                    color: FlutterFlowTheme.of(context).accent3,
                                    useGoogleFonts: false,
                                    lineHeight: 1.16,
                                  ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge,
                        maxLines: null,
                        validator: _model.improvequisFieldControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 42.0, 0.0, 0.0),
                  child: Text(
                    'Any feedback you want to share with us?',
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Container(
                    height: 82.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                      child: TextFormField(
                        controller: _model.appFeedbackFieldController,
                        focusNode: _model.appFeedbackFieldFocusNode,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Here you can share your thoughts',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Sofia Pro',
                                    color: FlutterFlowTheme.of(context).accent3,
                                    useGoogleFonts: false,
                                    lineHeight: 1.16,
                                  ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge,
                        maxLines: null,
                        validator: _model.appFeedbackFieldControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: !((_model.satisfactionInterview != null) ||
                            (_model.partner != null && _model.partner != '') ||
                            (_model.structure != null) ||
                            (_model.improveUserFieldController.text != '') ||
                            (_model.scaleFieldController.text != '') ||
                            (_model.improvequisFieldController.text != '') ||
                            (_model.appFeedbackFieldController.text != ''))
                        ? null
                        : () async {
                            logFirebaseEvent(
                                'INTERVIEW_FEEDBACK_SUBMIT_FEEDBACK_BTN_O');
                            logFirebaseEvent('Button_backend_call');
                            _model.userOutput =
                                await UsersRecord.getDocumentOnce(
                                    widget.userRef!);
                            if (_model.partner == 'Top 1%') {
                              logFirebaseEvent('Button_backend_call');

                              await widget.userRef!.update({
                                ...mapToFirestore(
                                  {
                                    'endorsement': FieldValue.increment(1),
                                  },
                                ),
                              });
                            } else if (_model.partner == 'Not good') {
                              logFirebaseEvent('Button_backend_call');

                              await widget.userRef!.update({
                                ...createUsersRecordData(
                                  karma: functions.subtractToZero(
                                      _model.userOutput?.karma, 0.5),
                                ),
                                ...mapToFirestore(
                                  {
                                    'disliked_by': FieldValue.arrayUnion(
                                        [currentUserReference]),
                                  },
                                ),
                              });
                              logFirebaseEvent('Button_backend_call');

                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'disliked_users':
                                        FieldValue.arrayUnion([widget.userRef]),
                                  },
                                ),
                              });
                            }

                            if (((currentUserDocument?.likedUsers.toList() ??
                                        [])
                                    .where((e) => e.refUser == widget.userRef)
                                    .toList()
                                    .isNotEmpty) &&
                                widget.isLike) {
                              logFirebaseEvent('Button_backend_call');

                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'liked_users': FieldValue.arrayRemove([
                                      getLikedUserItemFirestoreData(
                                        updateLikedUserItemStruct(
                                          (currentUserDocument?.likedUsers
                                                      .toList() ??
                                                  [])
                                              .where((e) =>
                                                  e.refUser == widget.userRef)
                                              .toList()
                                              .first,
                                          clearUnsetFields: false,
                                        ),
                                        true,
                                      )
                                    ]),
                                  },
                                ),
                              });
                              logFirebaseEvent('Button_backend_call');

                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'liked_users': FieldValue.arrayUnion([
                                      getLikedUserItemFirestoreData(
                                        createLikedUserItemStruct(
                                          refUser: widget.userRef,
                                          date: widget.roomDoc?.date,
                                          top: _model.partner,
                                          clearUnsetFields: false,
                                        ),
                                        true,
                                      )
                                    ]),
                                  },
                                ),
                              });
                            }
                            if (_model.improveUserFieldController.text != '') {
                              logFirebaseEvent('Button_backend_call');
                              _model.apiResult3fr =
                                  await BrevoGroup.sendAnEmailCall.call(
                                userEmail: _model.userOutput?.email,
                                templateId: 5,
                                paramAboutInterviewPartner:
                                    _model.improveUserFieldController.text,
                              );
                            }
                            logFirebaseEvent('Button_backend_call');
                            await BrevoGroup.sendAnEmailCall.call(
                              userEmail: FFAppConstants.infoEmail,
                              templateId: 24,
                              paramEmail: currentUserEmail,
                              paramAboutInterview:
                                  _model.satisfactionInterview?.toString(),
                              paramAboutInterviewPartner: _model.partner,
                              paramPartnerStructure:
                                  _model.structure?.toString(),
                              paramPartnerImprove:
                                  _model.improveUserFieldController.text,
                              paramProductScale:
                                  _model.scaleFieldController.text,
                              paramProductImprove:
                                  _model.improvequisFieldController.text,
                              paramProductFeedback:
                                  _model.appFeedbackFieldController.text,
                            );
                            logFirebaseEvent('Button_navigate_to');

                            context.goNamed('FeedbackThankyou');

                            setState(() {});
                          },
                    text: 'Submit Feedback',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 52.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: 'Sofia Pro',
                                color: FlutterFlowTheme.of(context).white,
                                useGoogleFonts: false,
                              ),
                      elevation: 0.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                      disabledColor: FlutterFlowTheme.of(context).secondary,
                      disabledTextColor: FlutterFlowTheme.of(context).white,
                    ),
                  ),
                ),
              ].addToEnd(const SizedBox(height: 50.0)),
            ),
          ),
        ),
      ),
    );
  }
}

import '/components/feedback_pick_element_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'interview_feedback_model.dart';
export 'interview_feedback_model.dart';

class InterviewFeedbackWidget extends StatefulWidget {
  const InterviewFeedbackWidget({Key? key}) : super(key: key);

  @override
  _InterviewFeedbackWidgetState createState() =>
      _InterviewFeedbackWidgetState();
}

class _InterviewFeedbackWidgetState extends State<InterviewFeedbackWidget> {
  late InterviewFeedbackModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InterviewFeedbackModel());

    _model.improveFieldController ??= TextEditingController();
    _model.improveFieldFocusNode ??= FocusNode();

    _model.scaleFieldController ??= TextEditingController();
    _model.scaleFieldFocusNode ??= FocusNode();

    _model.improvequisFieldController ??= TextEditingController();
    _model.improvequisFieldFocusNode ??= FocusNode();

    _model.feedbackFieldController ??= TextEditingController();
    _model.feedbackFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

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
                  context.safePop();
                },
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(),
                  alignment: AlignmentDirectional(-1.00, 0.00),
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
                decoration: BoxDecoration(),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          toolbarHeight: 40.0,
          elevation: 0.0,
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'How was your interview?',
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    decoration: BoxDecoration(),
                    child: GridView(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'How was your interview Partner?',
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.1,
                    decoration: BoxDecoration(),
                    child: GridView(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'Did your Partner followed the structure?',
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    decoration: BoxDecoration(),
                    child: GridView(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'Please share where you partner can improve? (Your answer will be share directly with user)',
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Container(
                    height: 82.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                      child: TextFormField(
                        controller: _model.improveFieldController,
                        focusNode: _model.improveFieldFocusNode,
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
                        validator: _model.improveFieldControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 42.0, 0.0, 0.0),
                  child: Text(
                    'On a scale of 1 to 10, how likely are you to recommend our product or service to others?',
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Container(
                    height: 82.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 42.0, 0.0, 0.0),
                  child: Text(
                    'Is there anything we could have done differently to improve Quis?',
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Container(
                    height: 82.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 42.0, 0.0, 0.0),
                  child: Text(
                    'Any feedback you want to share with us?',
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Container(
                    height: 82.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                      child: TextFormField(
                        controller: _model.feedbackFieldController,
                        focusNode: _model.feedbackFieldFocusNode,
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
                        validator: _model.feedbackFieldControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: !((_model.satisfactionInterview != null) ||
                            (_model.partner != null && _model.partner != '') ||
                            (_model.structure != null) ||
                            (_model.improveFieldController.text != null &&
                                _model.improveFieldController.text != '') ||
                            (_model.scaleFieldController.text != null &&
                                _model.scaleFieldController.text != '') ||
                            (_model.improvequisFieldController.text != null &&
                                _model.improvequisFieldController.text != '') ||
                            (_model.feedbackFieldController.text != null &&
                                _model.feedbackFieldController.text != ''))
                        ? null
                        : () {
                            print('Button pressed ...');
                          },
                    text: 'Submit Feedback',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 52.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).headlineLarge.override(
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
                ),
              ].addToEnd(SizedBox(height: 50.0)),
            ),
          ),
        ),
      ),
    );
  }
}

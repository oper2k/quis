import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/latest_questions/calendar_element/calendar_element_widget.dart';
import '/latest_questions/question_answer_element/question_answer_element_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'new_question_model.dart';
export 'new_question_model.dart';

class NewQuestionWidget extends StatefulWidget {
  const NewQuestionWidget({Key? key}) : super(key: key);

  @override
  _NewQuestionWidgetState createState() => _NewQuestionWidgetState();
}

class _NewQuestionWidgetState extends State<NewQuestionWidget> {
  late NewQuestionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewQuestionModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.addToQuestionAnswerList(QuestionAnswerStruct(
          index: 1,
        ));
        _model.pickedMonth = functions.dateTimeToDate(getCurrentTimestamp);
        _model.currentMonth = functions.dateTimeToDate(getCurrentTimestamp);
      });
    });

    _model.companyFieldController ??= TextEditingController();
    _model.companyFieldFocusNode ??= FocusNode();
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
                'Tell us about your interview',
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
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 23.0, 0.0, 0.0),
                    child: Lottie.asset(
                      'assets/lottie_animations/animation_lofuvsla.json',
                      height: 131.0,
                      fit: BoxFit.contain,
                      animate: true,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 23.0, 0.0, 0.0),
                  child: Text(
                    'Help the Quis community by telling us about your recent interview experience! Interview questions that are detailed and clearly written will be added to the question database and you will receive Karma bonus!',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineSmall,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 27.0, 0.0, 0.0),
                  child: Text(
                    'Company',
                    style: FlutterFlowTheme.of(context).headlineSmall,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                  child: TextFormField(
                    controller: _model.companyFieldController,
                    focusNode: _model.companyFieldFocusNode,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Company',
                      hintStyle:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Sofia Pro',
                                color: FlutterFlowTheme.of(context).accent2,
                                useGoogleFonts: false,
                                lineHeight: 1.16,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).white,
                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                    ),
                    style: FlutterFlowTheme.of(context).headlineSmall,
                    validator: _model.companyFieldControllerValidator
                        .asValidator(context),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 27.0, 0.0, 0.0),
                  child: Text(
                    'Role',
                    style: FlutterFlowTheme.of(context).headlineSmall,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.roleDropDownValueController ??=
                        FormFieldController<String>(null),
                    options: FFAppState().filterRoleList,
                    onChanged: (val) =>
                        setState(() => _model.roleDropDownValue = val),
                    height: 50.0,
                    textStyle: FlutterFlowTheme.of(context).headlineSmall,
                    hintText: 'Role',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: Colors.transparent,
                    borderWidth: 2.0,
                    borderRadius: 8.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                    hidesUnderline: true,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 27.0, 0.0, 0.0),
                  child: Text(
                    'Stage',
                    style: FlutterFlowTheme.of(context).headlineSmall,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.stageDropDownValueController ??=
                        FormFieldController<String>(null),
                    options: FFAppState().filterRoleList,
                    onChanged: (val) =>
                        setState(() => _model.stageDropDownValue = val),
                    height: 50.0,
                    textStyle: FlutterFlowTheme.of(context).headlineSmall,
                    hintText: 'Stage',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: Colors.transparent,
                    borderWidth: 2.0,
                    borderRadius: 8.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                    hidesUnderline: true,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 27.0, 0.0, 0.0),
                  child: Text(
                    'Did you pass interview round?',
                    style: FlutterFlowTheme.of(context).headlineSmall,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.passDropDownValueController ??=
                        FormFieldController<String>(null),
                    options: FFAppState().filterRoleList,
                    onChanged: (val) =>
                        setState(() => _model.passDropDownValue = val),
                    height: 50.0,
                    textStyle: FlutterFlowTheme.of(context).headlineSmall,
                    hintText: 'Did you pass interview round?',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: Colors.transparent,
                    borderWidth: 2.0,
                    borderRadius: 8.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                    hidesUnderline: true,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                ),
                Builder(
                  builder: (context) {
                    final questionAnswer = _model.questionAnswerList.toList();
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(questionAnswer.length,
                          (questionAnswerIndex) {
                        final questionAnswerItem =
                            questionAnswer[questionAnswerIndex];
                        return wrapWithModel(
                          model: _model.questionAnswerElementModels.getModel(
                            questionAnswerItem.index.toString(),
                            questionAnswerIndex,
                          ),
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: QuestionAnswerElementWidget(
                            key: Key(
                              'Keyhgd_${questionAnswerItem.index.toString()}',
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 27.0, 0.0, 0.0),
                      child: Text(
                        'Date of interview',
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dateTimeFormat('yMMMM', _model.pickedMonth),
                            style: FlutterFlowTheme.of(context).headlineMedium,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    _model.pickedMonth =
                                        functions.decMonth(_model.pickedMonth!);
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        3.0, 3.0, 3.0, 3.0),
                                    child: Icon(
                                      Icons.chevron_left_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 28.0,
                                    ),
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
                                    _model.pickedMonth =
                                        functions.incMonth(_model.pickedMonth!);
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        3.0, 3.0, 3.0, 3.0),
                                    child: Icon(
                                      Icons.chevron_right_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 28.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mo',
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                          Text(
                            'Tu',
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                          Text(
                            'We',
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                          Text(
                            'Th',
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                          Text(
                            'Fr',
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                          Text(
                            'Sa',
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                          Text(
                            'Su',
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 220.0,
                        decoration: BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            final day = functions
                                    .generateCalendar(_model.pickedMonth)
                                    ?.toList() ??
                                [];
                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 7,
                                crossAxisSpacing: 18.0,
                                mainAxisSpacing: 13.0,
                                childAspectRatio: 1.0,
                              ),
                              primary: false,
                              scrollDirection: Axis.vertical,
                              itemCount: day.length,
                              itemBuilder: (context, dayIndex) {
                                final dayItem = day[dayIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      _model.pickedDate = dayItem;
                                    });
                                  },
                                  child: wrapWithModel(
                                    model:
                                        _model.calendarElementModels.getModel(
                                      dayItem.toString(),
                                      dayIndex,
                                    ),
                                    updateCallback: () => setState(() {}),
                                    child: CalendarElementWidget(
                                      key: Key(
                                        'Key3cq_${dayItem.toString()}',
                                      ),
                                      isActive: dayItem == _model.pickedDate,
                                      date: dayItem,
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
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setState(() {
                      _model.addToQuestionAnswerList(QuestionAnswerStruct(
                        index: _model.questionAnswerList.length + 1,
                      ));
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: Text(
                        'Add more question',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Sofia Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                  useGoogleFonts: false,
                                ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      while (_model.questionAnswerList.length > 0) {
                        await InterviewQuestionRecord.collection
                            .doc()
                            .set(createInterviewQuestionRecordData(
                              question: _model.questionAnswerElementModels
                                  .getValueForKey(
                                _model.questionAnswerList.first.index
                                    .toString(),
                                (m) => m.questionFieldController.text,
                              ),
                              author: currentUserReference,
                              company: _model.companyFieldController.text,
                              role: _model.roleDropDownValue,
                              stage: _model.stageDropDownValue,
                              isRoundPassed: true,
                              userAnswer: _model.questionAnswerElementModels
                                  .getValueForKey(
                                _model.questionAnswerList.first.index
                                    .toString(),
                                (m) => m.answerFieldController.text,
                              ),
                              dateInterview: _model.pickedDate,
                            ));
                        setState(() {
                          _model.removeAtIndexFromQuestionAnswerList(0);
                        });
                      }
                    },
                    text: 'Submit',
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

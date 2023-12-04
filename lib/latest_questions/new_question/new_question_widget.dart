import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/pick_bottom_sheet_widget.dart';
import '/components/pseudo_drop_down_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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
import 'package:webviewx_plus/webviewx_plus.dart';
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
        _model.roleRef = currentUserDocument?.careerProfile?.role;
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
        body: StreamBuilder<List<RoleRecord>>(
          stream: queryRoleRecord(),
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
            List<RoleRecord> roleListRoleRecordList = snapshot.data!;
            return Container(
              decoration: BoxDecoration(),
              child: Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 23.0, 0.0, 0.0),
                            child: Lottie.asset(
                              'assets/lottie_animations/animation_lofuvsla.json',
                              width: 220.0,
                              height: 131.0,
                              fit: BoxFit.contain,
                              animate: true,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 23.0, 0.0, 0.0),
                          child: Text(
                            'Help the Quis community by telling us about your recent interview experience! Interview questions that are detailed and clearly written will be added to the question database and you will receive Karma bonus!',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 27.0, 0.0, 0.0),
                          child: Text(
                            'Company',
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 6.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.companyFieldController,
                            focusNode: _model.companyFieldFocusNode,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Company',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 27.0, 0.0, 0.0),
                          child: Text(
                            'Role',
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 6.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                      child: GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: PickBottomSheetWidget(
                                        stringList: roleListRoleRecordList
                                            .where((e) =>
                                                (e.name != 'Other') &&
                                                (e.name != 'Unemployed'))
                                            .toList()
                                            .map((e) => e.name)
                                            .toList(),
                                      ),
                                    ),
                                  ));
                                },
                              ).then((value) => safeSetState(
                                  () => _model.roleOutput = value));

                              if (_model.roleOutput != null &&
                                  _model.roleOutput != '') {
                                setState(() {
                                  _model.roleRef = roleListRoleRecordList
                                      .where((e) => e.name == _model.roleOutput)
                                      .toList()
                                      .first
                                      .reference;
                                });
                              }

                              setState(() {});
                            },
                            child: Container(
                              height: 52.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: _model.isRoleValidated
                                      ? Color(0x00EB4335)
                                      : FlutterFlowTheme.of(context).error,
                                ),
                              ),
                              child: wrapWithModel(
                                model: _model.pseudoDropDownModel1,
                                updateCallback: () => setState(() {}),
                                child: PseudoDropDownWidget(
                                  defText: 'Role',
                                  text: _model.roleRef != null
                                      ? roleListRoleRecordList
                                          .where((e) =>
                                              e.reference == _model.roleRef)
                                          .toList()
                                          .first
                                          .name
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 27.0, 0.0, 0.0),
                          child: Text(
                            'Stage',
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 6.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                      child: GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: PickBottomSheetWidget(
                                        stringList: FFAppState().questionStage,
                                      ),
                                    ),
                                  ));
                                },
                              ).then((value) => safeSetState(
                                  () => _model.stageOutput = value));

                              if (_model.stageOutput != null &&
                                  _model.stageOutput != '') {
                                setState(() {
                                  _model.pickedStage = _model.stageOutput;
                                  _model.isStageValid = true;
                                });
                              }

                              setState(() {});
                            },
                            child: Container(
                              height: 52.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: _model.isStageValid
                                      ? Color(0x00EB4335)
                                      : FlutterFlowTheme.of(context).error,
                                ),
                              ),
                              child: wrapWithModel(
                                model: _model.pseudoDropDownModel2,
                                updateCallback: () => setState(() {}),
                                child: PseudoDropDownWidget(
                                  defText: 'Stage',
                                  text: _model.pickedStage,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 27.0, 0.0, 0.0),
                          child: Text(
                            'Did you pass interview round?',
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 6.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                      child: GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: PickBottomSheetWidget(
                                        stringList: FFAppState().questionRound,
                                      ),
                                    ),
                                  ));
                                },
                              ).then((value) => safeSetState(
                                  () => _model.roundOutput = value));

                              if (_model.roundOutput != null &&
                                  _model.roundOutput != '') {
                                setState(() {
                                  _model.pickedRound = _model.roundOutput;
                                  _model.isRoundValid = true;
                                });
                              }

                              setState(() {});
                            },
                            child: Container(
                              height: 52.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: _model.isRoundValid
                                      ? Color(0x00EB4335)
                                      : FlutterFlowTheme.of(context).error,
                                ),
                              ),
                              child: wrapWithModel(
                                model: _model.pseudoDropDownModel3,
                                updateCallback: () => setState(() {}),
                                child: PseudoDropDownWidget(
                                  defText: 'Did you pass interview round?',
                                  text: _model.pickedRound,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            final questionAnswer =
                                _model.questionAnswerList.toList();
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(questionAnswer.length,
                                  (questionAnswerIndex) {
                                final questionAnswerItem =
                                    questionAnswer[questionAnswerIndex];
                                return wrapWithModel(
                                  model: _model.questionAnswerElementModels
                                      .getModel(
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 27.0, 0.0, 0.0),
                              child: Text(
                                'Date of interview',
                                style:
                                    FlutterFlowTheme.of(context).headlineSmall,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    dateTimeFormat('yMMMM', _model.pickedMonth),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium,
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
                                            _model.pickedMonth = functions
                                                .decMonth(_model.pickedMonth!);
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    3.0, 3.0, 3.0, 3.0),
                                            child: Icon(
                                              Icons.chevron_left_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                            _model.pickedMonth = functions
                                                .incMonth(_model.pickedMonth!);
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    3.0, 3.0, 3.0, 3.0),
                                            child: Icon(
                                              Icons.chevron_right_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 18.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Mo',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                  Text(
                                    'Tu',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                  Text(
                                    'We',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                  Text(
                                    'Th',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                  Text(
                                    'Fr',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                  Text(
                                    'Sa',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                  Text(
                                    'Su',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 250.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: _model.isDateValid
                                        ? Color(0x00000000)
                                        : FlutterFlowTheme.of(context).error,
                                  ),
                                ),
                                child: Builder(
                                  builder: (context) {
                                    final day = functions
                                            .generateCalendar(
                                                _model.pickedMonth)
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
                                              _model.isDateValid = true;
                                            });
                                          },
                                          child: wrapWithModel(
                                            model: _model.calendarElementModels
                                                .getModel(
                                              dayItem.toString(),
                                              dayIndex,
                                            ),
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: CalendarElementWidget(
                                              key: Key(
                                                'Key3cq_${dayItem.toString()}',
                                              ),
                                              isActive:
                                                  dayItem == _model.pickedDate,
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
                              _model
                                  .addToQuestionAnswerList(QuestionAnswerStruct(
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
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Sofia Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (_model.roleRef != null) {
                                setState(() {
                                  _model.isRoleValidated = true;
                                });
                              } else {
                                setState(() {
                                  _model.isRoleValidated = false;
                                });
                                if (_model.pickedStage != null &&
                                    _model.pickedStage != '') {
                                  setState(() {
                                    _model.isStageValid = true;
                                  });
                                } else {
                                  setState(() {
                                    _model.isStageValid = false;
                                  });
                                }

                                if (_model.pickedRound != null &&
                                    _model.pickedRound != '') {
                                  setState(() {
                                    _model.isRoundValid = true;
                                  });
                                } else {
                                  setState(() {
                                    _model.isRoundValid = false;
                                  });
                                }

                                if (_model.pickedDate != null) {
                                  setState(() {
                                    _model.isDateValid = true;
                                  });
                                } else {
                                  setState(() {
                                    _model.isDateValid = false;
                                  });
                                }

                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                return;
                              }

                              if (_model.pickedStage != null &&
                                  _model.pickedStage != '') {
                                setState(() {
                                  _model.isStageValid = true;
                                });
                              } else {
                                setState(() {
                                  _model.isStageValid = false;
                                });
                                if (_model.pickedDate != null) {
                                  setState(() {
                                    _model.isDateValid = true;
                                  });
                                } else {
                                  setState(() {
                                    _model.isDateValid = false;
                                  });
                                }

                                if (_model.pickedRound != null &&
                                    _model.pickedRound != '') {
                                  setState(() {
                                    _model.isRoundValid = true;
                                  });
                                } else {
                                  setState(() {
                                    _model.isRoundValid = false;
                                  });
                                }

                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                return;
                              }

                              if (_model.pickedRound != null &&
                                  _model.pickedRound != '') {
                                setState(() {
                                  _model.isRoundValid = true;
                                });
                              } else {
                                setState(() {
                                  _model.isRoundValid = false;
                                });
                                if (_model.pickedDate != null) {
                                  setState(() {
                                    _model.isDateValid = true;
                                  });
                                } else {
                                  setState(() {
                                    _model.isDateValid = false;
                                  });
                                }

                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                return;
                              }

                              if (_model.pickedDate != null) {
                                setState(() {
                                  _model.isDateValid = true;
                                });
                              } else {
                                setState(() {
                                  _model.isDateValid = false;
                                });
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                return;
                              }

                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                              while (_model.questionAnswerList.length > 0) {
                                await InterviewQuestionRecord.collection
                                    .doc()
                                    .set(createInterviewQuestionRecordData(
                                      question: _model
                                          .questionAnswerElementModels
                                          .getValueForKey(
                                        _model.questionAnswerList.first.index
                                            .toString(),
                                        (m) => m.questionFieldController.text,
                                      ),
                                      author: currentUserReference,
                                      company:
                                          _model.companyFieldController.text,
                                      role: roleListRoleRecordList
                                          .where((e) =>
                                              e.reference == _model.roleRef)
                                          .toList()
                                          .first
                                          .name,
                                      stage: _model.pickedStage,
                                      userAnswer: _model
                                          .questionAnswerElementModels
                                          .getValueForKey(
                                        _model.questionAnswerList.first.index
                                            .toString(),
                                        (m) => m.answerFieldController.text,
                                      ),
                                      dateInterview: _model.pickedDate,
                                      roundPassed: _model.pickedRound,
                                      createdTime: getCurrentTimestamp,
                                    ));
                                setState(() {
                                  _model.removeAtIndexFromQuestionAnswerList(0);
                                });
                              }

                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'karma': FieldValue.increment(1.5),
                                  },
                                ),
                              });
                              context.safePop();
                            },
                            text: 'Submit',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 52.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
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
          },
        ),
      ),
    );
  }
}

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/filter_element_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/subscription_required_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/latest_questions/questions_filter_bottom_sheet/questions_filter_bottom_sheet_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'latest_interview_questions_model.dart';
export 'latest_interview_questions_model.dart';

class LatestInterviewQuestionsWidget extends StatefulWidget {
  const LatestInterviewQuestionsWidget({Key? key}) : super(key: key);

  @override
  _LatestInterviewQuestionsWidgetState createState() =>
      _LatestInterviewQuestionsWidgetState();
}

class _LatestInterviewQuestionsWidgetState
    extends State<LatestInterviewQuestionsWidget> {
  late LatestInterviewQuestionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LatestInterviewQuestionsModel());

    _model.searchFieldController ??= TextEditingController();
    _model.searchFieldFocusNode ??= FocusNode();
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
          actions: [],
          centerTitle: false,
          toolbarHeight: 0.0,
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Lottie.asset(
                        'assets/lottie_animations/animation_lofuvsla.json',
                        height: 131.0,
                        fit: BoxFit.contain,
                        animate: true,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: BoxDecoration(),
                          ),
                          Text(
                            'Latest Interview Question',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Sofia Pro',
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('NewQuestion');
                            },
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Icon(
                                FFIcons.kplus,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 30.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                      child: FutureBuilder<int>(
                        future: queryInterviewQuestionRecordCount(),
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
                          int richTextCount = snapshot.data!;
                          return RichText(
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      'Prepare for interviews with our list of ',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                ),
                                TextSpan(
                                  text: richTextCount.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Sofia Pro',
                                        decoration: TextDecoration.underline,
                                        useGoogleFonts: false,
                                      ),
                                ),
                                TextSpan(
                                  text: ' Interview questions',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Sofia Pro',
                                    useGoogleFonts: false,
                                    lineHeight: 1.16,
                                  ),
                            ),
                            textAlign: TextAlign.center,
                          );
                        },
                      ),
                    ),
                    StreamBuilder<List<InterviewQuestionRecord>>(
                      stream: queryInterviewQuestionRecord(),
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
                            questionListInterviewQuestionRecordList =
                            snapshot.data!;
                        return Container(
                          decoration: BoxDecoration(),
                          child: StreamBuilder<
                              List<CommentInterviewQuestionRecord>>(
                            stream: queryCommentInterviewQuestionRecord(),
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
                              List<CommentInterviewQuestionRecord>
                                  commentsListCommentInterviewQuestionRecordList =
                                  snapshot.data!;
                              return Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 14.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller:
                                                  _model.searchFieldController,
                                              focusNode:
                                                  _model.searchFieldFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.searchFieldController',
                                                Duration(milliseconds: 100),
                                                () async {
                                                  if (_model.searchFieldController
                                                              .text !=
                                                          null &&
                                                      _model.searchFieldController
                                                              .text !=
                                                          '') {
                                                    setState(() {
                                                      _model.isSearch = true;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      _model.isSearch = false;
                                                    });
                                                  }
                                                },
                                              ),
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: 'Search question',
                                                hintStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineSmall
                                                    .override(
                                                      fontFamily: 'Sofia Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                      useGoogleFonts: false,
                                                      lineHeight: 1.16,
                                                    ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .white,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(16.0, 16.0,
                                                            16.0, 16.0),
                                                prefixIcon: Icon(
                                                  Icons.search,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent3,
                                                  size: 18.0,
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall,
                                              validator: _model
                                                  .searchFieldControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return WebViewAware(
                                                      child: GestureDetector(
                                                    onTap: () => _model
                                                            .unfocusNode
                                                            .canRequestFocus
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          QuestionsFilterBottomSheetWidget(
                                                        filterList:
                                                            _model.filterList,
                                                      ),
                                                    ),
                                                  ));
                                                },
                                              ).then((value) => safeSetState(
                                                  () => _model.filterOutput =
                                                      value));

                                              setState(() {
                                                _model.filterList = _model
                                                    .filterOutput!
                                                    .toList()
                                                    .cast<String>();
                                              });

                                              setState(() {});
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 10.0),
                                                child: Icon(
                                                  Icons.filter_alt_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 5.0, 5.0, 5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    setState(() {
                                                      _model.isAll = true;
                                                    });
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .filterElementModel1,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: FilterElementWidget(
                                                      isPicked: _model.isAll,
                                                      text: 'All Questions ',
                                                      withBorder: false,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    setState(() {
                                                      _model.isAll = false;
                                                    });
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .filterElementModel2,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: FilterElementWidget(
                                                      isPicked: !_model.isAll,
                                                      text: 'Saved',
                                                      withBorder: false,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 6.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          if (_model.isAll) {
                                            return Builder(
                                              builder: (context) {
                                                if (_model.filterList.length ==
                                                    0) {
                                                  return Builder(
                                                    builder: (context) {
                                                      final question = questionListInterviewQuestionRecordList
                                                          .sortedList((e) =>
                                                              e.createdTime!)
                                                          .where((e) => _model
                                                                  .isSearch
                                                              ? functions.customSearching(
                                                                  _model
                                                                      .searchFieldController
                                                                      .text,
                                                                  e.question)
                                                              : true)
                                                          .toList();
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            question.length,
                                                            (questionIndex) {
                                                          final questionItem =
                                                              question[
                                                                  questionIndex];
                                                          return Builder(
                                                            builder:
                                                                (context) =>
                                                                    InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                if (!revenue_cat
                                                                        .activeEntitlementIds
                                                                        .contains(FFAppState()
                                                                            .entitlementID) &&
                                                                    (questionIndex >=
                                                                        2)) {
                                                                  await showAlignedDialog(
                                                                    context:
                                                                        context,
                                                                    isGlobal:
                                                                        true,
                                                                    avoidOverflow:
                                                                        false,
                                                                    targetAnchor: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    followerAnchor: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child: WebViewAware(
                                                                            child: GestureDetector(
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              SubscriptionRequiredDialogWidget(
                                                                            text:
                                                                                'To continue watching other questions, please subscribe',
                                                                            action:
                                                                                () async {},
                                                                          ),
                                                                        )),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      setState(
                                                                          () {}));
                                                                } else {
                                                                  context
                                                                      .pushNamed(
                                                                    'Question',
                                                                    queryParameters:
                                                                        {
                                                                      'questionItem':
                                                                          serializeParam(
                                                                        questionItem,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'questionItem':
                                                                          questionItem,
                                                                    },
                                                                  );
                                                                }
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                                child: Stack(
                                                                  children: [
                                                                    Builder(
                                                                      builder:
                                                                          (_) {
                                                                        final child =
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              15.0,
                                                                              12.0,
                                                                              15.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Icon(
                                                                                FFIcons.kphQuestion,
                                                                                color: FlutterFlowTheme.of(context).powderBlue,
                                                                                size: 24.0,
                                                                              ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        questionItem.question,
                                                                                        style: FlutterFlowTheme.of(context).headlineLarge,
                                                                                      ),
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Text(
                                                                                                    '${commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == questionItem.reference).toList().length.toString()} answers',
                                                                                                    style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                  ),
                                                                                                ),
                                                                                                Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).powderBlue,
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 2.0),
                                                                                                    child: Text(
                                                                                                      questionItem.role,
                                                                                                      style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                            fontFamily: 'Sofia Pro',
                                                                                                            color: FlutterFlowTheme.of(context).white,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          if (commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == questionItem.reference).toList().length > 0)
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                              child: Container(
                                                                                                constraints: BoxConstraints(
                                                                                                  minHeight: 16.0,
                                                                                                  maxHeight: 70.0,
                                                                                                ),
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Stack(
                                                                                                  children: [
                                                                                                    ClipRect(
                                                                                                      child: ImageFiltered(
                                                                                                        imageFilter: ImageFilter.blur(
                                                                                                          sigmaX: 2.0,
                                                                                                          sigmaY: 2.0,
                                                                                                        ),
                                                                                                        child: Text(
                                                                                                          commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == questionItem.reference).toList().first.text,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Sofia Pro',
                                                                                                                useGoogleFonts: false,
                                                                                                                lineHeight: 1.16,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).white,
                                                                                                      ),
                                                                                                      child: Text(
                                                                                                        commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == questionItem.reference).toList().first.text,
                                                                                                        maxLines: 1,
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Sofia Pro',
                                                                                                              useGoogleFonts: false,
                                                                                                              lineHeight: 1.16,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 11.0, 0.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Text(
                                                                                                dateTimeFormat('d/M/y', questionItem.dateInterview!),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                              ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'View Question',
                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                ),
                                                                                                Icon(
                                                                                                  FFIcons.kchevronDownS,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                        if (!revenue_cat.activeEntitlementIds.contains(FFAppState().entitlementID) &&
                                                                            (questionIndex >=
                                                                                2)) {
                                                                          return ClipRect(
                                                                            child:
                                                                                ImageFiltered(
                                                                              imageFilter: ImageFilter.blur(
                                                                                sigmaX: 2.0,
                                                                                sigmaY: 2.0,
                                                                              ),
                                                                              child: child,
                                                                            ),
                                                                          );
                                                                        }
                                                                        return child;
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }).divide(SizedBox(
                                                            height: 12.0)),
                                                      );
                                                    },
                                                  );
                                                } else {
                                                  return Builder(
                                                    builder: (context) {
                                                      if (revenue_cat
                                                          .activeEntitlementIds
                                                          .contains(FFAppState()
                                                              .entitlementID)) {
                                                        return Builder(
                                                          builder: (context) {
                                                            final filteredquestion =
                                                                questionListInterviewQuestionRecordList
                                                                    .where((e) =>
                                                                        (_model.isSearch ? functions.customSearching(_model.searchFieldController.text, e.question) : true) &&
                                                                        (() {
                                                                              if (_model.filterList.contains('Popular')) {
                                                                                return true;
                                                                              } else if (_model.filterList.contains('Newest')) {
                                                                                return (e.createdTime! >= functions.dateMinusDays(getCurrentTimestamp, 30));
                                                                              } else if (_model.filterList.contains('Hot')) {
                                                                                return (e.createdTime! >= functions.dateMinusDays(getCurrentTimestamp, 15));
                                                                              } else {
                                                                                return false;
                                                                              }
                                                                            }() ||
                                                                            _model.filterList.contains(e.role)))
                                                                    .toList();
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: List.generate(
                                                                  filteredquestion
                                                                      .length,
                                                                  (filteredquestionIndex) {
                                                                final filteredquestionItem =
                                                                    filteredquestion[
                                                                        filteredquestionIndex];
                                                                return Visibility(
                                                                  visible: !((_model.filterList.contains(
                                                                              'Popular')
                                                                          ? (commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == filteredquestionItem.reference).toList().length <
                                                                              20)
                                                                          : false) &&
                                                                      (_model.filterList.contains(
                                                                              'Hot')
                                                                          ? (commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == filteredquestionItem.reference).toList().length <
                                                                              5)
                                                                          : false)),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) =>
                                                                            InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        if (!revenue_cat.activeEntitlementIds.contains(FFAppState().entitlementID) &&
                                                                            (filteredquestionIndex >=
                                                                                2)) {
                                                                          await showAlignedDialog(
                                                                            context:
                                                                                context,
                                                                            isGlobal:
                                                                                true,
                                                                            avoidOverflow:
                                                                                false,
                                                                            targetAnchor:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            followerAnchor:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            builder:
                                                                                (dialogContext) {
                                                                              return Material(
                                                                                color: Colors.transparent,
                                                                                child: WebViewAware(
                                                                                    child: GestureDetector(
                                                                                  onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                  child: SubscriptionRequiredDialogWidget(
                                                                                    text: 'To continue watching other questions, please subscribe',
                                                                                    action: () async {},
                                                                                  ),
                                                                                )),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              setState(() {}));
                                                                        } else {
                                                                          context
                                                                              .pushNamed(
                                                                            'Question',
                                                                            queryParameters:
                                                                                {
                                                                              'questionItem': serializeParam(
                                                                                filteredquestionItem,
                                                                                ParamType.Document,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'questionItem': filteredquestionItem,
                                                                            },
                                                                          );
                                                                        }
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                        ),
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            Builder(
                                                                              builder: (_) {
                                                                                final child = Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 15.0, 12.0, 15.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Icon(
                                                                                        FFIcons.kphQuestion,
                                                                                        color: FlutterFlowTheme.of(context).powderBlue,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                filteredquestionItem.question,
                                                                                                style: FlutterFlowTheme.of(context).headlineLarge,
                                                                                              ),
                                                                                              Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Text(
                                                                                                              '${commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == filteredquestionItem.reference).toList().length.toString()} answers',
                                                                                                              style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                            ),
                                                                                                          ),
                                                                                                          Container(
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).powderBlue,
                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 2.0),
                                                                                                              child: Text(
                                                                                                                filteredquestionItem.role,
                                                                                                                style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                      fontFamily: 'Sofia Pro',
                                                                                                                      color: FlutterFlowTheme.of(context).white,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    if (commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == filteredquestionItem.reference).toList().length > 0)
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                        child: Container(
                                                                                                          constraints: BoxConstraints(
                                                                                                            minHeight: 16.0,
                                                                                                            maxHeight: 70.0,
                                                                                                          ),
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: Stack(
                                                                                                            children: [
                                                                                                              ClipRect(
                                                                                                                child: ImageFiltered(
                                                                                                                  imageFilter: ImageFilter.blur(
                                                                                                                    sigmaX: 2.0,
                                                                                                                    sigmaY: 2.0,
                                                                                                                  ),
                                                                                                                  child: Text(
                                                                                                                    commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == filteredquestionItem.reference).toList().first.text,
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Sofia Pro',
                                                                                                                          useGoogleFonts: false,
                                                                                                                          lineHeight: 1.16,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Container(
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).white,
                                                                                                                ),
                                                                                                                child: Text(
                                                                                                                  commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == filteredquestionItem.reference).toList().first.text,
                                                                                                                  maxLines: 1,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Sofia Pro',
                                                                                                                        useGoogleFonts: false,
                                                                                                                        lineHeight: 1.16,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 11.0, 0.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Text(
                                                                                                        dateTimeFormat('d/M/y', filteredquestionItem.dateInterview!),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                      ),
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'View Question',
                                                                                                          style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                        ),
                                                                                                        Icon(
                                                                                                          FFIcons.kchevronDownS,
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          size: 24.0,
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                                if (!revenue_cat.activeEntitlementIds.contains(FFAppState().entitlementID) && (filteredquestionIndex >= 2)) {
                                                                                  return ClipRect(
                                                                                    child: ImageFiltered(
                                                                                      imageFilter: ImageFilter.blur(
                                                                                        sigmaX: 2.0,
                                                                                        sigmaY: 2.0,
                                                                                      ),
                                                                                      child: child,
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                return child;
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }).divide(SizedBox(
                                                                  height:
                                                                      12.0)),
                                                            );
                                                          },
                                                        );
                                                      } else {
                                                        return Builder(
                                                          builder: (context) {
                                                            final filteredquestion =
                                                                questionListInterviewQuestionRecordList
                                                                    .take(2)
                                                                    .toList()
                                                                    .where((e) =>
                                                                        (_model.isSearch ? functions.customSearching(_model.searchFieldController.text, e.question) : true) &&
                                                                        (() {
                                                                              if (_model.filterList.contains('Popular')) {
                                                                                return true;
                                                                              } else if (_model.filterList.contains('Newest')) {
                                                                                return (e.createdTime! >= functions.dateMinusDays(getCurrentTimestamp, 30));
                                                                              } else if (_model.filterList.contains('Hot')) {
                                                                                return (e.createdTime! >= functions.dateMinusDays(getCurrentTimestamp, 15));
                                                                              } else {
                                                                                return false;
                                                                              }
                                                                            }() ||
                                                                            _model.filterList.contains(e.role)))
                                                                    .toList();
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: List.generate(
                                                                  filteredquestion
                                                                      .length,
                                                                  (filteredquestionIndex) {
                                                                final filteredquestionItem =
                                                                    filteredquestion[
                                                                        filteredquestionIndex];
                                                                return Visibility(
                                                                  visible: !((_model.filterList.contains(
                                                                              'Popular')
                                                                          ? (commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == filteredquestionItem.reference).toList().length <
                                                                              20)
                                                                          : false) &&
                                                                      (_model.filterList.contains(
                                                                              'Hot')
                                                                          ? (commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == filteredquestionItem.reference).toList().length <
                                                                              5)
                                                                          : false)),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) =>
                                                                            InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        if (!revenue_cat.activeEntitlementIds.contains(FFAppState().entitlementID) &&
                                                                            (filteredquestionIndex >=
                                                                                2)) {
                                                                          await showAlignedDialog(
                                                                            context:
                                                                                context,
                                                                            isGlobal:
                                                                                true,
                                                                            avoidOverflow:
                                                                                false,
                                                                            targetAnchor:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            followerAnchor:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            builder:
                                                                                (dialogContext) {
                                                                              return Material(
                                                                                color: Colors.transparent,
                                                                                child: WebViewAware(
                                                                                    child: GestureDetector(
                                                                                  onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                  child: SubscriptionRequiredDialogWidget(
                                                                                    text: 'To continue watching other questions, please subscribe',
                                                                                    action: () async {},
                                                                                  ),
                                                                                )),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              setState(() {}));
                                                                        } else {
                                                                          context
                                                                              .pushNamed(
                                                                            'Question',
                                                                            queryParameters:
                                                                                {
                                                                              'questionItem': serializeParam(
                                                                                filteredquestionItem,
                                                                                ParamType.Document,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'questionItem': filteredquestionItem,
                                                                            },
                                                                          );
                                                                        }
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                        ),
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            Builder(
                                                                              builder: (_) {
                                                                                final child = Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 15.0, 12.0, 15.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Icon(
                                                                                        FFIcons.kphQuestion,
                                                                                        color: FlutterFlowTheme.of(context).powderBlue,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                filteredquestionItem.question,
                                                                                                style: FlutterFlowTheme.of(context).headlineLarge,
                                                                                              ),
                                                                                              Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Text(
                                                                                                              '${commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == filteredquestionItem.reference).toList().length.toString()} answers',
                                                                                                              style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                            ),
                                                                                                          ),
                                                                                                          Container(
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).powderBlue,
                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 2.0),
                                                                                                              child: Text(
                                                                                                                filteredquestionItem.role,
                                                                                                                style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                      fontFamily: 'Sofia Pro',
                                                                                                                      color: FlutterFlowTheme.of(context).white,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    if (commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == filteredquestionItem.reference).toList().length > 0)
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                        child: Container(
                                                                                                          constraints: BoxConstraints(
                                                                                                            minHeight: 16.0,
                                                                                                            maxHeight: 70.0,
                                                                                                          ),
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: Stack(
                                                                                                            children: [
                                                                                                              ClipRect(
                                                                                                                child: ImageFiltered(
                                                                                                                  imageFilter: ImageFilter.blur(
                                                                                                                    sigmaX: 2.0,
                                                                                                                    sigmaY: 2.0,
                                                                                                                  ),
                                                                                                                  child: Text(
                                                                                                                    commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == filteredquestionItem.reference).toList().first.text,
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Sofia Pro',
                                                                                                                          useGoogleFonts: false,
                                                                                                                          lineHeight: 1.16,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Container(
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).white,
                                                                                                                ),
                                                                                                                child: Text(
                                                                                                                  commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == filteredquestionItem.reference).toList().first.text,
                                                                                                                  maxLines: 1,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Sofia Pro',
                                                                                                                        useGoogleFonts: false,
                                                                                                                        lineHeight: 1.16,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 11.0, 0.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Text(
                                                                                                        dateTimeFormat('d/M/y', filteredquestionItem.dateInterview!),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                      ),
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'View Question',
                                                                                                          style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                        ),
                                                                                                        Icon(
                                                                                                          FFIcons.kchevronDownS,
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          size: 24.0,
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                                if (!revenue_cat.activeEntitlementIds.contains(FFAppState().entitlementID) && (filteredquestionIndex >= 2)) {
                                                                                  return ClipRect(
                                                                                    child: ImageFiltered(
                                                                                      imageFilter: ImageFilter.blur(
                                                                                        sigmaX: 4.0,
                                                                                        sigmaY: 4.0,
                                                                                      ),
                                                                                      child: child,
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                return child;
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }).divide(SizedBox(
                                                                  height:
                                                                      12.0)),
                                                            );
                                                          },
                                                        );
                                                      }
                                                    },
                                                  );
                                                }
                                              },
                                            );
                                          } else {
                                            return AuthUserStreamWidget(
                                              builder: (context) => Builder(
                                                builder: (context) {
                                                  final savedquestion =
                                                      questionListInterviewQuestionRecordList
                                                          .where((e) => (currentUserDocument
                                                                      ?.favoriteQuestions
                                                                      ?.toList() ??
                                                                  [])
                                                              .contains(
                                                                  e.reference))
                                                          .toList();
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        savedquestion.length,
                                                        (savedquestionIndex) {
                                                      final savedquestionItem =
                                                          savedquestion[
                                                              savedquestionIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            'Question',
                                                            queryParameters: {
                                                              'questionItem':
                                                                  serializeParam(
                                                                savedquestionItem,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'questionItem':
                                                                  savedquestionItem,
                                                            },
                                                          );
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        15.0,
                                                                        12.0,
                                                                        15.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Icon(
                                                                      FFIcons
                                                                          .ksubwayHurt,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .melon,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              savedquestionItem.question,
                                                                              style: FlutterFlowTheme.of(context).headlineLarge,
                                                                            ),
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Text(
                                                                                          '${commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == savedquestionItem.reference).toList().length.toString()} answers',
                                                                                          style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).powderBlue,
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 2.0),
                                                                                          child: Text(
                                                                                            savedquestionItem.role,
                                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                  fontFamily: 'Sofia Pro',
                                                                                                  color: FlutterFlowTheme.of(context).white,
                                                                                                  useGoogleFonts: false,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                if (commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == savedquestionItem.reference).toList().length > 0)
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == savedquestionItem.reference).toList().first.text,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 11.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      dateTimeFormat('d/M/y', savedquestionItem.dateInterview!),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        'View Question',
                                                                                        style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                      ),
                                                                                      Icon(
                                                                                        FFIcons.kchevronDownS,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }).divide(
                                                        SizedBox(height: 12.0)),
                                                  );
                                                },
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ].addToEnd(SizedBox(height: 100.0)),
                ),
              ),
            ),
            wrapWithModel(
              model: _model.navBarModel,
              updateCallback: () => setState(() {}),
              child: NavBarWidget(
                index: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

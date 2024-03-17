import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/filter_element_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/latest_questions/questions_filter_bottom_sheet/questions_filter_bottom_sheet_widget.dart';
import '/walkthroughs/guide_questions3.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'latest_interview_questions_guide_model.dart';
export 'latest_interview_questions_guide_model.dart';

class LatestInterviewQuestionsGuideWidget extends StatefulWidget {
  const LatestInterviewQuestionsGuideWidget({super.key});

  @override
  State<LatestInterviewQuestionsGuideWidget> createState() =>
      _LatestInterviewQuestionsGuideWidgetState();
}

class _LatestInterviewQuestionsGuideWidgetState
    extends State<LatestInterviewQuestionsGuideWidget>
    with TickerProviderStateMixin {
  late LatestInterviewQuestionsGuideModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 300.ms,
          begin: const Offset(0.0, 100.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LatestInterviewQuestionsGuideModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LatestInterviewQuestionsGuide'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LATEST_INTERVIEW_QUESTIONS_GUIDE_LatestI');
      logFirebaseEvent('LatestInterviewQuestionsGuide_start_walk');
      safeSetState(() =>
          _model.guideQuestions3Controller = createPageWalkthrough(context));
      _model.guideQuestions3Controller?.show(context: context);
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.searchFieldController ??= TextEditingController();
    _model.searchFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          actions: const [],
          centerTitle: false,
          toolbarHeight: 0.0,
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Lottie.asset(
                      'assets/lottie_animations/animation_lofuvsla.json',
                      width: 220.0,
                      height: 150.0,
                      fit: BoxFit.contain,
                      animate: true,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: const BoxDecoration(),
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
                            logFirebaseEvent(
                                'LATEST_INTERVIEW_QUESTIONS_GUIDE_Contain');
                            logFirebaseEvent('Container_navigate_to');

                            context.pushNamed('NewQuestion');
                          },
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: Icon(
                              FFIcons.kplus,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 30.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                    child: RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Prepare for interviews with our list of ',
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                          TextSpan(
                            text: '100',
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
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          )
                        ],
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Sofia Pro',
                                  useGoogleFonts: false,
                                  lineHeight: 1.16,
                                ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  StreamBuilder<List<InterviewQuestionRecord>>(
                    stream: queryInterviewQuestionRecord(
                      limit: 5,
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
                          questionListInterviewQuestionRecordList =
                          snapshot.data!;
                      return Container(
                        decoration: const BoxDecoration(),
                        child:
                            StreamBuilder<List<CommentInterviewQuestionRecord>>(
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
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
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
                                              const Duration(milliseconds: 100),
                                              () async {
                                                logFirebaseEvent(
                                                    'LATEST_INTERVIEW_QUESTIONS_GUIDE_SearchF');
                                                if (_model.searchFieldController
                                                            .text !=
                                                        '') {
                                                  logFirebaseEvent(
                                                      'SearchField_update_page_state');
                                                  setState(() {
                                                    _model.isSearch = true;
                                                  });
                                                } else {
                                                  logFirebaseEvent(
                                                      'SearchField_update_page_state');
                                                  setState(() {
                                                    _model.isSearch = false;
                                                  });
                                                }
                                              },
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'Search question',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
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
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
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
                                                    BorderRadius.circular(10.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .white,
                                              contentPadding:
                                                  const EdgeInsets.all(16.0),
                                              prefixIcon: Icon(
                                                Icons.search,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                                size: 18.0,
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
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
                                            logFirebaseEvent(
                                                'LATEST_INTERVIEW_QUESTIONS_GUIDE_Contain');
                                            logFirebaseEvent(
                                                'Container_bottom_sheet');
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
                                                  ),
                                                );
                                              },
                                            ).then((value) => safeSetState(() =>
                                                _model.filterOutput = value));

                                            logFirebaseEvent(
                                                'Container_update_page_state');
                                            setState(() {
                                              _model.filterList = _model
                                                  .filterOutput!
                                                  .toList()
                                                  .cast<String>();
                                            });

                                            setState(() {});
                                          },
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Icon(
                                                Icons.filter_alt_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'LATEST_INTERVIEW_QUESTIONS_GUIDE_Contain');
                                                  logFirebaseEvent(
                                                      'filterElement_update_page_state');
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
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'LATEST_INTERVIEW_QUESTIONS_GUIDE_Contain');
                                                  logFirebaseEvent(
                                                      'filterElement_update_page_state');
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
                                          ].divide(const SizedBox(width: 6.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        if (_model.isAll) {
                                          return Builder(
                                            builder: (context) {
                                              if (_model.filterList.isEmpty) {
                                                return Builder(
                                                  builder: (context) {
                                                    if (_model.isSearch) {
                                                      return Builder(
                                                        builder: (context) {
                                                          if (revenue_cat
                                                              .activeEntitlementIds
                                                              .contains(FFAppState()
                                                                  .entitlementID)) {
                                                            return Builder(
                                                              builder:
                                                                  (context) {
                                                                final questionListViewSearch = questionListInterviewQuestionRecordList
                                                                    .sortedList(
                                                                        (e) => e
                                                                            .createdTime!)
                                                                    .where((e) => functions.customSearching(
                                                                        _model
                                                                            .searchFieldController
                                                                            .text,
                                                                        e.question))
                                                                    .toList();
                                                                return ListView
                                                                    .separated(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      questionListViewSearch
                                                                          .length,
                                                                  separatorBuilder: (_,
                                                                          __) =>
                                                                      const SizedBox(
                                                                          height:
                                                                              12.0),
                                                                  itemBuilder:
                                                                      (context,
                                                                          questionListViewSearchIndex) {
                                                                    final questionListViewSearchItem =
                                                                        questionListViewSearch[
                                                                            questionListViewSearchIndex];
                                                                    return InkWell(
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
                                                                        logFirebaseEvent(
                                                                            'LATEST_INTERVIEW_QUESTIONS_GUIDE_Contain');
                                                                        if (!revenue_cat.activeEntitlementIds.contains(FFAppState().entitlementID) &&
                                                                            (questionListViewSearchIndex >=
                                                                                2)) {
                                                                          logFirebaseEvent(
                                                                              'Container_navigate_to');

                                                                          context
                                                                              .pushNamed(
                                                                            'Pricing',
                                                                            queryParameters:
                                                                                {
                                                                              'offers': serializeParam(
                                                                                PaywallPrice.standard,
                                                                                ParamType.Enum,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'Container_navigate_to');

                                                                          context
                                                                              .pushNamed(
                                                                            'Question',
                                                                            queryParameters:
                                                                                {
                                                                              'questionItem': serializeParam(
                                                                                questionListViewSearchItem,
                                                                                ParamType.Document,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'questionItem': questionListViewSearchItem,
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
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 15.0, 12.0, 15.0),
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
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                questionListViewSearchItem.question,
                                                                                                style: FlutterFlowTheme.of(context).headlineLarge,
                                                                                              ),
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: Text(
                                                                                                            '${commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == questionListViewSearchItem.reference).toList().length.toString()} answers',
                                                                                                            style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).powderBlue,
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 2.0),
                                                                                                            child: Text(
                                                                                                              questionListViewSearchItem.role,
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
                                                                                                  if (commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == questionListViewSearchItem.reference).toList().isNotEmpty)
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                      child: Container(
                                                                                                        constraints: const BoxConstraints(
                                                                                                          minHeight: 16.0,
                                                                                                          maxHeight: 70.0,
                                                                                                        ),
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Stack(
                                                                                                          children: [
                                                                                                            ClipRect(
                                                                                                              child: ImageFiltered(
                                                                                                                imageFilter: ImageFilter.blur(
                                                                                                                  sigmaX: 2.0,
                                                                                                                  sigmaY: 2.0,
                                                                                                                ),
                                                                                                                child: Text(
                                                                                                                  commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == questionListViewSearchItem.reference).toList().first.text,
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
                                                                                                                commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == questionListViewSearchItem.reference).toList().first.text,
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
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 11.0, 0.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Text(
                                                                                                        dateTimeFormat('d/M/y', questionListViewSearchItem.dateInterview!),
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
                                                                                if (!revenue_cat.activeEntitlementIds.contains(FFAppState().entitlementID) && (questionListViewSearchIndex >= 2)) {
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
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            );
                                                          } else {
                                                            return Builder(
                                                              builder:
                                                                  (context) {
                                                                final questionListViewSearch = questionListInterviewQuestionRecordList
                                                                    .sortedList(
                                                                        (e) => e
                                                                            .createdTime!)
                                                                    .take(2)
                                                                    .toList()
                                                                    .where((e) => functions.customSearching(
                                                                        _model
                                                                            .searchFieldController
                                                                            .text,
                                                                        e.question))
                                                                    .toList();
                                                                return ListView
                                                                    .separated(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      questionListViewSearch
                                                                          .length,
                                                                  separatorBuilder: (_,
                                                                          __) =>
                                                                      const SizedBox(
                                                                          height:
                                                                              12.0),
                                                                  itemBuilder:
                                                                      (context,
                                                                          questionListViewSearchIndex) {
                                                                    final questionListViewSearchItem =
                                                                        questionListViewSearch[
                                                                            questionListViewSearchIndex];
                                                                    return InkWell(
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
                                                                        logFirebaseEvent(
                                                                            'LATEST_INTERVIEW_QUESTIONS_GUIDE_Contain');
                                                                        if (!revenue_cat.activeEntitlementIds.contains(FFAppState().entitlementID) &&
                                                                            (questionListViewSearchIndex >=
                                                                                2)) {
                                                                          logFirebaseEvent(
                                                                              'Container_navigate_to');

                                                                          context
                                                                              .pushNamed(
                                                                            'Pricing',
                                                                            queryParameters:
                                                                                {
                                                                              'offers': serializeParam(
                                                                                PaywallPrice.standard,
                                                                                ParamType.Enum,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'Container_navigate_to');

                                                                          context
                                                                              .pushNamed(
                                                                            'Question',
                                                                            queryParameters:
                                                                                {
                                                                              'questionItem': serializeParam(
                                                                                questionListViewSearchItem,
                                                                                ParamType.Document,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'questionItem': questionListViewSearchItem,
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
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 15.0, 12.0, 15.0),
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
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                questionListViewSearchItem.question,
                                                                                                style: FlutterFlowTheme.of(context).headlineLarge,
                                                                                              ),
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: Text(
                                                                                                            '${commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == questionListViewSearchItem.reference).toList().length.toString()} answers',
                                                                                                            style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).powderBlue,
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 2.0),
                                                                                                            child: Text(
                                                                                                              questionListViewSearchItem.role,
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
                                                                                                  if (commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == questionListViewSearchItem.reference).toList().isNotEmpty)
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                      child: Container(
                                                                                                        constraints: const BoxConstraints(
                                                                                                          minHeight: 16.0,
                                                                                                          maxHeight: 70.0,
                                                                                                        ),
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Stack(
                                                                                                          children: [
                                                                                                            ClipRect(
                                                                                                              child: ImageFiltered(
                                                                                                                imageFilter: ImageFilter.blur(
                                                                                                                  sigmaX: 2.0,
                                                                                                                  sigmaY: 2.0,
                                                                                                                ),
                                                                                                                child: Text(
                                                                                                                  commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == questionListViewSearchItem.reference).toList().first.text,
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
                                                                                                                commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == questionListViewSearchItem.reference).toList().first.text,
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
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 11.0, 0.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Text(
                                                                                                        dateTimeFormat('d/M/y', questionListViewSearchItem.dateInterview!),
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
                                                                                if (!revenue_cat.activeEntitlementIds.contains(FFAppState().entitlementID) && (questionListViewSearchIndex >= 2)) {
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
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            );
                                                          }
                                                        },
                                                      );
                                                    } else {
                                                      return Builder(
                                                        builder: (context) {
                                                          final questionListView =
                                                              questionListInterviewQuestionRecordList
                                                                  .sortedList(
                                                                      (e) => e
                                                                          .createdTime!)
                                                                  .toList();
                                                          return ListView
                                                              .separated(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                questionListView
                                                                    .length,
                                                            separatorBuilder: (_,
                                                                    __) =>
                                                                const SizedBox(
                                                                    height:
                                                                        12.0),
                                                            itemBuilder: (context,
                                                                questionListViewIndex) {
                                                              final questionListViewItem =
                                                                  questionListView[
                                                                      questionListViewIndex];
                                                              return InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'LATEST_INTERVIEW_QUESTIONS_GUIDE_Contain');
                                                                  if (!revenue_cat
                                                                          .activeEntitlementIds
                                                                          .contains(FFAppState()
                                                                              .entitlementID) &&
                                                                      (questionListViewIndex >=
                                                                          2)) {
                                                                    logFirebaseEvent(
                                                                        'Container_navigate_to');

                                                                    context
                                                                        .pushNamed(
                                                                      'Pricing',
                                                                      queryParameters:
                                                                          {
                                                                        'offers':
                                                                            serializeParam(
                                                                          PaywallPrice
                                                                              .standard,
                                                                          ParamType
                                                                              .Enum,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Container_navigate_to');

                                                                    context
                                                                        .pushNamed(
                                                                      'Question',
                                                                      queryParameters:
                                                                          {
                                                                        'questionItem':
                                                                            serializeParam(
                                                                          questionListViewItem,
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <String,
                                                                          dynamic>{
                                                                        'questionItem':
                                                                            questionListViewItem,
                                                                      },
                                                                    );
                                                                  }
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  child: Stack(
                                                                    children: [
                                                                      Builder(
                                                                        builder:
                                                                            (_) {
                                                                          final child =
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                15.0,
                                                                                12.0,
                                                                                15.0),
                                                                            child:
                                                                                Row(
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
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          questionListViewItem.question,
                                                                                          style: FlutterFlowTheme.of(context).headlineLarge,
                                                                                        ),
                                                                                        Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Text(
                                                                                                      '${commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == questionListViewItem.reference).toList().length.toString()} answers',
                                                                                                      style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).powderBlue,
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 2.0),
                                                                                                      child: Text(
                                                                                                        questionListViewItem.role,
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
                                                                                            if (commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == questionListViewItem.reference).toList().isNotEmpty)
                                                                                              Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                child: Container(
                                                                                                  constraints: const BoxConstraints(
                                                                                                    minHeight: 16.0,
                                                                                                    maxHeight: 70.0,
                                                                                                  ),
                                                                                                  decoration: const BoxDecoration(),
                                                                                                  child: Stack(
                                                                                                    children: [
                                                                                                      ClipRect(
                                                                                                        child: ImageFiltered(
                                                                                                          imageFilter: ImageFilter.blur(
                                                                                                            sigmaX: 2.0,
                                                                                                            sigmaY: 2.0,
                                                                                                          ),
                                                                                                          child: Text(
                                                                                                            commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == questionListViewItem.reference).toList().first.text,
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
                                                                                                          commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == questionListViewItem.reference).toList().first.text,
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
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 11.0, 0.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Text(
                                                                                                  dateTimeFormat('d/M/y', questionListViewItem.dateInterview!),
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
                                                                              (questionListViewIndex >= 2)) {
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
                                                              );
                                                            },
                                                          );
                                                        },
                                                      );
                                                    }
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
                                                                      (_model.isSearch
                                                                          ? functions.customSearching(
                                                                              _model.searchFieldController.text,
                                                                              e.question)
                                                                          : true) &&
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
                                                                visible: !((_model
                                                                            .filterList
                                                                            .contains(
                                                                                'Popular')
                                                                        ? (commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == filteredquestionItem.reference).toList().length <
                                                                            20)
                                                                        : false) &&
                                                                    (_model.filterList.contains(
                                                                            'Hot')
                                                                        ? (commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == filteredquestionItem.reference).toList().length <
                                                                            5)
                                                                        : false)),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'LATEST_INTERVIEW_QUESTIONS_GUIDE_Contain');
                                                                    if (!revenue_cat
                                                                            .activeEntitlementIds
                                                                            .contains(FFAppState()
                                                                                .entitlementID) &&
                                                                        (filteredquestionIndex >=
                                                                            2)) {
                                                                      logFirebaseEvent(
                                                                          'Container_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        'Pricing',
                                                                        queryParameters:
                                                                            {
                                                                          'offers':
                                                                              serializeParam(
                                                                            PaywallPrice.standard,
                                                                            ParamType.Enum,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Container_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        'Question',
                                                                        queryParameters:
                                                                            {
                                                                          'questionItem':
                                                                              serializeParam(
                                                                            filteredquestionItem,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'questionItem':
                                                                              filteredquestionItem,
                                                                        },
                                                                      );
                                                                    }
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Builder(
                                                                          builder:
                                                                              (_) {
                                                                            final child =
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 15.0, 12.0, 15.0),
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
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            filteredquestionItem.question,
                                                                                            style: FlutterFlowTheme.of(context).headlineLarge,
                                                                                          ),
                                                                                          Container(
                                                                                            decoration: const BoxDecoration(),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
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
                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 2.0),
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
                                                                                                if (commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == filteredquestionItem.reference).toList().isNotEmpty)
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      constraints: const BoxConstraints(
                                                                                                        minHeight: 16.0,
                                                                                                        maxHeight: 70.0,
                                                                                                      ),
                                                                                                      decoration: const BoxDecoration(),
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
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 11.0, 0.0, 0.0),
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
                                                                            if (!revenue_cat.activeEntitlementIds.contains(FFAppState().entitlementID) &&
                                                                                (filteredquestionIndex >= 2)) {
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
                                                              );
                                                            }).divide(const SizedBox(
                                                                height: 12.0)),
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
                                                                      (_model.isSearch
                                                                          ? functions.customSearching(
                                                                              _model.searchFieldController.text,
                                                                              e.question)
                                                                          : true) &&
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
                                                                visible: !((_model
                                                                            .filterList
                                                                            .contains(
                                                                                'Popular')
                                                                        ? (commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == filteredquestionItem.reference).toList().length <
                                                                            20)
                                                                        : false) &&
                                                                    (_model.filterList.contains(
                                                                            'Hot')
                                                                        ? (commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == filteredquestionItem.reference).toList().length <
                                                                            5)
                                                                        : false)),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'LATEST_INTERVIEW_QUESTIONS_GUIDE_Contain');
                                                                    if (!revenue_cat
                                                                            .activeEntitlementIds
                                                                            .contains(FFAppState()
                                                                                .entitlementID) &&
                                                                        (filteredquestionIndex >=
                                                                            2)) {
                                                                      logFirebaseEvent(
                                                                          'Container_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        'Pricing',
                                                                        queryParameters:
                                                                            {
                                                                          'offers':
                                                                              serializeParam(
                                                                            PaywallPrice.standard,
                                                                            ParamType.Enum,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Container_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        'Question',
                                                                        queryParameters:
                                                                            {
                                                                          'questionItem':
                                                                              serializeParam(
                                                                            filteredquestionItem,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'questionItem':
                                                                              filteredquestionItem,
                                                                        },
                                                                      );
                                                                    }
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Builder(
                                                                          builder:
                                                                              (_) {
                                                                            final child =
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 15.0, 12.0, 15.0),
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
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            filteredquestionItem.question,
                                                                                            style: FlutterFlowTheme.of(context).headlineLarge,
                                                                                          ),
                                                                                          Container(
                                                                                            decoration: const BoxDecoration(),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
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
                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 2.0),
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
                                                                                                if (commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == filteredquestionItem.reference).toList().isNotEmpty)
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      constraints: const BoxConstraints(
                                                                                                        minHeight: 16.0,
                                                                                                        maxHeight: 70.0,
                                                                                                      ),
                                                                                                      decoration: const BoxDecoration(),
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
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 11.0, 0.0, 0.0),
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
                                                                            if (!revenue_cat.activeEntitlementIds.contains(FFAppState().entitlementID) &&
                                                                                (filteredquestionIndex >= 2)) {
                                                                              return ClipRect(
                                                                                child: ImageFiltered(
                                                                                  imageFilter: ImageFilter.blur(
                                                                                    sigmaX: 6.0,
                                                                                    sigmaY: 6.0,
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
                                                            }).divide(const SizedBox(
                                                                height: 12.0)),
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
                                                        .where((e) =>
                                                            (currentUserDocument
                                                                        ?.favoriteQuestions
                                                                        .toList() ??
                                                                    [])
                                                                .contains(e
                                                                    .reference))
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
                                                        logFirebaseEvent(
                                                            'LATEST_INTERVIEW_QUESTIONS_GUIDE_Contain');
                                                        logFirebaseEvent(
                                                            'Container_navigate_to');

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
                                                              padding:
                                                                  const EdgeInsetsDirectional
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
                                                                    size: 24.0,
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                                            style:
                                                                                FlutterFlowTheme.of(context).headlineLarge,
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
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
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 2.0),
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
                                                                              if (commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == savedquestionItem.reference).toList().isNotEmpty)
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    commentsListCommentInterviewQuestionRecordList.where((e) => e.refQuestion == savedquestionItem.reference).toList().first.text,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                11.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
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
                                                      const SizedBox(height: 12.0)),
                                                );
                                              },
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ).animateOnPageLoad(
                                  animationsMap['columnOnPageLoadAnimation']!),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            if (!(isWeb
                ? MediaQuery.viewInsetsOf(context).bottom > 0
                : _isKeyboardVisible))
              Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).white,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 32.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FFIcons.kiconamoonHomeLight,
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                      size: 24.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 6.0, 0.0, 0.0),
                                      child: Text(
                                        'Home',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FFIcons.kocticonBook24,
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                      size: 24.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 6.0, 0.0, 0.0),
                                      child: Text(
                                        'Course',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FFIcons.kfluentPersonFeedback20Regular,
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                      size: 24.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 6.0, 0.0, 0.0),
                                      child: Text(
                                        'Practice',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FFIcons.kphQuestion,
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                      size: 24.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 6.0, 0.0, 0.0),
                                      child: Text(
                                        'Questions',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                      ),
                                    ),
                                  ],
                                ),
                              ).addWalkthrough(
                                containerKtz8r38t,
                                _model.guideQuestions3Controller,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FFIcons.ksolarUserOutline,
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                      size: 24.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 6.0, 0.0, 0.0),
                                      child: Text(
                                        'Profile',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () {
          safeSetState(() => _model.guideQuestions3Controller = null);
          logFirebaseEvent('LATEST_INTERVIEW_QUESTIONS_GUIDE_LatestI');
          logFirebaseEvent('LatestInterviewQuestionsGuide_navigate_t');

          context.goNamed('HomeGuide2');
        },
        onSkip: () {
          logFirebaseEvent('LATEST_INTERVIEW_QUESTIONS_GUIDE_LatestI');
          logFirebaseEvent('LatestInterviewQuestionsGuide_navigate_t');

          context.goNamed('HomeGuide2');

          return true;
        },
      );
}

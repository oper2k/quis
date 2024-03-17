import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/course_button_widget.dart';
import '/components/video_element_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'course_model.dart';
export 'course_model.dart';

class CourseWidget extends StatefulWidget {
  const CourseWidget({
    super.key,
    required this.courseItem,
  });

  final CourseRecord? courseItem;

  @override
  State<CourseWidget> createState() => _CourseWidgetState();
}

class _CourseWidgetState extends State<CourseWidget> {
  late CourseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CourseModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Course'});
  }

  @override
  void dispose() {
    _model.dispose();

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
                  logFirebaseEvent('COURSE_PAGE_Container_49s67uio_ON_TAP');
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
              Text(
                'Expert Video Answers',
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
        body: StreamBuilder<List<CourseVideoRecord>>(
          stream: queryCourseVideoRecord(
            queryBuilder: (courseVideoRecord) => courseVideoRecord
                .where(
                  'course',
                  isEqualTo: widget.courseItem?.reference,
                )
                .where(
                  'type',
                  isEqualTo: 'lesson',
                )
                .orderBy('sort'),
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
            List<CourseVideoRecord> lessonListCourseVideoRecordList =
                snapshot.data!;
            return Container(
              decoration: const BoxDecoration(),
              child: StreamBuilder<List<CourseVideoRecord>>(
                stream: queryCourseVideoRecord(
                  queryBuilder: (courseVideoRecord) => courseVideoRecord
                      .where(
                        'course',
                        isEqualTo: widget.courseItem?.reference,
                      )
                      .where(
                        'type',
                        isEqualTo: 'masterclass',
                      )
                      .orderBy('sort'),
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
                  List<CourseVideoRecord> masterclassListCourseVideoRecordList =
                      snapshot.data!;
                  return Container(
                    decoration: const BoxDecoration(),
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).width / 1.72,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: FlutterFlowWebView(
                                        content: widget
                                            .courseItem!.previewVimeoVideoUrl,
                                        bypass: false,
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        verticalScroll: false,
                                        horizontalScroll: false,
                                      ),
                                    ),
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                      tabletLandscape: false,
                                      desktop: false,
                                    ))
                                      Hero(
                                        tag: widget
                                            .courseItem!.previewVideo.imagePath,
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.network(
                                            widget.courseItem!.previewVideo
                                                .imagePath,
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                      tabletLandscape: false,
                                      desktop: false,
                                    ))
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.2),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 50.0,
                                              sigmaY: 50.0,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 13.0, 15.0, 13.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    FFIcons.kocticonPlay24,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .white,
                                                    size: 30.0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(14.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Preview course',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Sofia Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .white,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (isAndroid)
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(1.0, 1.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 6.0, 6.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'COURSE_PAGE_Container_pect157s_ON_TAP');
                                              logFirebaseEvent(
                                                  'Container_launch_u_r_l');
                                              await launchURL(widget.courseItem!
                                                  .previewVimeoVideoUrl);
                                            },
                                            child: Container(
                                              decoration: const BoxDecoration(),
                                              child: Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Icon(
                                                  FFIcons
                                                      .kmaterialSymbolsLightFullscreen,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 22.0, 16.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  widget.courseItem?.name,
                                                  'title',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displayMedium
                                                        .override(
                                                          fontFamily:
                                                              'Sofia Pro',
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.16,
                                                        ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 2.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        widget.courseItem
                                                            ?.rating.rating
                                                            .toString(),
                                                        '0',
                                                      ),
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Roboto',
                                                        fontSize: 13.0,
                                                      ),
                                                    ),
                                                    if (widget
                                                            .courseItem?.rating
                                                            .hasRating() ??
                                                        true)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    2.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child:
                                                            RatingBarIndicator(
                                                          itemBuilder: (context,
                                                                  index) =>
                                                              Icon(
                                                            FFIcons
                                                                .kmaterialSymbolsStar,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .orange,
                                                          ),
                                                          direction:
                                                              Axis.horizontal,
                                                          rating: widget
                                                              .courseItem!
                                                              .rating
                                                              .rating,
                                                          unratedColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          itemCount: 5,
                                                          itemSize: 20.0,
                                                        ),
                                                      ),
                                                    if (widget
                                                            .courseItem?.rating
                                                            .hasNumber() ??
                                                        true)
                                                      Expanded(
                                                        child: Text(
                                                          '(${widget.courseItem?.rating.number.toString()})',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Roboto',
                                                            fontSize: 13.0,
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) {
                                            if (widget.courseItem?.reference ==
                                                currentUserDocument
                                                    ?.courseProgress
                                                    .refCourse) {
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'COURSE_PAGE_Container_zhks4ukg_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Container_navigate_to');

                                                  context.pushNamed(
                                                    'Video',
                                                    queryParameters: {
                                                      'videoItem':
                                                          serializeParam(
                                                        lessonListCourseVideoRecordList[currentUserDocument!
                                                                    .courseProgress
                                                                    .refVideos.isNotEmpty
                                                            ? ((int?
                                                                lastCompletedLessonIndex) {
                                                                return lastCompletedLessonIndex !=
                                                                        null
                                                                    ? lastCompletedLessonIndex +
                                                                        1
                                                                    : 0;
                                                              }(functions.videoIndexInList(
                                                                currentUserDocument
                                                                    ?.courseProgress
                                                                    .refVideos
                                                                    .last,
                                                                lessonListCourseVideoRecordList
                                                                    .toList())))
                                                            : 0],
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'videoItem': lessonListCourseVideoRecordList[currentUserDocument!
                                                                  .courseProgress
                                                                  .refVideos.isNotEmpty
                                                          ? ((int?
                                                              lastCompletedLessonIndex) {
                                                              return lastCompletedLessonIndex !=
                                                                      null
                                                                  ? lastCompletedLessonIndex +
                                                                      1
                                                                  : 0;
                                                            }(functions.videoIndexInList(
                                                              currentUserDocument
                                                                  ?.courseProgress
                                                                  .refVideos
                                                                  .last,
                                                              lessonListCourseVideoRecordList
                                                                  .toList())))
                                                          : 0],
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  width: 149.0,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .gradient2,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .aquaBreeze
                                                      ],
                                                      stops: const [0.0, 1.0],
                                                      begin:
                                                          const AlignmentDirectional(
                                                              0.0, 1.0),
                                                      end: const AlignmentDirectional(
                                                          0, -1.0),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 7.0,
                                                                0.0, 7.0),
                                                    child: Text(
                                                      'Continue ',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleMedium
                                                          .override(
                                                            fontFamily:
                                                                'Sofia Pro',
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.16,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            } else {
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'COURSE_PAGE_Container_mhmj5gtc_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Container_backend_call');

                                                  await currentUserReference!
                                                      .update(
                                                          createUsersRecordData(
                                                    courseProgress:
                                                        createCourseProgressStruct(
                                                      refCourse: widget
                                                          .courseItem
                                                          ?.reference,
                                                      fieldValues: {
                                                        'ref_videos':
                                                            FieldValue.delete(),
                                                      },
                                                      clearUnsetFields: false,
                                                    ),
                                                  ));
                                                  logFirebaseEvent(
                                                      'Container_navigate_to');

                                                  context.pushNamed(
                                                    'Video',
                                                    queryParameters: {
                                                      'videoItem':
                                                          serializeParam(
                                                        lessonListCourseVideoRecordList
                                                            .first,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'videoItem':
                                                          lessonListCourseVideoRecordList
                                                              .first,
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  width: 149.0,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .gradient2,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .aquaBreeze
                                                      ],
                                                      stops: const [0.0, 1.0],
                                                      begin:
                                                          const AlignmentDirectional(
                                                              0.0, 1.0),
                                                      end: const AlignmentDirectional(
                                                          0, -1.0),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 7.0,
                                                                0.0, 7.0),
                                                    child: Text(
                                                      'Enroll',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleMedium
                                                          .override(
                                                            fontFamily:
                                                                'Sofia Pro',
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.16,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 14.0, 0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget.courseItem?.description.text,
                                          'description',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Sofia Pro',
                                              useGoogleFonts: false,
                                              lineHeight: 1.16,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Icon(
                                            FFIcons
                                                .kfluentClipboardBulletListLtr20Regular,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 20.0,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    3.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'This course include',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final included = widget.courseItem
                                                  ?.description.included
                                                  .toList() ??
                                              [];
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children:
                                                List.generate(included.length,
                                                    (includedIndex) {
                                              final includedItem =
                                                  included[includedIndex];
                                              return Text(
                                                '   •   $includedItem',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              );
                                            }).divide(const SizedBox(height: 1.16)),
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 18.0, 0.0, 0.0),
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
                                                    'COURSE_PAGE_Container_u9p59p6v_ON_TAP');
                                                logFirebaseEvent(
                                                    'courseButton_update_page_state');
                                                setState(() {
                                                  _model.activeButton =
                                                      'lessons';
                                                });
                                              },
                                              child: wrapWithModel(
                                                model:
                                                    _model.courseButtonModel1,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: CourseButtonWidget(
                                                  text: 'Lessons',
                                                  isActive:
                                                      _model.activeButton ==
                                                          'lessons',
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
                                                    'COURSE_PAGE_Container_6bugh5ru_ON_TAP');
                                                logFirebaseEvent(
                                                    'courseButton_update_page_state');
                                                setState(() {
                                                  _model.activeButton =
                                                      'masterclass';
                                                });
                                              },
                                              child: wrapWithModel(
                                                model:
                                                    _model.courseButtonModel2,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: CourseButtonWidget(
                                                  text: 'Masterclass',
                                                  isActive:
                                                      _model.activeButton ==
                                                          'masterclass',
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
                                                    'COURSE_PAGE_Container_hnhbwbci_ON_TAP');
                                                logFirebaseEvent(
                                                    'courseButton_update_page_state');
                                                setState(() {
                                                  _model.activeButton = 'faq';
                                                });
                                              },
                                              child: wrapWithModel(
                                                model:
                                                    _model.courseButtonModel3,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: CourseButtonWidget(
                                                  text: 'FAQ',
                                                  isActive:
                                                      _model.activeButton ==
                                                          'faq',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 18.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(),
                                        child: Builder(
                                          builder: (context) {
                                            if (_model.activeButton ==
                                                'lessons') {
                                              return Builder(
                                                builder: (context) {
                                                  final lesson =
                                                      lessonListCourseVideoRecordList
                                                          .toList();
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: List.generate(
                                                        lesson.length,
                                                        (lessonIndex) {
                                                      final lessonItem =
                                                          lesson[lessonIndex];
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
                                                              'COURSE_PAGE_Container_7w6pc9f0_ON_TAP');
                                                          logFirebaseEvent(
                                                              'videoElement_navigate_to');

                                                          context.pushNamed(
                                                            'Video',
                                                            queryParameters: {
                                                              'videoItem':
                                                                  serializeParam(
                                                                lessonItem,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'videoItem':
                                                                  lessonItem,
                                                            },
                                                          );
                                                        },
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .videoElementModels1
                                                              .getModel(
                                                            lessonIndex
                                                                .toString(),
                                                            lessonIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              VideoElementWidget(
                                                            key: Key(
                                                              'Key7w6_${lessonIndex.toString()}',
                                                            ),
                                                            videoItem:
                                                                lessonItem,
                                                          ),
                                                        ),
                                                      );
                                                    }).divide(
                                                        const SizedBox(height: 10.0)),
                                                  );
                                                },
                                              );
                                            } else if (_model.activeButton ==
                                                'masterclass') {
                                              return Builder(
                                                builder: (context) {
                                                  final masterclass =
                                                      masterclassListCourseVideoRecordList
                                                          .toList();
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: List.generate(
                                                        masterclass.length,
                                                        (masterclassIndex) {
                                                      final masterclassItem =
                                                          masterclass[
                                                              masterclassIndex];
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
                                                              'COURSE_PAGE_Container_hi2rspr0_ON_TAP');
                                                          if (revenue_cat
                                                              .activeEntitlementIds
                                                              .contains(FFAppState()
                                                                  .entitlementID)) {
                                                            logFirebaseEvent(
                                                                'videoElement_navigate_to');

                                                            context.pushNamed(
                                                              'VideoVimeo',
                                                              queryParameters: {
                                                                'videoVimeoURL':
                                                                    serializeParam(
                                                                  masterclassItem
                                                                      .vimeoVideoUrl,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else {
                                                            logFirebaseEvent(
                                                                'videoElement_navigate_to');

                                                            context.pushNamed(
                                                              'Pricing',
                                                              queryParameters: {
                                                                'offers':
                                                                    serializeParam(
                                                                  PaywallPrice
                                                                      .standard,
                                                                  ParamType
                                                                      .Enum,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          }
                                                        },
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .videoElementModels2
                                                              .getModel(
                                                            masterclassIndex
                                                                .toString(),
                                                            masterclassIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              VideoElementWidget(
                                                            key: Key(
                                                              'Keyhi2_${masterclassIndex.toString()}',
                                                            ),
                                                            videoItem:
                                                                masterclassItem,
                                                          ),
                                                        ),
                                                      );
                                                    }).divide(
                                                        const SizedBox(height: 10.0)),
                                                  );
                                                },
                                              );
                                            } else {
                                              return Builder(
                                                builder: (context) {
                                                  final faq = widget
                                                          .courseItem?.faq
                                                          .toList() ??
                                                      [];
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        faq.length, (faqIndex) {
                                                      final faqItem =
                                                          faq[faqIndex];
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          const Divider(
                                                            thickness: 3.0,
                                                            color: Color(
                                                                0x4DD8DADC),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                          16.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                color: const Color(
                                                                    0x00000000),
                                                                child:
                                                                    ExpandableNotifier(
                                                                  initialExpanded:
                                                                      false,
                                                                  child:
                                                                      ExpandablePanel(
                                                                    header:
                                                                        Text(
                                                                      faqItem
                                                                          .question,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineMedium,
                                                                    ),
                                                                    collapsed:
                                                                        Container(
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                    ),
                                                                    expanded:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        faqItem
                                                                            .answer,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineSmall,
                                                                      ),
                                                                    ),
                                                                    theme:
                                                                        ExpandableThemeData(
                                                                      tapHeaderToExpand:
                                                                          true,
                                                                      tapBodyToExpand:
                                                                          false,
                                                                      tapBodyToCollapse:
                                                                          false,
                                                                      headerAlignment:
                                                                          ExpandablePanelHeaderAlignment
                                                                              .center,
                                                                      hasIcon:
                                                                          true,
                                                                      expandIcon:
                                                                          FFIcons
                                                                              .kplus,
                                                                      collapseIcon:
                                                                          FFIcons
                                                                              .kxmark,
                                                                      iconSize:
                                                                          24.0,
                                                                      iconColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    }),
                                                  );
                                                },
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].addToEnd(const SizedBox(height: 110.0)),
                          ),
                        ),
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 40.0),
                              child: Builder(
                                builder: (context) {
                                  if (widget.courseItem?.reference ==
                                      currentUserDocument
                                          ?.courseProgress.refCourse) {
                                    return FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'COURSE_PAGE_CONTINUE_LEARNING_BTN_ON_TAP');
                                        logFirebaseEvent('Button_navigate_to');

                                        context.pushNamed(
                                          'Video',
                                          queryParameters: {
                                            'videoItem': serializeParam(
                                              lessonListCourseVideoRecordList[
                                                  currentUserDocument!
                                                              .courseProgress
                                                              .refVideos.isNotEmpty
                                                      ? ((int?
                                                          lastCompletedLessonIndex) {
                                                          return lastCompletedLessonIndex !=
                                                                  null
                                                              ? lastCompletedLessonIndex +
                                                                  1
                                                              : 0;
                                                        }(functions.videoIndexInList(
                                                          currentUserDocument
                                                              ?.courseProgress
                                                              .refVideos
                                                              .last,
                                                          lessonListCourseVideoRecordList
                                                              .toList())))
                                                      : 0],
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'videoItem': lessonListCourseVideoRecordList[
                                                currentUserDocument!
                                                            .courseProgress
                                                            .refVideos.isNotEmpty
                                                    ? ((int?
                                                        lastCompletedLessonIndex) {
                                                        return lastCompletedLessonIndex !=
                                                                null
                                                            ? lastCompletedLessonIndex +
                                                                1
                                                            : 0;
                                                      }(functions.videoIndexInList(
                                                        currentUserDocument
                                                            ?.courseProgress
                                                            .refVideos
                                                            .last,
                                                        lessonListCourseVideoRecordList
                                                            .toList())))
                                                    : 0],
                                          },
                                        );
                                      },
                                      text: 'Continue Learning',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 52.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .override(
                                              fontFamily: 'Sofia Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .white,
                                              useGoogleFonts: false,
                                            ),
                                        elevation: 0.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    );
                                  } else {
                                    return FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'COURSE_PAGE_START_LEARNING_BTN_ON_TAP');
                                        logFirebaseEvent('Button_backend_call');

                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          courseProgress:
                                              createCourseProgressStruct(
                                            refCourse:
                                                widget.courseItem?.reference,
                                            fieldValues: {
                                              'ref_videos': FieldValue.delete(),
                                            },
                                            clearUnsetFields: false,
                                          ),
                                        ));
                                        logFirebaseEvent('Button_navigate_to');

                                        context.pushNamed(
                                          'Video',
                                          queryParameters: {
                                            'videoItem': serializeParam(
                                              lessonListCourseVideoRecordList
                                                  .first,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'videoItem':
                                                lessonListCourseVideoRecordList
                                                    .first,
                                          },
                                        );
                                      },
                                      text: 'Start Learning',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 52.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .override(
                                              fontFamily: 'Sofia Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .white,
                                              useGoogleFonts: false,
                                            ),
                                        elevation: 0.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    );
                                  }
                                },
                              ),
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
      ),
    );
  }
}

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/avatar_widget.dart';
import '/components/back_button_widget.dart';
import '/courses/video_comments_bottom_sheet/video_comments_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'video_model.dart';
export 'video_model.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({
    super.key,
    required this.videoItem,
    bool? showBottomButtons,
  }) : this.showBottomButtons = showBottomButtons ?? true;

  final CourseVideoRecord? videoItem;
  final bool showBottomButtons;

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget>
    with TickerProviderStateMixin {
  late VideoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.0,
          end: 1.0,
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 2000.ms,
          duration: 1000.ms,
          begin: 1.0,
          end: 0.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Video'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('VIDEO_PAGE_Video_ON_INIT_STATE');
      logFirebaseEvent('Video_update_page_state');
      setState(() {
        _model.isFavorite =
            (currentUserDocument?.favoriteVideos?.toList() ?? [])
                .contains(widget.videoItem?.reference);
      });
      if (widget.videoItem!.likeDislike
              .where((e) => e.user == currentUserReference)
              .toList()
              .length >
          0) {
        logFirebaseEvent('Video_update_page_state');
        setState(() {
          _model.isLiked = widget.videoItem!.likeDislike
                      .where((e) =>
                          (e.user == currentUserReference) &&
                          (e.isLike == true))
                      .toList()
                      .length >
                  0
              ? true
              : false;
        });
      }
      logFirebaseEvent('Video_firestore_query');
      _model.courseVideosQuery = await queryCourseVideoRecordOnce(
        queryBuilder: (courseVideoRecord) => courseVideoRecord
            .where(
              'course',
              isEqualTo: widget.videoItem?.course,
            )
            .where(
              'type',
              isEqualTo: 'lesson',
            )
            .orderBy('sort'),
      );
      if (_model.courseVideosQuery!
              .take(2)
              .toList()
              .where((e) => e.reference == widget.videoItem?.reference)
              .toList()
              .length <=
          0) {
        if (!revenue_cat.activeEntitlementIds
            .contains(FFAppState().entitlementID)) {
          logFirebaseEvent('Video_navigate_to');

          context.pushNamed(
            'Pricing',
            queryParameters: {
              'offers': serializeParam(
                PaywallPrice.standard,
                ParamType.Enum,
              ),
            }.withoutNulls,
          );

          logFirebaseEvent('Video_navigate_back');
          context.safePop();
          return;
        }
      }
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
        body: StreamBuilder<CourseRecord>(
          stream: CourseRecord.getDocument(widget.videoItem!.course!),
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
            final courseRefItemCourseRecord = snapshot.data!;
            return Container(
              decoration: BoxDecoration(),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).width / 1.72,
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: FlutterFlowWebView(
                                    content: widget.videoItem!.vimeoVideoUrl,
                                    bypass: false,
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
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
                                    tag: widget.videoItem!.imagePath,
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.network(
                                        widget.videoItem!.imagePath,
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
                                    alignment: AlignmentDirectional(0.0, 0.2),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'VIDEO_PAGE_Blur_cgi3l9ga_ON_TAP');
                                        logFirebaseEvent('Blur_backend_call');

                                        await widget.videoItem!.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'views': FieldValue.increment(1),
                                            },
                                          ),
                                        });
                                        logFirebaseEvent('Blur_navigate_to');

                                        context.pushNamed(
                                          'VideoVimeo',
                                          queryParameters: {
                                            'videoVimeoURL': serializeParam(
                                              widget.videoItem?.vimeoVideoUrl,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 50.0,
                                            sigmaY: 50.0,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    50.0, 13.0, 50.0, 13.0),
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          14.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Play',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              'Sofia Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .white,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 50.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'VIDEO_PAGE_Container_ztov4g4t_ON_TAP');
                                      logFirebaseEvent(
                                          'BackButton_navigate_back');
                                      context.safePop();
                                    },
                                    child: wrapWithModel(
                                      model: _model.backButtonModel,
                                      updateCallback: () => setState(() {}),
                                      child: BackButtonWidget(),
                                    ),
                                  ),
                                ),
                                if (isAndroid)
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 6.0, 6.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'VIDEO_PAGE_Container_pg2eng37_ON_TAP');
                                          logFirebaseEvent(
                                              'Container_launch_u_r_l');
                                          await launchURL(
                                              widget.videoItem!.vimeoVideoUrl);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Icon(
                                              FFIcons
                                                  .kmaterialSymbolsLightFullscreen,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                            padding: EdgeInsetsDirectional.fromSTEB(
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
                                            courseRefItemCourseRecord.name,
                                            style: FlutterFlowTheme.of(context)
                                                .displayMedium,
                                          ),
                                        ],
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
                                                  'VIDEO_PAGE_Container_52ovvpw6_ON_TAP');
                                              logFirebaseEvent(
                                                  'Container_backend_call');

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'favorite_videos':
                                                        FieldValue.arrayRemove([
                                                      widget
                                                          .videoItem?.reference
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
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Icon(
                                                  FFIcons.ksubwayHurt,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .melon,
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
                                                  'VIDEO_PAGE_Container_8l0x7apl_ON_TAP');
                                              logFirebaseEvent(
                                                  'Container_backend_call');

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'favorite_videos':
                                                        FieldValue.arrayUnion([
                                                      widget
                                                          .videoItem?.reference
                                                    ]),
                                                  },
                                                ),
                                              });
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              setState(() {
                                                _model.isFavorite = true;
                                              });
                                              logFirebaseEvent(
                                                  'Container_widget_animation');
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Icon(
                                                  FFIcons.ksubwayHurt1,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .melon,
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 7.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.videoItem?.name,
                                      'description',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 14.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.videoItem?.description,
                                      'description',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                                if (widget.videoItem?.hasTextGuides() ?? true)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 18.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final textGuide = widget
                                                .videoItem?.textGuides
                                                ?.toList() ??
                                            [];
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children:
                                              List.generate(textGuide.length,
                                                  (textGuideIndex) {
                                            final textGuideItem =
                                                textGuide[textGuideIndex];
                                            return Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(11.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  color: Color(0x00000000),
                                                  child: ExpandableNotifier(
                                                    initialExpanded: false,
                                                    child: ExpandablePanel(
                                                      header: Text(
                                                        textGuideItem.title,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium,
                                                      ),
                                                      collapsed: Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                      ),
                                                      expanded: Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: MarkdownBody(
                                                            data: textGuideItem
                                                                .textHtml,
                                                            selectable: true,
                                                            onTapLink: (_, url,
                                                                    __) =>
                                                                launchURL(url!),
                                                          ),
                                                        ),
                                                      ),
                                                      theme:
                                                          ExpandableThemeData(
                                                        tapHeaderToExpand: true,
                                                        tapBodyToExpand: false,
                                                        tapBodyToCollapse:
                                                            false,
                                                        headerAlignment:
                                                            ExpandablePanelHeaderAlignment
                                                                .center,
                                                        hasIcon: true,
                                                        iconSize: 24.0,
                                                        iconColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }).divide(SizedBox(height: 6.0)),
                                        );
                                      },
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                                    9.0, 0.0, 5.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Was this helpful?',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    if (_model.isLiked !=
                                                        null) {
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            2.0,
                                                                            2.0),
                                                                child: Icon(
                                                                  FFIcons
                                                                      .kthumbsUp,
                                                                  color: _model
                                                                          .isLiked!
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .success
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  size: 20.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 30.0,
                                                            child:
                                                                VerticalDivider(
                                                              width: 10.0,
                                                              thickness: 1.0,
                                                              indent: 3.0,
                                                              endIndent: 3.0,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent2,
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2.0),
                                                              child: Icon(
                                                                FFIcons
                                                                    .kthumbsDown,
                                                                color: !_model.isLiked!
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .error
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                size: 20.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    } else {
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: InkWell(
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
                                                                logFirebaseEvent(
                                                                    'VIDEO_PAGE_Container_gva5lrl3_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Container_update_page_state');
                                                                setState(() {
                                                                  _model.isLiked =
                                                                      true;
                                                                });
                                                                logFirebaseEvent(
                                                                    'Container_backend_call');

                                                                await widget
                                                                    .videoItem!
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'like_dislike':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        getLikeDislikeFirestoreData(
                                                                          createLikeDislikeStruct(
                                                                            user:
                                                                                currentUserReference,
                                                                            isLike:
                                                                                true,
                                                                            clearUnsetFields:
                                                                                false,
                                                                          ),
                                                                          true,
                                                                        )
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                                logFirebaseEvent(
                                                                    'Container_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  'SendFeedback',
                                                                  queryParameters:
                                                                      {
                                                                    'videoItem':
                                                                        serializeParam(
                                                                      widget
                                                                          .videoItem,
                                                                      ParamType
                                                                          .Document,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    'videoItem':
                                                                        widget
                                                                            .videoItem,
                                                                  },
                                                                );
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          2.0,
                                                                          2.0),
                                                                  child: Icon(
                                                                    FFIcons
                                                                        .kthumbsUp,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 20.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 30.0,
                                                            child:
                                                                VerticalDivider(
                                                              width: 10.0,
                                                              thickness: 1.0,
                                                              indent: 3.0,
                                                              endIndent: 3.0,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent2,
                                                            ),
                                                          ),
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
                                                              logFirebaseEvent(
                                                                  'VIDEO_PAGE_Container_p16ggtvt_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Container_update_page_state');
                                                              setState(() {
                                                                _model.isLiked =
                                                                    false;
                                                              });
                                                              logFirebaseEvent(
                                                                  'Container_backend_call');

                                                              await widget
                                                                  .videoItem!
                                                                  .reference
                                                                  .update({
                                                                ...mapToFirestore(
                                                                  {
                                                                    'like_dislike':
                                                                        FieldValue
                                                                            .arrayUnion([
                                                                      getLikeDislikeFirestoreData(
                                                                        createLikeDislikeStruct(
                                                                          user:
                                                                              currentUserReference,
                                                                          isLike:
                                                                              false,
                                                                          clearUnsetFields:
                                                                              false,
                                                                        ),
                                                                        true,
                                                                      )
                                                                    ]),
                                                                  },
                                                                ),
                                                              });
                                                              logFirebaseEvent(
                                                                  'Container_navigate_to');

                                                              context.pushNamed(
                                                                'SendFeedback',
                                                                queryParameters:
                                                                    {
                                                                  'videoItem':
                                                                      serializeParam(
                                                                    widget
                                                                        .videoItem,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'videoItem':
                                                                      widget
                                                                          .videoItem,
                                                                },
                                                              );
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            2.0),
                                                                child: Icon(
                                                                  FFIcons
                                                                      .kthumbsDown,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 20.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
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
                                          logFirebaseEvent(
                                              'VIDEO_PAGE_Container_vwtd68xs_ON_TAP');
                                          logFirebaseEvent(
                                              'Container_navigate_to');

                                          context.pushNamed(
                                            'SendFeedback',
                                            queryParameters: {
                                              'videoItem': serializeParam(
                                                widget.videoItem,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'videoItem': widget.videoItem,
                                            },
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 5.0, 0.0, 5.0),
                                            child: Text(
                                              'Share feedback',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Sofia Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent3,
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.16,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: FutureBuilder<int>(
                                    future: queryCommentRecordCount(
                                      queryBuilder: (commentRecord) =>
                                          commentRecord.where(
                                        'ref_video',
                                        isEqualTo: widget.videoItem?.reference,
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
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      int commentsCountCount = snapshot.data!;
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'VIDEO_PAGE_CommentsCount_ON_TAP');
                                          logFirebaseEvent(
                                              'CommentsCount_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            useSafeArea: true,
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
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: Container(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.8,
                                                      child:
                                                          VideoCommentsBottomSheetWidget(
                                                        videoRef: widget
                                                            .videoItem!
                                                            .reference,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Comments',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        commentsCountCount
                                                            .toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                if (commentsCountCount > 0)
                                                  StreamBuilder<
                                                      List<CommentRecord>>(
                                                    stream: queryCommentRecord(
                                                      queryBuilder:
                                                          (commentRecord) =>
                                                              commentRecord
                                                                  .where(
                                                                    'ref_video',
                                                                    isEqualTo: widget
                                                                        .videoItem
                                                                        ?.reference,
                                                                  )
                                                                  .orderBy(
                                                                      'created_time'),
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<CommentRecord>
                                                          commentItemCommentRecordList =
                                                          snapshot.data!;
                                                      // Return an empty Container when the item does not exist.
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final commentItemCommentRecord =
                                                          commentItemCommentRecordList
                                                                  .isNotEmpty
                                                              ? commentItemCommentRecordList
                                                                  .first
                                                              : null;
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: StreamBuilder<
                                                            UsersRecord>(
                                                          stream: UsersRecord
                                                              .getDocument(
                                                                  commentItemCommentRecord!
                                                                      .user!),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final userRefItemUsersRecord =
                                                                snapshot.data!;
                                                            return Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            6.0,
                                                                            8.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    wrapWithModel(
                                                                      model: _model
                                                                          .avatarModel,
                                                                      updateCallback:
                                                                          () =>
                                                                              setState(() {}),
                                                                      child:
                                                                          AvatarWidget(
                                                                        diameter:
                                                                            24.0,
                                                                        imagePath:
                                                                            userRefItemUsersRecord.photoUrl,
                                                                        isPremium:
                                                                            false,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          commentItemCommentRecord!
                                                                              .text,
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .headlineSmall
                                                                              .override(
                                                                                fontFamily: 'Sofia Pro',
                                                                                useGoogleFonts: false,
                                                                                lineHeight: 1.16,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .chevronDown,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent3,
                                                                        size:
                                                                            15.0,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ].addToEnd(SizedBox(height: 100.0)),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.7),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 15.0, 10.0, 15.0),
                          child: Text(
                            'This video has been added to your favorites',
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Sofia Pro',
                                      useGoogleFonts: false,
                                      lineHeight: 1.16,
                                    ),
                          ),
                        ),
                      ).animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation']!,
                      ),
                    ),
                    if (widget.showBottomButtons)
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 40.0),
                          child: Builder(
                            builder: (context) {
                              if (_model.courseVideosQuery?.last?.reference ==
                                  widget.videoItem?.reference) {
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'VIDEO_MORE_QUESTIONS_TO_PRACTICE_BTN_ON_');
                                          if (!currentUserDocument!
                                              .courseProgress.refVideos
                                              .contains(widget
                                                  .videoItem?.reference)) {
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            await currentUserReference!.update({
                                              ...createUsersRecordData(
                                                courseProgress:
                                                    createCourseProgressStruct(
                                                  fieldValues: {
                                                    'ref_videos':
                                                        FieldValue.arrayUnion([
                                                      widget
                                                          .videoItem?.reference
                                                    ]),
                                                  },
                                                  clearUnsetFields: false,
                                                ),
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'karma':
                                                      FieldValue.increment(0.1),
                                                },
                                              ),
                                            });
                                          }
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.goNamed(
                                            'LatestInterviewQuestions',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .rightToLeft,
                                              ),
                                            },
                                          );
                                        },
                                        text: 'More questions to Practice ',
                                        options: FFButtonOptions(
                                          height: 52.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .headlineLarge
                                              .override(
                                                fontFamily: 'Sofia Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .white,
                                                useGoogleFonts: false,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (widget.videoItem!.sort > 1)
                                      Expanded(
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'VIDEO_PAGE_Container_4pgdkjbe_ON_TAP');
                                            logFirebaseEvent(
                                                'Container_navigate_to');
                                            if (Navigator.of(context)
                                                .canPop()) {
                                              context.pop();
                                            }
                                            context.pushNamed(
                                              'Video',
                                              queryParameters: {
                                                'videoItem': serializeParam(
                                                  _model.courseVideosQuery?[
                                                      (functions.videoIndexInList(
                                                              widget.videoItem
                                                                  ?.reference,
                                                              _model
                                                                  .courseVideosQuery!
                                                                  .toList())!) -
                                                          1],
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'videoItem': _model
                                                        .courseVideosQuery?[
                                                    (functions.videoIndexInList(
                                                            widget.videoItem
                                                                ?.reference,
                                                            _model
                                                                .courseVideosQuery!
                                                                .toList())!) -
                                                        1],
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .leftToRight,
                                                ),
                                              },
                                            );
                                          },
                                          child: Container(
                                            height: 52.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'Previous Video',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily: 'Sofia Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'VIDEO_PAGE_NEXT_VIDEO_BTN_ON_TAP');
                                          if (!currentUserDocument!
                                              .courseProgress.refVideos
                                              .contains(widget
                                                  .videoItem?.reference)) {
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            await currentUserReference!.update({
                                              ...createUsersRecordData(
                                                courseProgress:
                                                    createCourseProgressStruct(
                                                  fieldValues: {
                                                    'ref_videos':
                                                        FieldValue.arrayUnion([
                                                      widget
                                                          .videoItem?.reference
                                                    ]),
                                                  },
                                                  clearUnsetFields: false,
                                                ),
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'karma':
                                                      FieldValue.increment(0.1),
                                                },
                                              ),
                                            });
                                          }
                                          logFirebaseEvent(
                                              'Button_navigate_to');
                                          if (Navigator.of(context).canPop()) {
                                            context.pop();
                                          }
                                          context.pushNamed(
                                            'Video',
                                            queryParameters: {
                                              'videoItem': serializeParam(
                                                _model.courseVideosQuery?[
                                                    (functions.videoIndexInList(
                                                            widget.videoItem
                                                                ?.reference,
                                                            _model
                                                                .courseVideosQuery!
                                                                .toList())!) +
                                                        1],
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'videoItem': _model
                                                      .courseVideosQuery?[
                                                  (functions.videoIndexInList(
                                                          widget.videoItem
                                                              ?.reference,
                                                          _model
                                                              .courseVideosQuery!
                                                              .toList())!) +
                                                      1],
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .rightToLeft,
                                              ),
                                            },
                                          );
                                        },
                                        text: 'Next Video ',
                                        options: FFButtonOptions(
                                          height: 52.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .headlineLarge
                                              .override(
                                                fontFamily: 'Sofia Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .white,
                                                useGoogleFonts: false,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 7.0)),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

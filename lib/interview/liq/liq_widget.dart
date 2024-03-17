import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/like_profile_avatar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/interview/match_dialog/match_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'liq_model.dart';
export 'liq_model.dart';

class LiqWidget extends StatefulWidget {
  const LiqWidget({
    super.key,
    required this.userItem,
    required this.roomDoc,
  });

  final DocumentReference? userItem;
  final ConferenceRoomRecord? roomDoc;

  @override
  State<LiqWidget> createState() => _LiqWidgetState();
}

class _LiqWidgetState extends State<LiqWidget> with TickerProviderStateMixin {
  late LiqModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: const Offset(0.0, 200.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'likeProfileAvatarOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ShimmerEffect(
          curve: Curves.easeInOut,
          delay: 700.ms,
          duration: 800.ms,
          color: const Color(0x80FFFFFF),
          angle: 0.524,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LiqModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LIQ'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LIQ_PAGE_LIQ_ON_INIT_STATE');
      logFirebaseEvent('LIQ_backend_call');

      await currentUserReference!.update({
        ...mapToFirestore(
          {
            'karma': FieldValue.increment(0.5),
          },
        ),
      });
      if (((currentUserDocument?.likedUsers.toList() ?? [])
              .where((e) => e.refUser == widget.userItem)
              .toList()
              .isNotEmpty) ||
          (currentUserDocument?.dislikedUsers.toList() ?? [])
              .contains(widget.userItem)) {
        logFirebaseEvent('LIQ_navigate_to');

        context.pushNamed(
          'InterviewFeedback',
          queryParameters: {
            'userRef': serializeParam(
              widget.userItem,
              ParamType.DocumentReference,
            ),
            'roomDoc': serializeParam(
              widget.roomDoc,
              ParamType.Document,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            'roomDoc': widget.roomDoc,
          },
        );
      }
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Builder(
          builder: (context) => StreamBuilder<UsersRecord>(
            stream: UsersRecord.getDocument(widget.userItem!)
              ..listen((userRefItemUsersRecord) async {
                if (_model.userRefItemPreviousSnapshot != null &&
                    !const UsersRecordDocumentEquality().equals(
                        userRefItemUsersRecord,
                        _model.userRefItemPreviousSnapshot)) {
                  logFirebaseEvent('LIQ_PAGE_userRefItem_ON_DATA_CHANGE');
                  if (_model.checker) {
                    if (userRefItemUsersRecord.likedUsers
                        .where((e) => e.refUser == currentUserReference)
                        .toList()
                        .isNotEmpty) {
                      logFirebaseEvent('userRefItem_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: const AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: WebViewAware(
                              child: GestureDetector(
                                onTap: () => _model.unfocusNode.canRequestFocus
                                    ? FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode)
                                    : FocusScope.of(context).unfocus(),
                                child: MatchDialogWidget(
                                  userItem: userRefItemUsersRecord,
                                ),
                              ),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));

                      logFirebaseEvent('userRefItem_update_page_state');
                      setState(() {
                        _model.checker = false;
                      });
                    }
                  }

                  setState(() {});
                }
                _model.userRefItemPreviousSnapshot = userRefItemUsersRecord;
              }),
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
              final userRefItemUsersRecord = snapshot.data!;
              return Container(
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(1.0, -1.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'LIQ_PAGE_Container_9ritmqrp_ON_TAP');
                            logFirebaseEvent('Container_navigate_to');

                            context.goNamed(
                              'InterviewFeedback',
                              queryParameters: {
                                'userRef': serializeParam(
                                  widget.userItem,
                                  ParamType.DocumentReference,
                                ),
                                'roomDoc': serializeParam(
                                  widget.roomDoc,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'roomDoc': widget.roomDoc,
                              },
                            );
                          },
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 0.0, 10.0),
                              child: Icon(
                                FFIcons.kxmark,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            30.0, 0.0, 30.0, 0.0),
                        child: Text(
                          'Great job! We know how hard you are trying! Keep it up, you will get there soon 👋',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Sofia Pro',
                                useGoogleFonts: false,
                                lineHeight: 1.16,
                              ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        child: Stack(
                          children: [
                            wrapWithModel(
                              model: _model.likeProfileAvatarModel,
                              updateCallback: () => setState(() {}),
                              child: LikeProfileAvatarWidget(
                                avatar: userRefItemUsersRecord.photoUrl,
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'likeProfileAvatarOnPageLoadAnimation']!),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    13.0, 0.0, 0.0, 30.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${userRefItemUsersRecord.firstName} ${userRefItemUsersRecord.lastName}',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .override(
                                            fontFamily: 'Sofia Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .white,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    if (userRefItemUsersRecord
                                            .careerProfile.role !=
                                        null)
                                      Container(
                                        decoration: const BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 6.0, 0.0, 0.0),
                                          child: StreamBuilder<RoleRecord>(
                                            stream: RoleRecord.getDocument(
                                                userRefItemUsersRecord
                                                    .careerProfile.role!),
                                            builder: (context, snapshot) {
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
                                              final textRoleRecord =
                                                  snapshot.data!;
                                              return Text(
                                                '${textRoleRecord.name} / ${userRefItemUsersRecord.careerProfile.expYears.toString()} years experience',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineMedium
                                                    .override(
                                                      fontFamily: 'Sofia Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .white,
                                                      useGoogleFonts: false,
                                                    ),
                                              );
                                            },
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
                      const Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent('LIQ_PAGE_dislike_ON_TAP');
                              final firestoreBatch =
                                  FirebaseFirestore.instance.batch();
                              try {
                                logFirebaseEvent('dislike_backend_call');

                                firestoreBatch.update(widget.userItem!, {
                                  ...mapToFirestore(
                                    {
                                      'disliked_by': FieldValue.arrayUnion(
                                          [currentUserReference]),
                                    },
                                  ),
                                });
                                logFirebaseEvent('dislike_backend_call');

                                firestoreBatch.update(currentUserReference!, {
                                  ...mapToFirestore(
                                    {
                                      'disliked_users': FieldValue.arrayUnion(
                                          [widget.userItem]),
                                    },
                                  ),
                                });
                                logFirebaseEvent('dislike_navigate_to');

                                context.goNamed(
                                  'InterviewFeedback',
                                  queryParameters: {
                                    'userRef': serializeParam(
                                      widget.userItem,
                                      ParamType.DocumentReference,
                                    ),
                                    'roomDoc': serializeParam(
                                      widget.roomDoc,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'roomDoc': widget.roomDoc,
                                  },
                                );
                              } finally {
                                await firestoreBatch.commit();
                              }
                            },
                            child: Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).error,
                                ),
                              ),
                              child: Icon(
                                FFIcons.kxmark,
                                color: FlutterFlowTheme.of(context).error,
                                size: 40.0,
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent('LIQ_PAGE_like_ON_TAP');
                              final firestoreBatch =
                                  FirebaseFirestore.instance.batch();
                              try {
                                logFirebaseEvent('like_backend_call');

                                firestoreBatch.update(widget.userItem!, {
                                  ...mapToFirestore(
                                    {
                                      'liked_by': FieldValue.arrayUnion(
                                          [currentUserReference]),
                                    },
                                  ),
                                });
                                logFirebaseEvent('like_backend_call');

                                firestoreBatch.update(currentUserReference!, {
                                  ...mapToFirestore(
                                    {
                                      'liked_users': FieldValue.arrayUnion([
                                        getLikedUserItemFirestoreData(
                                          createLikedUserItemStruct(
                                            refUser: widget.userItem,
                                            date: widget.roomDoc?.date,
                                            clearUnsetFields: false,
                                          ),
                                          true,
                                        )
                                      ]),
                                    },
                                  ),
                                });
                                logFirebaseEvent('like_navigate_to');

                                context.goNamed(
                                  'InterviewFeedback',
                                  queryParameters: {
                                    'userRef': serializeParam(
                                      widget.userItem,
                                      ParamType.DocumentReference,
                                    ),
                                    'roomDoc': serializeParam(
                                      widget.roomDoc,
                                      ParamType.Document,
                                    ),
                                    'isLike': serializeParam(
                                      true,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'roomDoc': widget.roomDoc,
                                  },
                                );
                              } finally {
                                await firestoreBatch.commit();
                              }
                            },
                            child: Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).success,
                                ),
                              ),
                              child: Icon(
                                FFIcons.ksubwayHurt,
                                color: FlutterFlowTheme.of(context).success,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 26.0)),
                      ),
                      const Spacer(),
                    ]
                        .addToStart(const SizedBox(height: 50.0))
                        .addToEnd(const SizedBox(height: 40.0)),
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation']!);
            },
          ),
        ),
      ),
    );
  }
}

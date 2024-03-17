import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/avatar_widget.dart';
import '/components/karma_plus_dialog_widget.dart';
import '/components/message_element_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'question_comments_bottom_sheet_model.dart';
export 'question_comments_bottom_sheet_model.dart';

class QuestionCommentsBottomSheetWidget extends StatefulWidget {
  const QuestionCommentsBottomSheetWidget({
    super.key,
    required this.questionRef,
  });

  final DocumentReference? questionRef;

  @override
  State<QuestionCommentsBottomSheetWidget> createState() =>
      _QuestionCommentsBottomSheetWidgetState();
}

class _QuestionCommentsBottomSheetWidgetState
    extends State<QuestionCommentsBottomSheetWidget> {
  late QuestionCommentsBottomSheetModel _model;

  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionCommentsBottomSheetModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.5,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: StreamBuilder<List<CommentInterviewQuestionRecord>>(
        stream: queryCommentInterviewQuestionRecord(
          queryBuilder: (commentInterviewQuestionRecord) =>
              commentInterviewQuestionRecord
                  .where(
                    'ref_question',
                    isEqualTo: widget.questionRef,
                  )
                  .orderBy('created_time', descending: true),
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
          List<CommentInterviewQuestionRecord>
              commentListCommentInterviewQuestionRecordList = snapshot.data!;
          return Container(
            decoration: const BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Comments',
                          style: FlutterFlowTheme.of(context).headlineSmall,
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Container(
                      constraints: BoxConstraints(
                        minHeight: 50.0,
                        maxHeight: MediaQuery.sizeOf(context).height * 0.5,
                      ),
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final comment =
                                commentListCommentInterviewQuestionRecordList
                                    .toList();
                            return ListView.separated(
                              padding: const EdgeInsets.fromLTRB(
                                0,
                                20.0,
                                0,
                                20.0,
                              ),
                              reverse: true,
                              scrollDirection: Axis.vertical,
                              itemCount: comment.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 24.0),
                              itemBuilder: (context, commentIndex) {
                                final commentItem = comment[commentIndex];
                                return StreamBuilder<UsersRecord>(
                                  stream: UsersRecord.getDocument(
                                      commentItem.user!),
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
                                    final userRefItemUsersRecord =
                                        snapshot.data!;
                                    return Container(
                                      decoration: const BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'QUESTION_COMMENTS_BOTTOM_SHEET_Container');
                                              logFirebaseEvent(
                                                  'avatar_navigate_to');

                                              context.pushNamed(
                                                'UserProfile',
                                                queryParameters: {
                                                  'userItem': serializeParam(
                                                    userRefItemUsersRecord,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'userItem':
                                                      userRefItemUsersRecord,
                                                },
                                              );
                                            },
                                            child: AvatarWidget(
                                              key: Key(
                                                  'Keyrj1_${commentIndex}_of_${comment.length}'),
                                              diameter: 24.0,
                                              imagePath: userRefItemUsersRecord
                                                  .photoUrl,
                                              isPremium: false,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    userRefItemUsersRecord
                                                        .firstName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Sofia Pro',
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.16,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .messageElementModels
                                                          .getModel(
                                                        commentIndex.toString(),
                                                        commentIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          MessageElementWidget(
                                                        key: Key(
                                                          'Keywx1_${commentIndex.toString()}',
                                                        ),
                                                        text: commentItem.text,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 14.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Builder(
                                                          builder: (context) {
                                                            if (commentItem
                                                                    .likeDislike
                                                                    .where((e) =>
                                                                        e.user ==
                                                                        currentUserReference)
                                                                    .toList().isNotEmpty) {
                                                              return Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Icon(
                                                                          FFIcons
                                                                              .kthumbsUp,
                                                                          color: commentItem.likeDislike.where((e) => (e.user == currentUserReference) && (e.isLike == true)).toList().isNotEmpty
                                                                              ? FlutterFlowTheme.of(context).success
                                                                              : FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              15.0,
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              6.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '${((commentItem.likeDislike.where((e) => e.isLike == true).toList().length / commentItem.likeDislike.length) * 100).toString()} %',
                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                  fontFamily: 'Sofia Pro',
                                                                                  color: commentItem.likeDislike.where((e) => (e.user == currentUserReference) && (e.isLike == true)).toList().isNotEmpty ? FlutterFlowTheme.of(context).success : FlutterFlowTheme.of(context).primaryText,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Icon(
                                                                            FFIcons.kthumbsDown,
                                                                            color: commentItem.likeDislike.where((e) => (e.user == currentUserReference) && (e.isLike == false)).toList().isNotEmpty
                                                                                ? FlutterFlowTheme.of(context).error
                                                                                : FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                15.0,
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                6.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              '${((commentItem.likeDislike.where((e) => e.isLike == false).toList().length / commentItem.likeDislike.length) * 100).toString()} %',
                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                    fontFamily: 'Sofia Pro',
                                                                                    color: commentItem.likeDislike.where((e) => (e.user == currentUserReference) && (e.isLike == false)).toList().isNotEmpty ? FlutterFlowTheme.of(context).error : FlutterFlowTheme.of(context).primaryText,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            } else {
                                                              return Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
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
                                                                      logFirebaseEvent(
                                                                          'QUESTION_COMMENTS_BOTTOM_SHEET_Container');
                                                                      logFirebaseEvent(
                                                                          'Container_backend_call');

                                                                      await commentItem
                                                                          .reference
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'like_dislike':
                                                                                FieldValue.arrayUnion([
                                                                              getLikeDislikeFirestoreData(
                                                                                createLikeDislikeStruct(
                                                                                  user: currentUserReference,
                                                                                  isLike: true,
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                                true,
                                                                              )
                                                                            ]),
                                                                          },
                                                                        ),
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'Container_backend_call');

                                                                      await userRefItemUsersRecord
                                                                          .reference
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'karma':
                                                                                FieldValue.increment(0.5),
                                                                          },
                                                                        ),
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'Container_trigger_push_notification');
                                                                      triggerPushNotification(
                                                                        notificationTitle:
                                                                            'Cheers to Your Insights! 🌐',
                                                                        notificationText:
                                                                            'Your comment on the latest Interview question has just been upvoted by others. ',
                                                                        notificationSound:
                                                                            'default',
                                                                        userRefs: [
                                                                          userRefItemUsersRecord
                                                                              .reference
                                                                        ],
                                                                        initialPageName:
                                                                            'Question',
                                                                        parameterData: {
                                                                          'questionItem':
                                                                              widget.questionRef,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(2.0),
                                                                        child:
                                                                            Icon(
                                                                          FFIcons
                                                                              .kthumbsUp,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              15.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
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
                                                                        logFirebaseEvent(
                                                                            'QUESTION_COMMENTS_BOTTOM_SHEET_Container');
                                                                        logFirebaseEvent(
                                                                            'Container_backend_call');

                                                                        await commentItem
                                                                            .reference
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'like_dislike': FieldValue.arrayUnion([
                                                                                getLikeDislikeFirestoreData(
                                                                                  createLikeDislikeStruct(
                                                                                    user: currentUserReference,
                                                                                    isLike: false,
                                                                                    clearUnsetFields: false,
                                                                                  ),
                                                                                  true,
                                                                                )
                                                                              ]),
                                                                            },
                                                                          ),
                                                                        });
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(2.0),
                                                                          child:
                                                                              Icon(
                                                                            FFIcons.kthumbsDown,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                15.0,
                                                                          ),
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
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1.0,
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).accent2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AuthUserStreamWidget(
                          builder: (context) => wrapWithModel(
                            model: _model.avatarModel2,
                            updateCallback: () => setState(() {}),
                            child: AvatarWidget(
                              diameter: 24.0,
                              imagePath: currentUserPhoto,
                              isPremium: false,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                11.0, 0.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'Add a comment...',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Sofia Pro',
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                      useGoogleFonts: false,
                                      lineHeight: 1.16,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                contentPadding: const EdgeInsets.all(16.0),
                              ),
                              style: FlutterFlowTheme.of(context).headlineSmall,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
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
                              logFirebaseEvent(
                                  'QUESTION_COMMENTS_BOTTOM_SHEET_Container');
                              if (_model.textController.text != '') {
                                logFirebaseEvent('Container_backend_call');

                                await CommentInterviewQuestionRecord.collection
                                    .doc()
                                    .set(
                                        createCommentInterviewQuestionRecordData(
                                      user: currentUserReference,
                                      text: _model.textController.text,
                                      createdTime: getCurrentTimestamp,
                                      refQuestion: widget.questionRef,
                                    ));
                                logFirebaseEvent('Container_backend_call');

                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'karma': FieldValue.increment(0.5),
                                    },
                                  ),
                                });
                                logFirebaseEvent('Container_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: const AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: const WebViewAware(
                                        child: KarmaPlusDialogWidget(
                                          karmaPoints: 0.5,
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));

                                logFirebaseEvent('Container_reset_form_fields');
                                setState(() {
                                  _model.textController?.clear();
                                });
                              }
                            },
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 0.0, 0.0),
                                child: Icon(
                                  FFIcons.kfluentSend48Regular,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!(isWeb
                      ? MediaQuery.viewInsetsOf(context).bottom > 0
                      : _isKeyboardVisible))
                    Container(
                      height: 40.0,
                      decoration: const BoxDecoration(),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

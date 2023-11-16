import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/avatar_widget.dart';
import '/components/karma_plus_dialog_widget.dart';
import '/components/message_element_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'question_comments_bottom_sheet_model.dart';
export 'question_comments_bottom_sheet_model.dart';

class QuestionCommentsBottomSheetWidget extends StatefulWidget {
  const QuestionCommentsBottomSheetWidget({
    Key? key,
    required this.questionRef,
  }) : super(key: key);

  final DocumentReference? questionRef;

  @override
  _QuestionCommentsBottomSheetWidgetState createState() =>
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
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.5,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
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
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(1.0, 1.0, 1.0, 1.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 5.0),
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
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final comment =
                                commentListCommentInterviewQuestionRecordList
                                    .toList();
                            return ListView.separated(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                20.0,
                                0,
                                20.0,
                              ),
                              reverse: true,
                              scrollDirection: Axis.vertical,
                              itemCount: comment.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 24.0),
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
                                      decoration: BoxDecoration(),
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
                                              padding: EdgeInsetsDirectional
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
                                                        EdgeInsetsDirectional
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
                                                        EdgeInsetsDirectional
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
                                                                    .toList()
                                                                    .length >
                                                                0) {
                                                              return Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Icon(
                                                                          FFIcons
                                                                              .kthumbsUp,
                                                                          color: commentItem.likeDislike.where((e) => (e.user == currentUserReference) && (e.isLike == true)).toList().length > 0
                                                                              ? FlutterFlowTheme.of(context).success
                                                                              : FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              15.0,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              6.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '${((commentItem.likeDislike.where((e) => e.isLike == true).toList().length / commentItem.likeDislike.length) * 100).toString()} %',
                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                  fontFamily: 'Sofia Pro',
                                                                                  color: commentItem.likeDislike.where((e) => (e.user == currentUserReference) && (e.isLike == true)).toList().length > 0 ? FlutterFlowTheme.of(context).success : FlutterFlowTheme.of(context).primaryText,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Icon(
                                                                            FFIcons.kthumbsDown,
                                                                            color: commentItem.likeDislike.where((e) => (e.user == currentUserReference) && (e.isLike == false)).toList().length > 0
                                                                                ? FlutterFlowTheme.of(context).error
                                                                                : FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                15.0,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                6.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              '${((commentItem.likeDislike.where((e) => e.isLike == false).toList().length / commentItem.likeDislike.length) * 100).toString()} %',
                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                    fontFamily: 'Sofia Pro',
                                                                                    color: commentItem.likeDislike.where((e) => (e.user == currentUserReference) && (e.isLike == false)).toList().length > 0 ? FlutterFlowTheme.of(context).error : FlutterFlowTheme.of(context).primaryText,
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
                                                                      triggerPushNotification(
                                                                        notificationTitle:
                                                                            'You recieve 0,5 Karma!',
                                                                        notificationText:
                                                                            'Somebody likes your comment!',
                                                                        notificationSound:
                                                                            'default',
                                                                        userRefs: [
                                                                          userRefItemUsersRecord
                                                                              .reference
                                                                        ],
                                                                        initialPageName:
                                                                            'Home',
                                                                        parameterData: {},
                                                                      );
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            2.0,
                                                                            2.0,
                                                                            2.0,
                                                                            2.0),
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
                                                                    padding: EdgeInsetsDirectional
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
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              2.0,
                                                                              2.0,
                                                                              2.0),
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
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
                            padding: EdgeInsetsDirectional.fromSTEB(
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
                                  borderSide: BorderSide(
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
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 16.0),
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
                              if (_model.textController.text != null &&
                                  _model.textController.text != '') {
                                await CommentInterviewQuestionRecord.collection
                                    .doc()
                                    .set(
                                        createCommentInterviewQuestionRecordData(
                                      user: currentUserReference,
                                      text: _model.textController.text,
                                      createdTime: getCurrentTimestamp,
                                      refQuestion: widget.questionRef,
                                    ));

                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'karma': FieldValue.increment(0.5),
                                    },
                                  ),
                                });
                                await showAlignedDialog(
                                  context: context,
                                  isGlobal: true,
                                  avoidOverflow: false,
                                  targetAnchor: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  followerAnchor: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  builder: (dialogContext) {
                                    return Material(
                                      color: Colors.transparent,
                                      child: WebViewAware(
                                          child: KarmaPlusDialogWidget(
                                        karmaPoints: 0.5,
                                      )),
                                    );
                                  },
                                ).then((value) => setState(() {}));

                                setState(() {
                                  _model.textController?.clear();
                                });
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
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
                      decoration: BoxDecoration(),
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

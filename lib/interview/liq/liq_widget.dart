import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/interview/match_dialog/match_dialog_widget.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'liq_model.dart';
export 'liq_model.dart';

class LiqWidget extends StatefulWidget {
  const LiqWidget({
    Key? key,
    required this.userItem,
  }) : super(key: key);

  final DocumentReference? userItem;

  @override
  _LiqWidgetState createState() => _LiqWidgetState();
}

class _LiqWidgetState extends State<LiqWidget> {
  late LiqModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LiqModel());
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Builder(
          builder: (context) => StreamBuilder<UsersRecord>(
            stream: UsersRecord.getDocument(widget.userItem!)
              ..listen((userRefItemUsersRecord) async {
                if (_model.userRefItemPreviousSnapshot != null &&
                    !UsersRecordDocumentEquality().equals(
                        userRefItemUsersRecord,
                        _model.userRefItemPreviousSnapshot)) {
                  if (userRefItemUsersRecord.likedUsers
                      .contains(currentUserReference)) {
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
                          child: GestureDetector(
                            onTap: () => _model.unfocusNode.canRequestFocus
                                ? FocusScope.of(context)
                                    .requestFocus(_model.unfocusNode)
                                : FocusScope.of(context).unfocus(),
                            child: MatchDialogWidget(
                              userItem: userRefItemUsersRecord,
                            ),
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
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
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(1.00, -1.00),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 0.0, 10.0),
                            child: Icon(
                              FFIcons.kxmark,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
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
                      Spacer(),
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                userRefItemUsersRecord.photoUrl,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.00, 1.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
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
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                      Spacer(),
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
                              await widget.userItem!.update({
                                ...mapToFirestore(
                                  {
                                    'disliked_by': FieldValue.arrayUnion(
                                        [currentUserReference]),
                                  },
                                ),
                              });

                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'disliked_users': FieldValue.arrayUnion(
                                        [widget.userItem]),
                                  },
                                ),
                              });
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
                              await widget.userItem!.update({
                                ...mapToFirestore(
                                  {
                                    'liked_by': FieldValue.arrayUnion(
                                        [currentUserReference]),
                                  },
                                ),
                              });

                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'liked_users': FieldValue.arrayUnion(
                                        [widget.userItem]),
                                  },
                                ),
                              });
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
                        ].divide(SizedBox(width: 26.0)),
                      ),
                      Spacer(),
                    ]
                        .addToStart(SizedBox(height: 50.0))
                        .addToEnd(SizedBox(height: 40.0)),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

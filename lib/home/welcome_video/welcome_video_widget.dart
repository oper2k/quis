import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/back_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'welcome_video_model.dart';
export 'welcome_video_model.dart';

class WelcomeVideoWidget extends StatefulWidget {
  const WelcomeVideoWidget({
    super.key,
    required this.welcomeVideo,
  });

  final WelcomeVideoRecord? welcomeVideo;

  @override
  State<WelcomeVideoWidget> createState() => _WelcomeVideoWidgetState();
}

class _WelcomeVideoWidgetState extends State<WelcomeVideoWidget> {
  late WelcomeVideoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelcomeVideoModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'WelcomeVideo'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('WELCOME_VIDEO_WelcomeVideo_ON_INIT_STATE');
      if (valueOrDefault<bool>(
              currentUserDocument?.isWelcomeAnnouncementEmailSent, false) !=
          true) {
        logFirebaseEvent('WelcomeVideo_backend_call');
        _model.email = await BrevoGroup.sendAScheduledEmailCall.call(
          time: functions.timeToRFC3339(
              functions.timePlusMinutes(getCurrentTimestamp, '15')),
          userEmail: currentUserEmail,
          templateId: 3,
        );
        logFirebaseEvent('WelcomeVideo_backend_call');

        await currentUserReference!.update(createUsersRecordData(
          isWelcomeAnnouncementEmailSent: true,
        ));
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).width / 1.72,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(),
                      child: FlutterFlowWebView(
                        content: widget.welcomeVideo!.vimeoVideo.vimeoVideoUrl,
                        bypass: false,
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
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
                        tag: widget.welcomeVideo!.vimeoVideo.imagePath,
                        transitionOnUserGestures: true,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.network(
                            widget.welcomeVideo!.vimeoVideo.imagePath,
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
                        alignment: const AlignmentDirectional(0.0, 0.7),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'WELCOME_VIDEO_Container_o947uil2_ON_TAP');
                            logFirebaseEvent('Container_navigate_to');

                            context.pushNamed(
                              'VideoVimeo',
                              queryParameters: {
                                'videoVimeoURL': serializeParam(
                                  widget
                                      .welcomeVideo?.vimeoVideo.vimeoVideoUrl,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  50.0, 13.0, 50.0, 13.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    FFIcons.kocticonPlay24,
                                    color: FlutterFlowTheme.of(context).white,
                                    size: 30.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        14.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Play',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .override(
                                            fontFamily: 'Sofia Pro',
                                            color: FlutterFlowTheme.of(context)
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
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 50.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'WELCOME_VIDEO_Container_rrs64zsg_ON_TAP');
                          logFirebaseEvent('BackButton_navigate_back');
                          context.safePop();
                        },
                        child: wrapWithModel(
                          model: _model.backButtonModel,
                          updateCallback: () => setState(() {}),
                          child: const BackButtonWidget(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 22.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.welcomeVideo?.announcementsTitle,
                        'title',
                      ),
                      style: FlutterFlowTheme.of(context).headlineLarge,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.welcomeVideo?.announcementsText,
                          'text',
                        ),
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/interview/interview_questions_bottom_sheet/interview_questions_bottom_sheet_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'video_conf_page_model.dart';
export 'video_conf_page_model.dart';

class VideoConfPageWidget extends StatefulWidget {
  const VideoConfPageWidget({
    Key? key,
    required this.token,
    required this.channelName,
    required this.userProfileImage,
    required this.uid,
  }) : super(key: key);

  final String? token;
  final String? channelName;
  final String? userProfileImage;
  final int? uid;

  @override
  _VideoConfPageWidgetState createState() => _VideoConfPageWidgetState();
}

class _VideoConfPageWidgetState extends State<VideoConfPageWidget> {
  late VideoConfPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoConfPageModel());
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
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: custom_widgets.VideoConfWidget(
                width: double.infinity,
                height: double.infinity,
                uid: widget.uid!,
                channelName: widget.channelName!,
                token: widget.token!,
                userProfileImage: widget.userProfileImage!,
                onMuteTap: () async {},
                onTurnOffTap: () async {},
                onChatTap: () async {},
                onEndTap: () async {},
                onRemoteUserJoin: () async {},
                onRemoteUserLeave: () async {},
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.00, 0.50),
              child: FFButtonWidget(
                onPressed: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return WebViewAware(
                          child: GestureDetector(
                        onTap: () => _model.unfocusNode.canRequestFocus
                            ? FocusScope.of(context)
                                .requestFocus(_model.unfocusNode)
                            : FocusScope.of(context).unfocus(),
                        child: Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: InterviewQuestionsBottomSheetWidget(),
                        ),
                      ));
                    },
                  ).then((value) => safeSetState(() {}));
                },
                text: 'Select a question',
                options: FFButtonOptions(
                  height: 44.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).white,
                  textStyle: FlutterFlowTheme.of(context).headlineMedium,
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

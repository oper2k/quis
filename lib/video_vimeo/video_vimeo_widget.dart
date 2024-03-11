import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'video_vimeo_model.dart';
export 'video_vimeo_model.dart';

class VideoVimeoWidget extends StatefulWidget {
  const VideoVimeoWidget({
    super.key,
    required this.videoVimeoURL,
  });

  final String? videoVimeoURL;

  @override
  State<VideoVimeoWidget> createState() => _VideoVimeoWidgetState();
}

class _VideoVimeoWidgetState extends State<VideoVimeoWidget> {
  late VideoVimeoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoVimeoModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'VideoVimeo'});
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
        backgroundColor: FlutterFlowTheme.of(context).black,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FlutterFlowWebView(
                  content: widget.videoVimeoURL!,
                  bypass: false,
                  height: MediaQuery.sizeOf(context).height * 0.8,
                  verticalScroll: false,
                  horizontalScroll: false,
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('VIDEO_VIMEO_Container_pwp3jx2r_ON_TAP');
                  logFirebaseEvent('Container_navigate_back');
                  context.safePop();
                },
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(),
                  child: Icon(
                    FFIcons.kxmark,
                    color: FlutterFlowTheme.of(context).white,
                    size: 24.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

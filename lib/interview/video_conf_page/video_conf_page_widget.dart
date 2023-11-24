import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'video_conf_page_model.dart';

export 'video_conf_page_model.dart';

class VideoConfPageWidget extends StatefulWidget {
  const VideoConfPageWidget({
    super.key,
    required this.token,
    required this.channelName,
    required this.userProfileImage,
    required this.uid,
  });

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
    if (isiOS && isWeb) {
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
        body: SizedBox(
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
      ),
    );
  }
}

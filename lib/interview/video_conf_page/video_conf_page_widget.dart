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
    Key? key,
    required this.token,
    required this.channelName,
  }) : super(key: key);

  final String? token;
  final String? channelName;

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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: custom_widgets.VideoConfWidget(
            width: double.infinity,
            height: double.infinity,
            channelName: widget.channelName!,
            token: widget.token!,
          ),
        ),
      ),
    );
  }
}

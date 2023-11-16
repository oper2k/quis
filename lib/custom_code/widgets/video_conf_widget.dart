// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class VideoConfWidget extends StatefulWidget {
  const VideoConfWidget({
    Key? key,
    this.width,
    this.height,
    required this.token,
    required this.channelName,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String token;
  final String channelName;

  @override
  _VideoConfWidgetState createState() => _VideoConfWidgetState();
}

class _VideoConfWidgetState extends State<VideoConfWidget> {
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

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://images.unsplash.com/photo-1505673542670-a5e3ff5b14a3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxuaWdodCUyMHNreXxlbnwwfHx8fDE3MDAwODgxNTN8MA&ixlib=rb-4.0.3&q=80&w=1080',
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.00, 1.00),
              child: Container(
                height: 190,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 2,
                          sigmaY: 2,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xACFFFFFF),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 49, 16, 44),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: 70,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                color: Color(0x2B010101),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                FFIcons.kon1,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .white,
                                                size: 30,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 9, 0, 0),
                                              child: Text(
                                                'Mute',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineMedium
                                                    .override(
                                                      fontFamily: 'Sofia Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent3,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: 70,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                color: Color(0x2B010101),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                FFIcons.kcomponent27,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .white,
                                                size: 30,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 9, 0, 0),
                                              child: Text(
                                                'Turn off',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineMedium
                                                    .override(
                                                      fontFamily: 'Sofia Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent3,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: 70,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                color: Color(0x2B010101),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                FFIcons.kchat,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .white,
                                                size: 30,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 9, 0, 0),
                                              child: Text(
                                                'Chat',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineMedium
                                                    .override(
                                                      fontFamily: 'Sofia Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent3,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: 70,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                FFIcons.kxmark,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .white,
                                                size: 40,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 9, 0, 0),
                                              child: Text(
                                                'End',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineMedium
                                                    .override(
                                                      fontFamily: 'Sofia Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts: false,
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
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.00, -1.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: Container(
                          width: 64,
                          height: 5,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(1.00, -1.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

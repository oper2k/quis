// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:ui';

class VideoConfWidget extends StatefulWidget {
  const VideoConfWidget({
    Key? key,
    this.width,
    this.height,
    required this.token,
    required this.channelName,
    required this.uid,
    required this.userProfileImage,
    this.onMuteTap,
    this.onTurnOffTap,
    this.onChatTap,
    this.onEndTap,
    this.onRemoteUserJoin,
    this.onRemoteUserLeave,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String token;
  final String channelName;
  final int uid;
  final String userProfileImage;
  final Future<dynamic> Function()? onMuteTap;
  final Future<dynamic> Function()? onTurnOffTap;
  final Future<dynamic> Function()? onChatTap;
  final Future<dynamic> Function()? onEndTap;
  final Future<dynamic> Function()? onRemoteUserJoin;
  final Future<dynamic> Function()? onRemoteUserLeave;

  @override
  _VideoConfWidgetState createState() => _VideoConfWidgetState();
}

class _VideoConfWidgetState extends State<VideoConfWidget> {
  int? _remoteUid;
  late RtcEngine _engine;

  final ValueNotifier<bool> _localUserJoinedNotifier = ValueNotifier(false);
  final ValueNotifier<bool> _isMicEnabledNotifier = ValueNotifier(true);
  final ValueNotifier<bool> _isCameraEnabledNotifier = ValueNotifier(true);
  final ValueNotifier<bool> _remoteUserMicEnabledNotifier = ValueNotifier(true);
  final ValueNotifier<bool> _remoteUserCameraEnabledNotifier =
      ValueNotifier(true);
  final ValueNotifier<bool> _remoteUserLostConnectionNotifier =
      ValueNotifier(false);

  static const appId = "8a3a660dddd24ceba9680ea671ef3591";

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(
      appId: appId,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));

    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("local user ${connection.localUid} joined");
          setState(() {
            _localUserJoinedNotifier.value = true;
          });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("remote user $remoteUid joined");
          setState(() {
            _remoteUid = remoteUid;
          });
          if (widget.onRemoteUserJoin != null) {
            widget.onRemoteUserJoin!();
          }
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          debugPrint("remote user $remoteUid left channel");
          setState(() {
            _remoteUid = null;
          });
          if (widget.onRemoteUserLeave != null) {
            widget.onRemoteUserLeave!();
          }
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint(
              '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
        onRemoteAudioStateChanged: (
          connection,
          remoteUid,
          RemoteAudioState state,
          reason,
          elapsed,
        ) {
          if (state == RemoteAudioState.remoteAudioStateStopped) {
            _remoteUserMicEnabledNotifier.value = false;
          } else if (state == RemoteAudioState.remoteAudioStateDecoding) {
            _remoteUserMicEnabledNotifier.value = true;
          }
        },
        onRemoteVideoStateChanged: (
          connection,
          remoteUid,
          RemoteVideoState state,
          reason,
          elapsed,
        ) {
          _remoteUserLostConnectionNotifier.value = false;
          if (state == RemoteVideoState.remoteVideoStateStopped) {
            _remoteUserCameraEnabledNotifier.value = false;
          } else if (state == RemoteVideoState.remoteVideoStateDecoding) {
            _remoteUserCameraEnabledNotifier.value = true;
          } else if (state == RemoteVideoState.remoteVideoStateFrozen) {
            _remoteUserLostConnectionNotifier.value = true;
          }
        },
      ),
    );

    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _engine.enableVideo();
    await _engine.startPreview();

    await _engine.joinChannel(
      token: widget.token,
      channelId: widget.channelName,
      uid: widget.uid,
      options: const ChannelMediaOptions(),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _dispose();
  }

  Future<void> _dispose() async {
    await _engine.leaveChannel();
    await _engine.release();
  }

  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return ValueListenableBuilder(
        valueListenable: _remoteUserLostConnectionNotifier,
        builder: (_, isLostConnection, __) => ValueListenableBuilder(
          valueListenable: _remoteUserMicEnabledNotifier,
          builder: (_, isMicEnabled, __) => ValueListenableBuilder(
            valueListenable: _remoteUserCameraEnabledNotifier,
            builder: (_, isCameraEnabled, __) => Stack(
              children: [
                Positioned.fill(
                  child: AgoraVideoView(
                    controller: VideoViewController.remote(
                      rtcEngine: _engine,
                      canvas: VideoCanvas(uid: _remoteUid),
                      connection: RtcConnection(channelId: widget.channelName),
                    ),
                  ),
                ),
                if (!isMicEnabled || !isCameraEnabled)
                  Positioned.fill(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (isLostConnection) const Text('User conection lost'),
                        if (!isMicEnabled) const Text('User muted microphone'),
                        if (!isCameraEnabled)
                          const Text('User turned camera off'),
                      ],
                    ),
                  )
              ],
            ),
          ),
        ),
      );
    } else {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Please wait for remote user to join',
            textAlign: TextAlign.center,
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: _remoteVideo()),
            Align(
              alignment: const AlignmentDirectional(0.00, 1.00),
              child: SizedBox(
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
                              decoration: const BoxDecoration(
                                color: Color(0xACFFFFFF),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 49, 16, 44),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: ValueListenableBuilder(
                                        valueListenable: _isMicEnabledNotifier,
                                        builder: (_, isEnabled, __) =>
                                            GestureDetector(
                                          onTap: () async {
                                            _isMicEnabledNotifier.value =
                                                !isEnabled;
                                            await _engine.muteLocalAudioStream(
                                                isEnabled);
                                            if (widget.onMuteTap != null) {
                                              widget.onMuteTap!();
                                            }
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                width: 70,
                                                height: 70,
                                                decoration: BoxDecoration(
                                                  color: isEnabled
                                                      ? const Color(0x2B010101)
                                                      : Colors.black,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  FFIcons.kon1,
                                                  color: isEnabled
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .white
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .accent3,
                                                  size: 30,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
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
                                    ),
                                    Expanded(
                                      child: ValueListenableBuilder(
                                        valueListenable:
                                            _isCameraEnabledNotifier,
                                        builder: (_, isEnabled, __) =>
                                            GestureDetector(
                                          onTap: () async {
                                            _isCameraEnabledNotifier.value =
                                                !isEnabled;
                                            await _engine.muteLocalVideoStream(
                                                isEnabled);
                                            if (widget.onTurnOffTap != null) {
                                              widget.onTurnOffTap!();
                                            }
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                width: 70,
                                                height: 70,
                                                decoration: BoxDecoration(
                                                  color: isEnabled
                                                      ? const Color(0x2B010101)
                                                      : Colors.black,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  FFIcons.kcomponent27,
                                                  color: isEnabled
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .white
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .accent3,
                                                  size: 30,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
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
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () async {
                                          await _dispose();
                                          if (mounted) {
                                            Navigator.pop(context);
                                          }
                                          if (widget.onEndTap != null) {
                                            widget.onEndTap!();
                                          }
                                        },
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
                                              padding:
                                                  const EdgeInsetsDirectional
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
                      alignment: const AlignmentDirectional(0.00, -1.00),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
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
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
              child: Align(
                alignment: const AlignmentDirectional(1.00, -1.00),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ValueListenableBuilder(
                      valueListenable: _localUserJoinedNotifier,
                      builder: (_, isJoined, __) => ValueListenableBuilder(
                        valueListenable: _isCameraEnabledNotifier,
                        builder: (_, isEnabled, __) {
                          return SizedBox(
                            width: 90,
                            height: 90,
                            child: isJoined && isEnabled
                                ? AgoraVideoView(
                                    controller: VideoViewController(
                                      rtcEngine: _engine,
                                      canvas: const VideoCanvas(uid: 0),
                                    ),
                                  )
                                : _localPlaceholder(),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _localPlaceholder() {
    return Image.network(widget.userProfileImage);
  }
}

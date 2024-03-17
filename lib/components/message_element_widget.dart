import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'message_element_model.dart';
export 'message_element_model.dart';

class MessageElementWidget extends StatefulWidget {
  const MessageElementWidget({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  State<MessageElementWidget> createState() => _MessageElementWidgetState();
}

class _MessageElementWidgetState extends State<MessageElementWidget> {
  late MessageElementModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageElementModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MESSAGE_ELEMENT_messageElement_ON_INIT_S');
      logFirebaseEvent('messageElement_update_component_state');
      setState(() {
        _model.shrinkedText = (String text) {
          return text.length > 300 ? text.substring(0, 300) : text;
        }(widget.text!);
      });
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('MESSAGE_ELEMENT_Container_ngzggshd_ON_TA');
        if (_model.isExpand) {
          logFirebaseEvent('Container_update_component_state');
          setState(() {
            _model.isExpand = false;
          });
        } else {
          logFirebaseEvent('Container_update_component_state');
          setState(() {
            _model.isExpand = true;
          });
        }
      },
      child: Container(
        decoration: const BoxDecoration(),
        child: Builder(
          builder: (context) {
            if (_model.isExpand &&
                (((String? text) {
                      return text != null ? text.length : 0;
                    }(widget.text)) >
                    300)) {
              return Text(
                widget.text!,
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Sofia Pro',
                      fontWeight: FontWeight.w300,
                      useGoogleFonts: false,
                      lineHeight: 1.16,
                    ),
              );
            } else if (!_model.isExpand &&
                (((String? text) {
                      return text != null ? text.length : 0;
                    }(widget.text)) >
                    300)) {
              return RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${valueOrDefault<String>(
                        _model.shrinkedText,
                        'text',
                      )}... ',
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Sofia Pro',
                                fontWeight: FontWeight.w300,
                                useGoogleFonts: false,
                              ),
                    ),
                    TextSpan(
                      text: 'Read more',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Sofia Pro',
                            color: FlutterFlowTheme.of(context).accent3,
                            fontWeight: FontWeight.w300,
                            useGoogleFonts: false,
                          ),
                    )
                  ],
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Sofia Pro',
                        fontWeight: FontWeight.w300,
                        useGoogleFonts: false,
                        lineHeight: 1.16,
                      ),
                ),
              );
            } else {
              return Text(
                widget.text!,
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Sofia Pro',
                      fontWeight: FontWeight.w300,
                      useGoogleFonts: false,
                      lineHeight: 1.16,
                    ),
              );
            }
          },
        ),
      ),
    );
  }
}

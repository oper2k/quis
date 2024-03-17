import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'minus_element_model.dart';
export 'minus_element_model.dart';

class MinusElementWidget extends StatefulWidget {
  const MinusElementWidget({
    super.key,
    required this.text,
    bool? isPlus,
  }) : isPlus = isPlus ?? false;

  final String? text;
  final bool isPlus;

  @override
  State<MinusElementWidget> createState() => _MinusElementWidgetState();
}

class _MinusElementWidgetState extends State<MinusElementWidget> {
  late MinusElementModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MinusElementModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 24.0,
          height: 24.0,
          decoration: BoxDecoration(
            color: widget.isPlus
                ? FlutterFlowTheme.of(context).champagnePink
                : FlutterFlowTheme.of(context).accent3,
            shape: BoxShape.circle,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(
                builder: (context) {
                  if (widget.isPlus) {
                    return FaIcon(
                      FontAwesomeIcons.check,
                      color: FlutterFlowTheme.of(context).white,
                      size: 16.0,
                    );
                  } else {
                    return Container(
                      width: 20.0,
                      height: 2.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).white,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                widget.text,
                'text',
              ),
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'Sofia Pro',
                    color: widget.isPlus
                        ? FlutterFlowTheme.of(context).info
                        : FlutterFlowTheme.of(context).primaryText,
                    useGoogleFonts: false,
                    lineHeight: 1.25,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}

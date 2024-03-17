import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'pick_component_model.dart';
export 'pick_component_model.dart';

class PickComponentWidget extends StatefulWidget {
  const PickComponentWidget({
    super.key,
    this.pickedItem,
    required this.isNotEmpty,
    required this.def,
  });

  final String? pickedItem;
  final bool? isNotEmpty;
  final String? def;

  @override
  State<PickComponentWidget> createState() => _PickComponentWidgetState();
}

class _PickComponentWidgetState extends State<PickComponentWidget> {
  late PickComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PickComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        minHeight: 43.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primary,
        ),
      ),
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Builder(
                builder: (context) {
                  if (widget.isNotEmpty ?? false) {
                    return AutoSizeText(
                      widget.pickedItem!.maybeHandleOverflow(maxChars: 14),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      minFontSize: 12.0,
                    );
                  } else {
                    return AutoSizeText(
                      widget.def!.maybeHandleOverflow(maxChars: 14),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Sofia Pro',
                            color: FlutterFlowTheme.of(context).accent3,
                            useGoogleFonts: false,
                          ),
                      minFontSize: 12.0,
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
              child: FaIcon(
                FontAwesomeIcons.chevronDown,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

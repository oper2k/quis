import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'pseudo_drop_down_model.dart';
export 'pseudo_drop_down_model.dart';

class PseudoDropDownWidget extends StatefulWidget {
  const PseudoDropDownWidget({
    super.key,
    required this.defText,
    this.text,
  });

  final String? defText;
  final String? text;

  @override
  State<PseudoDropDownWidget> createState() => _PseudoDropDownWidgetState();
}

class _PseudoDropDownWidgetState extends State<PseudoDropDownWidget> {
  late PseudoDropDownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PseudoDropDownModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(18.0, 11.0, 18.0, 11.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                valueOrDefault<String>(
                  widget.text != null && widget.text != ''
                      ? widget.text
                      : widget.defText,
                  'text',
                ),
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Sofia Pro',
                      color: widget.text != null && widget.text != ''
                          ? FlutterFlowTheme.of(context).primaryText
                          : FlutterFlowTheme.of(context).accent3,
                      useGoogleFonts: false,
                      lineHeight: 1.16,
                    ),
              ),
            ),
            FaIcon(
              FontAwesomeIcons.chevronDown,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}

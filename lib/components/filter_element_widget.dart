import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filter_element_model.dart';
export 'filter_element_model.dart';

class FilterElementWidget extends StatefulWidget {
  const FilterElementWidget({
    super.key,
    required this.isPicked,
    required this.text,
    bool? withBorder,
  }) : this.withBorder = withBorder ?? true;

  final bool? isPicked;
  final String? text;
  final bool withBorder;

  @override
  State<FilterElementWidget> createState() => _FilterElementWidgetState();
}

class _FilterElementWidgetState extends State<FilterElementWidget> {
  late FilterElementModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterElementModel());
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
        color: widget.isPicked!
            ? FlutterFlowTheme.of(context).powderBlue
            : Colors.transparent,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: widget.withBorder
              ? (widget.isPicked!
                  ? FlutterFlowTheme.of(context).powderBlue
                  : FlutterFlowTheme.of(context).accent2)
              : Color(0x00000000),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(27.0, 12.0, 27.0, 12.0),
        child: Text(
          widget.text!,
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Sofia Pro',
                color: widget.isPicked!
                    ? FlutterFlowTheme.of(context).white
                    : FlutterFlowTheme.of(context).accent2,
                useGoogleFonts: false,
              ),
        ),
      ),
    );
  }
}

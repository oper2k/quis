import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pricing_option_model.dart';
export 'pricing_option_model.dart';

class PricingOptionWidget extends StatefulWidget {
  const PricingOptionWidget({
    super.key,
    String? title,
    String? text,
    bool? isTrial,
    this.trialText,
    required this.isPicked,
  })  : this.title = title ?? 'title',
        this.text = text ?? 'text',
        this.isTrial = isTrial ?? false;

  final String title;
  final String text;
  final bool isTrial;
  final String? trialText;
  final bool? isPicked;

  @override
  State<PricingOptionWidget> createState() => _PricingOptionWidgetState();
}

class _PricingOptionWidgetState extends State<PricingOptionWidget> {
  late PricingOptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PricingOptionModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: double.infinity,
        height: 78.0,
        decoration: BoxDecoration(
          color: widget.isPicked!
              ? FlutterFlowTheme.of(context).blueOcean
              : Color(0x00000000),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: widget.isTrial
                ? FlutterFlowTheme.of(context).tertiary
                : FlutterFlowTheme.of(context).secondary,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.isTrial)
              Container(
                width: double.infinity,
                height: 20.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).tertiary,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.trialText,
                      'trialtext',
                    ),
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Sofia Pro',
                          color: FlutterFlowTheme.of(context).secondary,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                          lineHeight: 0.92,
                        ),
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  14.0,
                  valueOrDefault<double>(
                    widget.isTrial ? 7.0 : 14.0,
                    0.0,
                  ),
                  14.0,
                  valueOrDefault<double>(
                    widget.isTrial ? 7.0 : 14.0,
                    0.0,
                  )),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: widget.isPicked!
                              ? FlutterFlowTheme.of(context).white
                              : FlutterFlowTheme.of(context).secondary,
                          shape: BoxShape.circle,
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Visibility(
                          visible: widget.isPicked ?? true,
                          child: Icon(
                            Icons.check,
                            color: FlutterFlowTheme.of(context).blueOcean,
                            size: 10.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          widget.title,
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Sofia Pro',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.text,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Sofia Pro',
                          color: FlutterFlowTheme.of(context).info,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                        ),
                  ),
                ].divide(SizedBox(height: 8.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

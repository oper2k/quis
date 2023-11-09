import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'deducted_karma_model.dart';
export 'deducted_karma_model.dart';

class DeductedKarmaWidget extends StatefulWidget {
  const DeductedKarmaWidget({
    Key? key,
    required this.deductedKarma,
  }) : super(key: key);

  final double? deductedKarma;

  @override
  _DeductedKarmaWidgetState createState() => _DeductedKarmaWidgetState();
}

class _DeductedKarmaWidgetState extends State<DeductedKarmaWidget> {
  late DeductedKarmaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeductedKarmaModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 2.0, 16.0, 38.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional(1.00, -1.00),
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.00, -1.00),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(),
                        child: Align(
                          alignment: AlignmentDirectional(1.00, 0.00),
                          child: Icon(
                            FFIcons.kcross,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                '${widget.deductedKarma?.toString()} karma will be deducted from your balance',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Sofia Pro',
                      fontWeight: FontWeight.w300,
                      useGoogleFonts: false,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(21.0, 22.0, 21.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Apply',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 52.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle:
                        FlutterFlowTheme.of(context).headlineLarge.override(
                              fontFamily: 'Sofia Pro',
                              color: FlutterFlowTheme.of(context).white,
                              useGoogleFonts: false,
                            ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

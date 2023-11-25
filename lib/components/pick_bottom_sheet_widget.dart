import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pick_bottom_sheet_model.dart';
export 'pick_bottom_sheet_model.dart';

class PickBottomSheetWidget extends StatefulWidget {
  const PickBottomSheetWidget({
    Key? key,
    required this.stringList,
  }) : super(key: key);

  final List<String>? stringList;

  @override
  _PickBottomSheetWidgetState createState() => _PickBottomSheetWidgetState();
}

class _PickBottomSheetWidgetState extends State<PickBottomSheetWidget> {
  late PickBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PickBottomSheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              constraints: BoxConstraints(
                maxHeight: 150.0,
              ),
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Builder(
                  builder: (context) {
                    final string = widget.stringList!.toList();
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(string.length, (stringIndex) {
                          final stringItem = string[stringIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _model.activeItem = stringItem;
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: stringItem == _model.activeItem
                                    ? Color(0xFFC4CBDF)
                                    : Color(0x00000000),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 9.0, 0.0, 9.0),
                                child: Text(
                                  stringItem,
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Sofia Pro',
                                        color: stringItem == _model.activeItem
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .accent2,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ),
                          );
                        })
                            .divide(SizedBox(height: 5.0))
                            .addToStart(SizedBox(height: 5.0))
                            .addToEnd(SizedBox(height: 5.0)),
                      ),
                    );
                  },
                ),
              ),
            ),
            FFButtonWidget(
              onPressed: _model.activeItem == null || _model.activeItem == ''
                  ? null
                  : () async {
                      Navigator.pop(context, _model.activeItem);
                    },
              text: 'Save',
              options: FFButtonOptions(
                width: double.infinity,
                height: 52.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).headlineLarge.override(
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
                disabledColor: FlutterFlowTheme.of(context).secondary,
                disabledTextColor: FlutterFlowTheme.of(context).white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

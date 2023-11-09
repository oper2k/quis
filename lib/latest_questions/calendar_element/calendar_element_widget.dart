import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calendar_element_model.dart';
export 'calendar_element_model.dart';

class CalendarElementWidget extends StatefulWidget {
  const CalendarElementWidget({
    Key? key,
    required this.date,
    required this.isActive,
  }) : super(key: key);

  final DateTime? date;
  final bool? isActive;

  @override
  _CalendarElementWidgetState createState() => _CalendarElementWidgetState();
}

class _CalendarElementWidgetState extends State<CalendarElementWidget> {
  late CalendarElementModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarElementModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: widget.date!.secondsSinceEpoch >= 0,
      child: Container(
        width: 32.0,
        height: 33.0,
        decoration: BoxDecoration(
          color: widget.isActive!
              ? FlutterFlowTheme.of(context).aquaBreeze
              : FlutterFlowTheme.of(context).white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        alignment: AlignmentDirectional(0.00, 0.00),
        child: Text(
          dateTimeFormat('dd', widget.date),
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Sofia Pro',
                color: widget.isActive!
                    ? FlutterFlowTheme.of(context).white
                    : FlutterFlowTheme.of(context).primaryText,
                useGoogleFonts: false,
              ),
        ),
      ),
    );
  }
}

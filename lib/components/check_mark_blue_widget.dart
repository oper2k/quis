import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'check_mark_blue_model.dart';
export 'check_mark_blue_model.dart';

class CheckMarkBlueWidget extends StatefulWidget {
  const CheckMarkBlueWidget({
    Key? key,
    bool? boolean,
  })  : this.boolean = boolean ?? false,
        super(key: key);

  final bool boolean;

  @override
  _CheckMarkBlueWidgetState createState() => _CheckMarkBlueWidgetState();
}

class _CheckMarkBlueWidgetState extends State<CheckMarkBlueWidget> {
  late CheckMarkBlueModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckMarkBlueModel());
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
      width: 20.0,
      height: 20.0,
      decoration: BoxDecoration(
        color: widget.boolean
            ? FlutterFlowTheme.of(context).powderBlue
            : Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: widget.boolean
              ? Colors.transparent
              : FlutterFlowTheme.of(context).accent2,
        ),
      ),
      alignment: AlignmentDirectional(0.00, 0.00),
      child: Visibility(
        visible: widget.boolean,
        child: Icon(
          Icons.check,
          color: FlutterFlowTheme.of(context).primaryBackground,
          size: 10.0,
        ),
      ),
    );
  }
}

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'check_mark_model.dart';
export 'check_mark_model.dart';

class CheckMarkWidget extends StatefulWidget {
  const CheckMarkWidget({
    super.key,
    bool? boolean,
    this.backgroundColor,
  }) : boolean = boolean ?? false;

  final bool boolean;
  final Color? backgroundColor;

  @override
  State<CheckMarkWidget> createState() => _CheckMarkWidgetState();
}

class _CheckMarkWidgetState extends State<CheckMarkWidget> {
  late CheckMarkModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckMarkModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0,
      height: 20.0,
      decoration: BoxDecoration(
        color: widget.boolean ? widget.backgroundColor : Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: widget.boolean
              ? FlutterFlowTheme.of(context).accent2
              : FlutterFlowTheme.of(context).accent2,
        ),
      ),
      alignment: const AlignmentDirectional(0.0, 0.0),
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

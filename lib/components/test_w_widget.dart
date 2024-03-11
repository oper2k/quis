import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_w_model.dart';
export 'test_w_model.dart';

class TestWWidget extends StatefulWidget {
  const TestWWidget({super.key});

  @override
  State<TestWWidget> createState() => _TestWWidgetState();
}

class _TestWWidgetState extends State<TestWWidget> {
  late TestWModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestWModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Hello World',
      style: FlutterFlowTheme.of(context).displayLarge,
    );
  }
}

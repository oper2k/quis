import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'karma_list_item_model.dart';
export 'karma_list_item_model.dart';

class KarmaListItemWidget extends StatefulWidget {
  const KarmaListItemWidget({
    Key? key,
    required this.text,
    required this.points,
  }) : super(key: key);

  final String? text;
  final String? points;

  @override
  _KarmaListItemWidgetState createState() => _KarmaListItemWidgetState();
}

class _KarmaListItemWidgetState extends State<KarmaListItemWidget> {
  late KarmaListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KarmaListItemModel());
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(15.0, 11.0, 15.0, 11.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                child: Text(
                  widget.text!,
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Sofia Pro',
                        useGoogleFonts: false,
                        lineHeight: 1.16,
                      ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                  child: Text(
                    widget.points!,
                    style: TextStyle(
                      fontFamily: 'Sofia Pro',
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: 13.5,
                    ),
                  ),
                ),
                Icon(
                  FFIcons.kgameIconsYinYang,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 20.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

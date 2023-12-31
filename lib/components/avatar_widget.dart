import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'avatar_model.dart';
export 'avatar_model.dart';

class AvatarWidget extends StatefulWidget {
  const AvatarWidget({
    Key? key,
    required this.diameter,
    this.imagePath,
    bool? isPremium,
  })  : this.isPremium = isPremium ?? false,
        super(key: key);

  final double? diameter;
  final String? imagePath;
  final bool isPremium;

  @override
  _AvatarWidgetState createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  late AvatarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AvatarModel());
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
      width: widget.isPremium ? widget.diameter : (widget.diameter! + 4),
      height: widget.isPremium ? widget.diameter : (widget.diameter! + 4),
      child: Stack(
        children: [
          if (widget.isPremium)
            Align(
              alignment: AlignmentDirectional(0.00, 0.00),
              child: Container(
                width: widget.diameter,
                height: widget.diameter,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).gradient2,
                      FlutterFlowTheme.of(context).aquaBreeze
                    ],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(0.0, 1.0),
                    end: AlignmentDirectional(0, -1.0),
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
              child: Builder(
                builder: (context) {
                  if (widget.imagePath != null && widget.imagePath != '') {
                    return Container(
                      width: widget.diameter,
                      height: widget.diameter,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        widget.imagePath!,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else {
                    return Container(
                      width: widget.diameter,
                      height: widget.diameter,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/4.webp',
                        fit: BoxFit.contain,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

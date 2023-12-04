import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/message_element_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'add_ons_copy_model.dart';
export 'add_ons_copy_model.dart';

class AddOnsCopyWidget extends StatefulWidget {
  const AddOnsCopyWidget({Key? key}) : super(key: key);

  @override
  _AddOnsCopyWidgetState createState() => _AddOnsCopyWidgetState();
}

class _AddOnsCopyWidgetState extends State<AddOnsCopyWidget> {
  late AddOnsCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddOnsCopyModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Lottie.asset(
                          'assets/lottie_animations/animation_lnz09grs.json',
                          width: 226.0,
                          height: 171.0,
                          fit: BoxFit.contain,
                          animate: true,
                        ),
                      ),
                      Text(
                        'Get expert coaching, mock interviews, and more',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Sofia Pro',
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                      ),
                      wrapWithModel(
                        model: _model.messageElementModel,
                        updateCallback: () => setState(() {}),
                        child: MessageElementWidget(
                          text:
                              'tetsetsljetlesj,t,.jes.,tj,esjt,ejs,tsej.t,jes,.jt.,sejt,sejt,.jes.tjes.,jt,.esjt.,sjet,jset,.sejt.,esjt,.sjet,.jest,jestje,jt.,esjt,.esjt.ejst,.jjes.tje,.sjte.s,jt.esjt.esjt.esjt.sejt.jes,t.jes.jt,.sejt,.est,.jes,t.jes,.tj.e,sjt,es.tje,.sjt,.esjt,jestjsje.tjes,.tjs.,ejt,.sejt.,esjt,.jest.,jest.,jse,t.jes,.jt,sejt.,sejt.jest,sejt.,sejt.,sejt.,stetsetsljetlesj,t,.jes.,tj,esjt,ejs,tsej.t,jes,.jt.,sejt,sejt,.jes.tjes.,jt,.esjt.,sjet,jset,.sejt.,esjt,.sjet,.jest,jestje,jt.,esjt,.esjt.ejst,.jjes.tje,.sjte.s,jt.esjt.esjt.esjt.sejt.jes,t.jes.jt,.sejt,.est,.jes,t.jes,.tj.e,sjt,es.tje,.sjt,.esjt,jestjsje.tjes,.tjs.,ejt,.sejt.,esjt,.jest.,jest.,jse,t.jes,.jt,sejt.,sejt.jest,sejt.,sejt.,sejt.,stetsetsljetlesj,t,.jes.,tj,esjt,ejs,tsej.t,jes,.jt.,sejt,sejt,.jes.tjes.,jt,.esjt.,sjet,jset,.sejt.,esjt,.sjet,.jest,jestje,jt.,esjt,.esjt.ejst,.jjes.tje,.sjte.s,jt.esjt.esjt.esjt.sejt.jes,t.jes.jt,.sejt,.est,.jes,t.jes,.tj.e,sjt,es.tje,.sjt,.esjt,jestjsje.tjes,.tjs.,ejt,.sejt.,esjt,.jest.,jest.,jse,t.jes,.jt,sejt.,sejt.jest,sejt.,sejt.,sejt.,stetsetsljetlesj,t,.jes.,tj,esjt,ejs,tsej.t,jes,.jt.,sejt,sejt,.jes.tjes.,jt,.esjt.,sjet,jset,.sejt.,esjt,.sjet,.jest,jestje,jt.,esjt,.esjt.ejst,.jjes.tje,.sjte.s,jt.esjt.esjt.esjt.sejt.jes,t.jes.jt,.sejt,.est,.jes,t.jes,.tj.e,sjt,es.tje,.sjt,.esjt,jestjsje.tjes,.tjs.,ejt,.sejt.,esjt,.jest.,jest.,jse,t.jes,.jt,sejt.,sejt.jest,sejt.,sejt.,sejt.,stetsetsljetlesj,t,.jes.,tj,esjt,ejs,tsej.t,jes,.jt.,sejt,sejt,.jes.tjes.,jt,.esjt.,sjet,jset,.sejt.,esjt,.sjet,.jest,jestje,jt.,esjt,.esjt.ejst,.jjes.tje,.sjte.s,jt.esjt.esjt.esjt.sejt.jes,t.jes.jt,.sejt,.est,.jes,t.jes,.tj.e,sjt,es.tje,.sjt,.esjt,jestjsje.tjes,.tjs.,ejt,.sejt.,esjt,.jest.,jest.,jse,t.jes,.jt,sejt.,sejt.jest,sejt.,sejt.,sejt.,s',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: FFButtonWidget(
                    onPressed: _model.pickedAddon == null
                        ? null
                        : () {
                            print('Button pressed ...');
                          },
                    text: 'Buy now',
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
                      disabledColor: FlutterFlowTheme.of(context).secondary,
                      disabledTextColor: FlutterFlowTheme.of(context).white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

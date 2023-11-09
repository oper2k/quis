import '/components/karma_list_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'earn_karma_model.dart';
export 'earn_karma_model.dart';

class EarnKarmaWidget extends StatefulWidget {
  const EarnKarmaWidget({Key? key}) : super(key: key);

  @override
  _EarnKarmaWidgetState createState() => _EarnKarmaWidgetState();
}

class _EarnKarmaWidgetState extends State<EarnKarmaWidget> {
  late EarnKarmaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EarnKarmaModel());
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.safePop();
                },
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(),
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Icon(
                    FFIcons.karrowBack,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 30.0,
                  ),
                ),
              ),
              Text(
                'How to earn Karma',
                style: FlutterFlowTheme.of(context).headlineLarge,
              ),
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          toolbarHeight: 40.0,
          elevation: 0.0,
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 19.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.karmaListItemModel1,
                        updateCallback: () => setState(() {}),
                        child: KarmaListItemWidget(
                          text: 'You fill out profile (photo, user info etc.) ',
                          points: '0,5',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.karmaListItemModel2,
                        updateCallback: () => setState(() {}),
                        child: KarmaListItemWidget(
                          text: 'You complete a lesson (Full Video Watch) ',
                          points: '0,1',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.karmaListItemModel3,
                        updateCallback: () => setState(() {}),
                        child: KarmaListItemWidget(
                          text: 'Daily sign-in to the App',
                          points: '0,1',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.karmaListItemModel4,
                        updateCallback: () => setState(() {}),
                        child: KarmaListItemWidget(
                          text: 'You join Practice Interview',
                          points: '0,5',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.karmaListItemModel5,
                        updateCallback: () => setState(() {}),
                        child: KarmaListItemWidget(
                          text: 'You have great feedback',
                          points: '0,5',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.karmaListItemModel6,
                        updateCallback: () => setState(() {}),
                        child: KarmaListItemWidget(
                          text: 'Your interview questions is published',
                          points: '1,5',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.karmaListItemModel7,
                        updateCallback: () => setState(() {}),
                        child: KarmaListItemWidget(
                          text: 'Your interview question is upvoted',
                          points: '0,5',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.karmaListItemModel8,
                        updateCallback: () => setState(() {}),
                        child: KarmaListItemWidget(
                          text: 'Your interview answer is published',
                          points: '0,5',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.karmaListItemModel9,
                        updateCallback: () => setState(() {}),
                        child: KarmaListItemWidget(
                          text: 'Your interview answer is upvoted',
                          points: '0,5',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.karmaListItemModel10,
                        updateCallback: () => setState(() {}),
                        child: KarmaListItemWidget(
                          text: 'Your comment is upvoted ',
                          points: '0,3',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.karmaListItemModel11,
                        updateCallback: () => setState(() {}),
                        child: KarmaListItemWidget(
                          text:
                              'You referred us to a friend (Friend signed to Premium) ',
                          points: '5',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.karmaListItemModel12,
                        updateCallback: () => setState(() {}),
                        child: KarmaListItemWidget(
                          text: 'YYou purchased any of Add-ons ',
                          points: '2',
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await launchURL(
                              'https://quisapp.notion.site/5327c89c0dc04558add1d77aef5586b1?pvs=25');
                        },
                        child: Container(
                          height: 56.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 11.0, 15.0, 11.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Learn more about Karma',
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                ),
                                Icon(
                                  FFIcons.kchevronDownS,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                ),
              ].addToEnd(SizedBox(height: 50.0)),
            ),
          ),
        ),
      ),
    );
  }
}

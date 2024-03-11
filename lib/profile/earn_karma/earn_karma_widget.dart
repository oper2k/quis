import '/components/karma_list_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'earn_karma_model.dart';
export 'earn_karma_model.dart';

class EarnKarmaWidget extends StatefulWidget {
  const EarnKarmaWidget({super.key});

  @override
  State<EarnKarmaWidget> createState() => _EarnKarmaWidgetState();
}

class _EarnKarmaWidgetState extends State<EarnKarmaWidget> {
  late EarnKarmaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EarnKarmaModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'EarnKarma'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  logFirebaseEvent('EARN_KARMA_Container_7m8cxky7_ON_TAP');
                  logFirebaseEvent('Container_navigate_back');
                  context.safePop();
                },
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(),
                  alignment: AlignmentDirectional(-1.0, 0.0),
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
                          text: 'You purchased any of Add-ons ',
                          points: '2',
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

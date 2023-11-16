import '/components/feature_list_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'pricing_widget.dart' show PricingWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PricingModel extends FlutterFlowModel<PricingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel1;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel2;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel3;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel4;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel5;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel6;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel7;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel8;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel9;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel10;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel11;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel12;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel13;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel14;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel15;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel16;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel17;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel18;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel19;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel20;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel21;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel22;
  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? monthlysubscriptionOutput;
  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? yearlysubscriptionOutput;
  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? onetimeOutput;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    featureListItemModel1 = createModel(context, () => FeatureListItemModel());
    featureListItemModel2 = createModel(context, () => FeatureListItemModel());
    featureListItemModel3 = createModel(context, () => FeatureListItemModel());
    featureListItemModel4 = createModel(context, () => FeatureListItemModel());
    featureListItemModel5 = createModel(context, () => FeatureListItemModel());
    featureListItemModel6 = createModel(context, () => FeatureListItemModel());
    featureListItemModel7 = createModel(context, () => FeatureListItemModel());
    featureListItemModel8 = createModel(context, () => FeatureListItemModel());
    featureListItemModel9 = createModel(context, () => FeatureListItemModel());
    featureListItemModel10 = createModel(context, () => FeatureListItemModel());
    featureListItemModel11 = createModel(context, () => FeatureListItemModel());
    featureListItemModel12 = createModel(context, () => FeatureListItemModel());
    featureListItemModel13 = createModel(context, () => FeatureListItemModel());
    featureListItemModel14 = createModel(context, () => FeatureListItemModel());
    featureListItemModel15 = createModel(context, () => FeatureListItemModel());
    featureListItemModel16 = createModel(context, () => FeatureListItemModel());
    featureListItemModel17 = createModel(context, () => FeatureListItemModel());
    featureListItemModel18 = createModel(context, () => FeatureListItemModel());
    featureListItemModel19 = createModel(context, () => FeatureListItemModel());
    featureListItemModel20 = createModel(context, () => FeatureListItemModel());
    featureListItemModel21 = createModel(context, () => FeatureListItemModel());
    featureListItemModel22 = createModel(context, () => FeatureListItemModel());
  }

  void dispose() {
    unfocusNode.dispose();
    featureListItemModel1.dispose();
    featureListItemModel2.dispose();
    featureListItemModel3.dispose();
    featureListItemModel4.dispose();
    featureListItemModel5.dispose();
    featureListItemModel6.dispose();
    featureListItemModel7.dispose();
    featureListItemModel8.dispose();
    featureListItemModel9.dispose();
    featureListItemModel10.dispose();
    featureListItemModel11.dispose();
    featureListItemModel12.dispose();
    featureListItemModel13.dispose();
    featureListItemModel14.dispose();
    featureListItemModel15.dispose();
    featureListItemModel16.dispose();
    featureListItemModel17.dispose();
    featureListItemModel18.dispose();
    featureListItemModel19.dispose();
    featureListItemModel20.dispose();
    featureListItemModel21.dispose();
    featureListItemModel22.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

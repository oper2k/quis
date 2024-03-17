import '/components/feature_list_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pricing_old_widget.dart' show PricingOldWidget;
import 'package:flutter/material.dart';

class PricingOldModel extends FlutterFlowModel<PricingOldWidget> {
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
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel23;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel24;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel25;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel26;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel27;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel28;
  // Model for featureListItem component.
  late FeatureListItemModel featureListItemModel29;
  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? monthlysubscriptionOutput;
  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? yearlysubscriptionOutput;
  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? onetimeOutput;

  /// Initialization and disposal methods.

  @override
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
    featureListItemModel23 = createModel(context, () => FeatureListItemModel());
    featureListItemModel24 = createModel(context, () => FeatureListItemModel());
    featureListItemModel25 = createModel(context, () => FeatureListItemModel());
    featureListItemModel26 = createModel(context, () => FeatureListItemModel());
    featureListItemModel27 = createModel(context, () => FeatureListItemModel());
    featureListItemModel28 = createModel(context, () => FeatureListItemModel());
    featureListItemModel29 = createModel(context, () => FeatureListItemModel());
  }

  @override
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
    featureListItemModel23.dispose();
    featureListItemModel24.dispose();
    featureListItemModel25.dispose();
    featureListItemModel26.dispose();
    featureListItemModel27.dispose();
    featureListItemModel28.dispose();
    featureListItemModel29.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

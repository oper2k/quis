import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/subscribe/pricing_option/pricing_option_widget.dart';
import 'pricing_widget.dart' show PricingWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PricingModel extends FlutterFlowModel<PricingWidget> {
  ///  Local state fields for this page.

  PaywallPickedOption? pickedOption = PaywallPickedOption.month3;

  bool isOpen = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 0;

  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // State field(s) for RatingBar widget.
  double? ratingBarValue2;
  // State field(s) for RatingBar widget.
  double? ratingBarValue3;
  // State field(s) for RatingBar widget.
  double? ratingBarValue4;
  // State field(s) for RatingBar widget.
  double? ratingBarValue5;
  // State field(s) for RatingBar widget.
  double? ratingBarValue6;
  // Model for pricingOption3months25off.
  late PricingOptionModel pricingOption3months25offModel;
  // Model for pricingOption3months50off.
  late PricingOptionModel pricingOption3months50offModel;
  // Model for pricingOption3monthsStandard.
  late PricingOptionModel pricingOption3monthsStandardModel;
  // Model for pricingOption1month.
  late PricingOptionModel pricingOption1monthModel;
  // Model for pricingOption1week.
  late PricingOptionModel pricingOption1weekModel;
  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? monthlysubscriptionOutput;
  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? weeklysubscriptionOutput;
  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? months3Subscription25OffOutput;
  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? months3Subscription50OffOutput;
  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? months3SubscriptionOutput;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    pricingOption3months25offModel =
        createModel(context, () => PricingOptionModel());
    pricingOption3months50offModel =
        createModel(context, () => PricingOptionModel());
    pricingOption3monthsStandardModel =
        createModel(context, () => PricingOptionModel());
    pricingOption1monthModel = createModel(context, () => PricingOptionModel());
    pricingOption1weekModel = createModel(context, () => PricingOptionModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    pricingOption3months25offModel.dispose();
    pricingOption3months50offModel.dispose();
    pricingOption3monthsStandardModel.dispose();
    pricingOption1monthModel.dispose();
    pricingOption1weekModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/onboarding/guide/walk_element/walk_element_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';

// Focus widget keys for this walkthrough
final columnWr0te2mf = GlobalKey();
final container17vvn5vl = GlobalKey();

/// guideHome1
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// homeButton: 1
      TargetFocus(
        keyTarget: columnWr0te2mf,
        enableOverlayTab: true,
        alignSkip: Alignment.topRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WalkElementWidget(
              text:
                  'You can find everything for your sucess here: Job Referrals, Company Profiles, CV Review, and more',
              index: '1/6',
            ),
          ),
        ],
      ),

      /// karma: 2
      TargetFocus(
        keyTarget: container17vvn5vl,
        enableOverlayTab: true,
        alignSkip: Alignment.topRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WalkElementWidget(
              text:
                  'Karma are points that you get when you complete certain tasks. You can exchange Karma for CV reviews, job referrals, and more. Tap to see the full list when you earn Karma.',
              index: '2/6',
            ),
          ),
        ],
      ),
    ];

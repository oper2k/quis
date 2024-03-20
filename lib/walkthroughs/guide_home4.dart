import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/onboarding/guide/walk_element/walk_element_widget.dart';

// Focus widget keys for this walkthrough
final containerXe0btcpn = GlobalKey();

/// guideHome4
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: containerXe0btcpn,
        enableOverlayTab: true,
        alignSkip: Alignment.topRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkElementWidget(
              text:
                  'This is where magic is happen, you can register here to Practice with like-minded people by tapping “Get Reminder”',
              index: '5/6',
            ),
          ),
        ],
      ),
    ];

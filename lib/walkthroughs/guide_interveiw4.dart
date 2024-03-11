import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/onboarding/guide/walk_element/walk_element_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';

// Focus widget keys for this walkthrough
final column2axfwjh6 = GlobalKey();

/// guideInterveiw4
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: column2axfwjh6,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WalkElementWidget(
              text:
                  'To register to a Practise Interview choose your Role and tap “Get Reminder”',
              index: '6/6',
            ),
          ),
        ],
      ),
    ];

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'like_profile_avatar_model.dart';
export 'like_profile_avatar_model.dart';

class LikeProfileAvatarWidget extends StatefulWidget {
  const LikeProfileAvatarWidget({
    super.key,
    this.avatar,
  });

  final String? avatar;

  @override
  State<LikeProfileAvatarWidget> createState() =>
      _LikeProfileAvatarWidgetState();
}

class _LikeProfileAvatarWidgetState extends State<LikeProfileAvatarWidget> {
  late LikeProfileAvatarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LikeProfileAvatarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widget.avatar != null && widget.avatar != '') {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              widget.avatar!,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          );
        } else {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              'assets/images/Networking_image-min_2.webp',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          );
        }
      },
    );
  }
}

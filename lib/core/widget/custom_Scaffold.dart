import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';

class Customscaffold extends StatelessWidget {
  final String backgroundImage;
  final Widget child;

  Customscaffold({
    required this.child,
    this.backgroundImage = AppAssets.tajMahal,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(

        children: [
      Container(

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.Black.withOpacity(0.7),
              AppColor.Black.withOpacity(0.6),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ), Positioned.fill(child: child),

    ]
    );
  }
}

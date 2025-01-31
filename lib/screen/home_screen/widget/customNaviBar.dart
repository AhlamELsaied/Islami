import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';

class Customnavibar extends StatelessWidget {
  String image;
  bool selectIndex;
  Customnavibar({super.key,required this.image,required this.selectIndex});

  @override
  Widget build(BuildContext context) {
    return BounceInUp(
      controller: (value){
        value.repeat();
      },
      child: Container(
          padding: EdgeInsets.symmetric(horizontal:14 ,vertical:4),
          decoration: BoxDecoration(color: selectIndex?AppColor.Black.withOpacity(0.5):Colors.transparent,borderRadius: BorderRadius.circular(16)),
          child: ImageIcon(AssetImage(image))),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';
import 'package:islami/screen/home_screen/azan/widget/prayTime.dart';
import 'package:islami/screen/home_screen/azan/widget/widget.dart';

class PraycardTime extends StatelessWidget {
  final PrayTime prayer;

  const PraycardTime({super.key,required this.prayer});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal:8),
      padding: const EdgeInsets.symmetric(vertical: 16),
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
              image: AssetImage(AppAssets.prayTime),
              fit: BoxFit.cover)),
      child: Column(
        children: [
          Flexible(
            child: Text(
              prayer.name,
              style: const TextStyle(color: AppColor.white, fontSize: 14),
            ),
          ),
          SizedBox(height: 4,),
          Flexible(
            child: Text(
              prayer.time,
              style: const TextStyle(color: AppColor.white, fontSize:18,fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8,),
          Flexible(
            child: Text(
              prayer.pmAm,
              style: const TextStyle(color: AppColor.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

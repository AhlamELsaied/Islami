import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';
import 'package:islami/screen/home_screen/azan/widget/prayCard.dart';
import 'package:islami/screen/home_screen/azan/widget/prayTime.dart';
import 'package:islami/screen/home_screen/azan/widget/widget.dart';

class PrayCard extends StatelessWidget {
  final PrayTime prayer;
  const PrayCard({super.key,required this.prayer});

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
      children: [Container(
        padding: const EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height * 0.27,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            color: AppColor.DarkGold,
            borderRadius: BorderRadius.circular(30),
            image: const DecorationImage(
                image: AssetImage(AppAssets.backgroundCard), fit: BoxFit.cover)),
        child: Column(
          children: [
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "16 Jul,\n2024",
                      style: TextStyle(color: AppColor.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Pray Time\nTuesday",
                      style: TextStyle(
                          color: AppColor.Black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "09 Muh,\n1446",
                      style: TextStyle(color: AppColor.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.11,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: 5,
                    itemBuilder: (context, index) => PraycardTime(prayer: PrayTime.prayers[index]),
                  ),
                ),
                const SizedBox(height:20,),

                Row(
                  children: [
                    const Expanded(
                      child: Text(
                                   "Next Pray - 02:32",
                        style: TextStyle(color: AppColor.Black, fontSize: 14),textAlign: TextAlign.center,
                      ),
                    ),
                    Image.asset(AppAssets.earphone,color: AppColor.Black,fit: BoxFit.cover,),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    ]
    );
  }
}


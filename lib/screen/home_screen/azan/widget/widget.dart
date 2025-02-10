import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';
import 'package:islami/screen/home_screen/azan/widget/prayCard.dart';
import 'package:islami/screen/home_screen/azan/widget/prayTime.dart';

class PrayCard extends StatelessWidget {
  final PrayTime prayer;

  const PrayCard({super.key, required this.prayer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: AppColor.DarkGold,
        borderRadius: BorderRadius.circular(30),
        image: const DecorationImage(
          image: AssetImage(AppAssets.backgroundCard),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
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
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: PrayTime.prayers.length,
              itemBuilder: (context, index) =>
                  PraycardTime(prayer: PrayTime.prayers[index]),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Next Pray - 02:32",
                style: TextStyle(color: AppColor.Black, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              Image.asset(
                AppAssets.earphone,
                color: AppColor.Black,
                fit: BoxFit.cover,
                width: 24,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

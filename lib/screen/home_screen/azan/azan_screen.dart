import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:islami/core/theme/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';
import 'package:islami/core/widget/custom_Scaffold.dart';
import 'package:islami/screen/home_screen/azan/widget/prayTime.dart';
import 'package:islami/screen/home_screen/azan/widget/widget.dart';

class AzanScreen extends StatelessWidget {
  const AzanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Customscaffold(
      backgroundImage: AppAssets.tajMahalInside,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    AppAssets.routeIslami,
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CarouselSlider.builder(
                    itemCount: PrayTime.prayers.length,
                    itemBuilder: (context, index, realIndex) {
                      return PrayCard(prayer: PrayTime.prayers[index]);
                    },
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.29,
                      viewportFraction: 0.8,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Azkar",
                    style: TextStyle(
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildAzkarCard(
                          AppAssets.evening, "Evening Azkar", context),
                      const SizedBox(width: 20),
                      _buildAzkarCard(
                          AppAssets.morning, "Morning Azkar", context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAzkarCard(String imagePath, String text, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.width * 0.68,
      decoration: BoxDecoration(
        color: AppColor.Black,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColor.Gold, width: 2),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset(
              imagePath,
              fit: BoxFit.scaleDown,
            ),
          ),
          Positioned(
            bottom: 10,
            child: Text(
              text,
              style: const TextStyle(
                color: AppColor.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

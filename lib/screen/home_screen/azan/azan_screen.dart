import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';
import 'package:islami/core/widget/custom_Scaffold.dart';
import 'package:islami/screen/home_screen/azan/widget/widget.dart';

class AzanScreen extends StatelessWidget {

  AzanScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Customscaffold(
      backgroundImage: AppAssets.tajMahalInside,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
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

              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CarouselSlider.builder(
                  itemCount: PrayTime.prayers.length,
                  itemBuilder: (context, index, realIndex) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: PrayCard(prayer: PrayTime.prayers[index]),
                    );
                  },
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.3,
                    viewportFraction: 0.8,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Text(
                    "Azkar",
                    style: TextStyle(
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
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
    );
  }

  Widget _buildAzkarCard(
    String imagePath,
    String text,
    BuildContext context,
  ) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
              color: AppColor.Black,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColor.Gold, width: 2),
            ),
          ),
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

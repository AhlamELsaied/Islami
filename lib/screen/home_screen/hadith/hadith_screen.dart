import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_assets.dart';
import 'package:islami/core/widget/custom_Scaffold.dart';
import 'package:islami/screen/home_screen/hadith/hadethPage.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Customscaffold(
      backgroundImage: AppAssets.verticalMorocco,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.routeIslami),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.6,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    viewportFraction: 0.8,
                  ),
                  itemCount: 50,
                  itemBuilder: (context, index, realIndex) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: HadethPage(index: index + 1),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


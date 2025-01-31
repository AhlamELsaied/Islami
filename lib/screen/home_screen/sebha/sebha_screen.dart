import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';
import 'package:islami/core/widget/custom_Scaffold.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  List<String> tasbeh = [
    "سبحان الله",
    "الحمدلله",
    "لا اله الا الله",
    "الله اكبر",
    "استغفر الله"
  ];
  int counter = 0;
  late String tasbehTitle = tasbeh[0];

  @override
  Widget build(BuildContext context) {
    return Customscaffold(
      backgroundImage: AppAssets.closeUp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Image.asset(
              AppAssets.routeIslami,
              height: MediaQuery.of(context).size.height * 0.15,
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
              style: TextStyle(
                color: AppColor.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  AppAssets.sebha,
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
                Positioned.fill(
                  top: MediaQuery.of(context).size.height * 0.01,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedRotation(
                          duration: const Duration(milliseconds: 100),
                      turns:-counter*pi,
                          child: InkWell(
                            onTap: () {
                              _update();
                            },
                            child: Image.asset(
                              AppAssets.sebhaBody,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              tasbehTitle,
                              style: const TextStyle(
                                color: AppColor.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              counter.toString(),
                              style: const TextStyle(
                                color: AppColor.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.01)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _update() {
    setState(() {
      counter++;
      if (counter == 34) {
        tasbehTitle = tasbeh[(tasbeh.indexOf(tasbehTitle) + 1) % tasbeh.length];
        counter = 0;
      }
    });
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/routes/app_routes_name.dart';
import 'package:islami/core/theme/app_assets.dart';
import 'package:islami/core/widget/shared_preferences.dart';

import '../../core/theme/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkIfFirstTime();
  }  Future<void> _checkIfFirstTime() async {
    bool isFirstOpen = await SharedPreferencesHe.isFirstTime();
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    if (isFirstOpen) {
      Navigator.pushReplacementNamed(context, AppRoutesName.onboarding);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutesName.homeScreen);
    }
  }
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: AppColor.Black,
        body: Stack(
          children: [
            Image.asset(AppAssets.background,
                fit: BoxFit.cover, height: double.infinity),
            Positioned(
              top: -50,
              left: MediaQuery.of(context).size.width * 0.2,
              child: ElasticInUp(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.mosque,
                      width: MediaQuery.of(context).size.width * 0.6,
                    ),
                    Image.asset(
                      AppAssets.glow,
                      width: MediaQuery.of(context).size.width * 0.25,
                    )
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ZoomIn(
                    child: Image.asset(
                      AppAssets.islamiLogof,
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
              ],
            ),
            Dance(
              child: SlideInUp(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(AppAssets.routegold),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              ' by Ahlam ElSayed ',
                              style:
                                  TextStyle(color: AppColor.Gold, fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.21,
              left: 0,
              child: SlideInLeft(
                  child: Image.asset(
                AppAssets.shapeRight,
                width: 110,
                fit: BoxFit.cover,
              )),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.59,
              right: 0,
              child: SlideInRight(
                  child: Image.asset(
                AppAssets.shapeLeft,
                width: 110,
                fit: BoxFit.cover,
              )),
            ),
          ],
        ));
  }
}

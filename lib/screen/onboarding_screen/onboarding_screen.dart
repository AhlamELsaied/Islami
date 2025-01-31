import 'package:flutter/material.dart';
import 'package:islami/core/routes/app_routes_name.dart';
import 'package:islami/core/theme/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';
import 'package:islami/core/widget/shared_preferences.dart';
import 'package:islami/screen/onboarding_screen/widget/build_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _checkIfFirstTime();
  }

  Future<void> _checkIfFirstTime() async {
    bool isFirstOpen = await SharedPreferencesHe.isFirstTime();
    if (!isFirstOpen) {
      Navigator.pushReplacementNamed(context, AppRoutesName.homeScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Black,
      body: Column(
        children: [
          const SizedBox(height: 40),
          Center(child: Image.asset(AppAssets.routeIslami)),
          const SizedBox(height: 30),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              children: [
                buildPage(
                  image: AppAssets.welcome,
                  title: 'Welcome To Islami App',
                ),
                buildPage(
                  image: AppAssets.secondPage,
                  title: 'Welcome To Islami',
                  subtitle: 'We Are Very Excited To Have You In Our Community',
                ),
                buildPage(
                  image: AppAssets.page3,
                  title: 'Reading the Quran',
                  subtitle: 'Read, and your Lord is the Most Generous',
                ),
                buildPage(
                  image: AppAssets.page4,
                  title: 'Bearish',
                  subtitle: 'Praise the name of your Lord, the Most High',
                ),
                buildPage(
                  image: AppAssets.page5,
                  title: 'Holy Quran Radio',
                  subtitle: 'You can listen to the Holy Quran Radio through the application for free and easily',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentPageIndex > 0)
                  TextButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(color: AppColor.Gold),
                    ),
                  )
                else
                  const SizedBox(width: 60),
                Expanded(
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 5,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: AppColor.Gold,
                        dotColor: AppColor.white,
                        dotHeight: 8,
                        dotWidth: 8,
                        spacing: 8,
                      ),
                    ),
                  ),
                ),
                if (currentPageIndex == 4)
                  TextButton(
                    onPressed: () async {
                      await SharedPreferencesHe.setFirstTime();
                      Navigator.pushReplacementNamed(
                          context, AppRoutesName.homeScreen);
                    },
                    child: const Text(
                      'Finish',
                      style: TextStyle(color: AppColor.Gold),
                    ),
                  )
                else
                  TextButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(color: AppColor.Gold),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }}

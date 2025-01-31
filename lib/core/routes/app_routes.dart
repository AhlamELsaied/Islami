import 'package:flutter/cupertino.dart';
import 'package:islami/core/routes/app_routes_name.dart';
import 'package:islami/screen/home_screen/hadith/hadethPage.dart';
import 'package:islami/screen/home_screen/hadith/hadeth_DetailsRow.dart';
import 'package:islami/screen/home_screen/hadith/hadith_screen.dart';
import 'package:islami/screen/home_screen/home_screen.dart';
import 'package:islami/screen/home_screen/quran/quran_screen.dart';
import 'package:islami/screen/home_screen/quran/sura_DetailsRow.dart';
import 'package:islami/screen/home_screen/quran/sura_details.dart';
import 'package:islami/screen/onboarding_screen/onboarding_screen.dart';
import 'package:islami/screen/splash_screen/splash_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutesName.splash: (_) => const SplashScreen(),
    AppRoutesName.onboarding: (_) => const OnboardingScreen(),
    AppRoutesName.homeScreen: (_) => const HomeScreen(),
    AppRoutesName.quranScreen: (_) =>  QuranScreen(),
    AppRoutesName.suraDetails: (_) =>  SuraDetailsScreen(),
    AppRoutesName.suraDetailsRow: (_) =>  SuraDetailsScreenRow(),
    AppRoutesName.hadethScreen: (_) => const HadithScreen(),
    AppRoutesName.hadethDetailsRow: (_) => const HadethDetailsScreenRow(),
  };
}

import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';
import 'package:islami/core/widget/custom_Scaffold.dart';
import 'package:islami/screen/home_screen/azan/azan_screen.dart';
import 'package:islami/screen/home_screen/hadith/hadith_screen.dart';
import 'package:islami/screen/home_screen/quran/quran_screen.dart';
import 'package:islami/screen/home_screen/radio/radio_screen.dart';
import 'package:islami/screen/home_screen/sebha/sebha_screen.dart';
import 'package:islami/screen/home_screen/widget/customNaviBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSelectIndex = 0;
List<Widget>Screen=[QuranScreen(),HadithScreen(),SebhaScreen(),RadioScreen(),AzanScreen()];
  @override
  Widget build(BuildContext context) {
    return Customscaffold(
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Screen[currentSelectIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColor.Gold,
            type: BottomNavigationBarType.fixed,
            fixedColor: AppColor.white,
            showUnselectedLabels: false,
            onTap: (value) {
              currentSelectIndex = value;
              setState(() {});
            },
            currentIndex: currentSelectIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Customnavibar(image: AppAssets.vector,selectIndex: currentSelectIndex==0,),
                  label: 'Quran'),
              BottomNavigationBarItem(
                  icon:Customnavibar(image: AppAssets.bookAlbum,selectIndex: currentSelectIndex==1,),
                  label: 'Hadith'),
              BottomNavigationBarItem(
                  icon: Customnavibar(image: AppAssets.sebhaIcon,selectIndex: currentSelectIndex==2,),
                  label: 'Sebha'),
              BottomNavigationBarItem(
                  icon: Customnavibar(image: AppAssets.radio,selectIndex: currentSelectIndex==3,), label: 'Radio'),
              BottomNavigationBarItem(
                  icon: Customnavibar(image: AppAssets.time,selectIndex: currentSelectIndex==4,), label: 'Azan'),
            ],
          ),
        ),
      ),
    );
  }
}

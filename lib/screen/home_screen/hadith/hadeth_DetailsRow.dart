import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/routes/app_routes_name.dart';
import 'package:islami/core/theme/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';
import 'package:islami/core/widget/custom_Scaffold.dart';
import 'package:islami/screen/home_screen/hadith/hadethPage.dart';
import 'package:islami/screen/home_screen/quran/quran_screen.dart';

class HadethDetailsScreenRow extends StatefulWidget {
  const HadethDetailsScreenRow({super.key});

  @override
  State<HadethDetailsScreenRow> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<HadethDetailsScreenRow> {
  @override
  Widget build(BuildContext context) {
    var argu = ModalRoute.of(context)!.settings.arguments as HadethData;

    return Customscaffold(
      child: Scaffold(
        backgroundColor: AppColor.Black,
        appBar: AppBar(
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: AppColor.Gold),
          centerTitle: true,
          title: Text(
            argu.title,
            style: const TextStyle(
              color: AppColor.Gold,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Row(
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AppAssets.cornerrLeft,
                      width: 110,
                    ),
                    Text(
                      argu.title,
                      style: const TextStyle(
                        color: AppColor.Gold,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Image.asset(
                      AppAssets.cornerrRight,
                      width: 110,
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(8.0),
                    children: [
                      Text(
                        argu.content,
                        style: const TextStyle(
                          color: AppColor.Gold,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Opacity(
                opacity: 0.2,
                child: Image.asset(
                  AppAssets.mosqueBackGround,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 80,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

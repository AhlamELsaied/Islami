import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';

class PrayCard extends StatelessWidget {
  final PrayTime prayer;

  const PrayCard({super.key, required this.prayer});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: AppColor.DarkGold),
      ),
      const Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            " 09 Muh\n 1446",
            style: TextStyle(color: AppColor.white, fontSize: 14),
            textAlign: TextAlign.right,
          ),
        ),
      ),
      Stack(
        children: [Image.asset(
          AppAssets.backgroundCard,
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.25,
          fit: BoxFit.cover,
        ),
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Pray Time \n  Tuesday",
                style: TextStyle(color: AppColor.Black, fontSize: 14,fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
          ),
    ]
      ),

      const Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "16 Jul,\n 2024",
            style: TextStyle(color: AppColor.white, fontSize: 14),
            textAlign: TextAlign.left,
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.15,
          margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 40),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Fajr",
                    style: TextStyle(
                        color: AppColor.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "09:12 \nPM",
                    style: TextStyle(color:AppColor.white, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dhuhr",
                    style: TextStyle(
                        color: AppColor.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "01:01 \nPM",
                    style: TextStyle(color: AppColor.white, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Asr",
                    style: TextStyle(
                        color: AppColor.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "04:38 \nPM",
                    style: TextStyle(color: AppColor.white, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Maghrib",
                    style: TextStyle(
                        color: AppColor.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "07:57 \nPM",
                    style: TextStyle(color: AppColor.white, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Isha",
                    style: TextStyle(
                        color: AppColor.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "09:12 \nPM",
                    style: TextStyle(color: AppColor.white, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}

class PrayTime {
  final String name;
  final String time;

  PrayTime({required this.name, required this.time});
  static List<PrayTime> prayers = [
    PrayTime(name: "Fajr", time: "09:12 \nPM"),
    PrayTime(name: "Dhuhr", time: "01:01 \nPM"),
    PrayTime(name: "Asr", time: "04:38 \nPM"),
    PrayTime(name: "Maghrib", time: "07:57 \nPM"),
    PrayTime(name: "Isha", time: "09:12 \nPM"),
  ];
}

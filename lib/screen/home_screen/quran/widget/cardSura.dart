import 'package:flutter/material.dart';
import 'package:islami/core/routes/app_routes_name.dart';
import 'package:islami/core/theme/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';
import 'package:islami/screen/home_screen/quran/quran_screen.dart';

class CardSura extends StatelessWidget {
 final SuraData dataSura;

  CardSura({super.key,required this.dataSura});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context,  AppRoutesName.suraDetails,arguments:dataSura);
      },
      child: Container(
        margin: EdgeInsets.all(8) ,
        padding: EdgeInsets.all(8),
        decoration:BoxDecoration(
          color: AppColor.Gold,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dataSura.enSura,style: TextStyle(color: AppColor.Black,fontSize: 18,fontWeight: FontWeight.bold),),
                Text(dataSura.arSura,style: TextStyle(color: AppColor.Black,fontSize: 16,fontWeight: FontWeight.bold),),
                Text(dataSura.suraVer+" Verses",style: TextStyle(color: AppColor.Black,fontSize: 14)),

              ],
            ),
            SizedBox(width: 10,),
            Image.asset(AppAssets.hadeth)

          ],
        ),
      ),
    );

  }
}

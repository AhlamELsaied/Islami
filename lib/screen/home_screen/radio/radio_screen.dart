import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';
import 'package:islami/core/widget/custom_Scaffold.dart';
import 'package:islami/screen/home_screen/radio/widget/custom_widget_radio.dart';
import 'package:islami/screen/home_screen/radio/widget/custom_widget_reciters.dart';
import 'package:islami/screen/home_screen/radio/widget/item_radio.dart';
import 'package:islami/screen/home_screen/radio/widget/item_reciters.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Customscaffold(
      backgroundImage: AppAssets.womanReading,
      child: DefaultTabController(
          length: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AppAssets.routeIslami),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColor.semiBlack
                  ),
                  child: TabBar(
                      labelStyle: const TextStyle(
                          color: AppColor.Black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      dividerHeight: 0,
                      unselectedLabelStyle: const TextStyle(
                          color: AppColor.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          color: AppColor.Gold,
                          borderRadius: BorderRadius.circular(12)),
                      tabs:const [
                        Tab(text: "Radio"),
                       Tab(text: "Reciters"),
                      ]),
                ),
             const SizedBox(height: 10,),
             Expanded(
               child: TabBarView(children: [
                    ListView.builder(itemCount: 4,itemBuilder: (context, index) => CustomWidgetRadio(item: ItemRadio.items[index],),),
                 ListView.builder(itemCount: 4,itemBuilder: (context, index) => CustomWidgetReciters(item: ItemReciters.items[index],)),

               ]
                  ),
             )
              ],
            ),
          )),
    );
  }
}

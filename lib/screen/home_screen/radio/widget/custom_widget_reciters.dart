import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_color.dart';
import 'package:islami/screen/home_screen/radio/widget/item_reciters.dart';
import 'package:islami/core/theme/app_assets.dart';

class CustomWidgetReciters extends StatelessWidget {
  final ItemReciters item;

  CustomWidgetReciters({super.key,required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 8),
      height: MediaQuery.of(context).size.height*0.15,
      decoration: BoxDecoration(
          color: AppColor.Gold,
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
              image: AssetImage(AppAssets.mosqueBackGround),
              fit: BoxFit.cover,
              opacity: 0.6)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item.name,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.Black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_arrow,
                    color: AppColor.Black,
                    size: 35,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.volume_down_rounded,
                    color: AppColor.Black,
                    size: 35,
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}

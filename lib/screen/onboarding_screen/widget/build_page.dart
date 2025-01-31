
import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_color.dart';

Widget buildPage({
  required String image,
  required String title,
  String? subtitle,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(image),
      const SizedBox(height: 10),
      Text(
        title,
        style: const TextStyle(
          color: AppColor.Gold,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10),
      if (subtitle != null)
        Text(
          subtitle,
          style: const TextStyle(
            color: AppColor.Gold,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
    ],
  );
}


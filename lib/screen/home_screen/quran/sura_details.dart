import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/routes/app_routes_name.dart';
import 'package:islami/core/theme/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';
import 'package:islami/core/widget/custom_Scaffold.dart';
import 'package:islami/screen/home_screen/quran/quran_screen.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  String sura = "";
  List<String> suraList = [];

  @override
  Widget build(BuildContext context) {
    var argu = ModalRoute.of(context)!.settings.arguments as SuraData;
    final SuraData data = argu;

    if (sura.isEmpty) {
      ReadFile(data.suraIndex);
    }

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
            argu.enSura,
            style: const TextStyle(
              color: AppColor.Gold,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutesName.suraDetailsRow,
                  arguments: data,
                );
              },
              icon: const Icon(
                Icons.list_outlined,
                size: 30,
              ),
            ),
          ],
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
                      argu.arSura,
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
                  child: suraList.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: suraList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: AppColor.Gold,
                                ),
                              ),
                              child: Text(
                                " [ ${index + 1} ] ${suraList[index]} ",
                                style: const TextStyle(
                                  color: AppColor.Gold,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.rtl,
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Opacity(
                opacity: 0.1,
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

  void ReadFile(int index) async {
    sura =
        await rootBundle.loadString('assets/sura/sura_data/${index + 1}.txt');
    suraList = sura.trim().split("\n");
    setState(() {});
  }
}

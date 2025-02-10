import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/routes/app_routes_name.dart';
import 'package:islami/core/theme/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';
import 'package:islami/core/widget/custom_Scaffold.dart';
import 'package:islami/screen/home_screen/quran/widget/suraData.dart';

class SuraDetailsScreenRow extends StatefulWidget {
  const SuraDetailsScreenRow({super.key});

  @override
  State<SuraDetailsScreenRow> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreenRow> {
  String sura = "";
  List<String> suraList = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      var argu = ModalRoute.of(context)!.settings.arguments as SuraData;
      ReadFile(argu.suraIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    var argu = ModalRoute.of(context)!.settings.arguments as SuraData;

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
                  AppRoutesName.suraDetails,
                  arguments: argu,
                );
              },
              icon: const Icon(
                Icons.swap_horiz_sharp,
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
                      : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text.rich(
                          TextSpan(
                            children: suraList.map((e) {
                              int index = suraList.indexOf(e);
                              return TextSpan(
                                text: e,
                                style: const TextStyle(
                                  color: AppColor.Gold,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                children: [
                                  WidgetSpan(
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.asset(
                                          AppAssets.arabicArt,
                                          width: 20,
                                        ),
                                        Text(
                                          (index + 1).toString(),
                                          style: const TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 9
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
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
    String data =
    await rootBundle.loadString('assets/sura/sura_data/${index + 1}.txt');
    setState(() {
      sura = data;
      suraList = sura.trim().split("\n");
    });
  }
}

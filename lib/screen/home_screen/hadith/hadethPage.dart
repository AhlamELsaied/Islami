import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/routes/app_routes_name.dart';
import 'package:islami/core/theme/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';

class HadethPage extends StatefulWidget {
  final int index;

  HadethPage({super.key, required this.index});

  @override
  State<HadethPage> createState() => _HadethPageState();
}

class _HadethPageState extends State<HadethPage> {
  HadethData? hadeth;

  @override
  void initState() {
    super.initState();
    readHadeth(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context,AppRoutesName.hadethDetailsRow,arguments: hadeth,);
      },
      child: Card(
        color: AppColor.Gold,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.hadeth),
                  fit: BoxFit.contain,
                  opacity: 0.4,
                ),
              ),
            ),
            hadeth == null
                ? const Center(child: CircularProgressIndicator())
                : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppAssets.cornerrLeft,
                          width: 70,
                          height: 70,
                          color: AppColor.Black,
                          fit: BoxFit.contain,
                        ),
                        Expanded(
                          child: Text(
                            hadeth?.title ?? " ",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                              color: AppColor.Black,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Image.asset(
                          AppAssets.cornerrRight,
                          width: 70,
                          height: 70,
                          fit: BoxFit.contain,
                          color: AppColor.Black,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    hadeth?.content ?? " ",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColor.Black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
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

  void readHadeth(int index) async {
    var hadethName = "assets/hadeth/hadethFile/h${index}.txt";
    var hadethContent = await rootBundle.loadString(hadethName);
    int firstIndex = hadethContent.indexOf('\n');
    String title = hadethContent.substring(0, firstIndex).trim();
    String content = hadethContent.substring(firstIndex + 1).trim();
    setState(() {
      hadeth = HadethData(title, content);
    });
  }
}

class HadethData {
  String title;
  String content;
  HadethData(this.title, this.content);
}

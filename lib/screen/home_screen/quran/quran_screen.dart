import 'package:flutter/material.dart';
import 'package:islami/core/routes/app_routes_name.dart';
import 'package:islami/core/theme/app_assets.dart';
import 'package:islami/core/theme/app_color.dart';
import 'package:islami/core/widget/custom_Scaffold.dart';
import 'package:islami/screen/home_screen/quran/quran_screen.dart';
import 'package:islami/screen/home_screen/quran/widget/cardSura.dart';
import 'package:islami/screen/home_screen/quran/widget/suraData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranScreen extends StatefulWidget {
  QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<String> arabicQuranSura = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  List<String> englishQuranSura = [
    "Al-Fatiha",
    "Al-Baqarah",
    "Aal-E-Imran",
    "An-Nisa'",
    "Al-Ma'idah",
    "Al-An'am",
    "Al-A'raf",
    "Al-Anfal",
    "At-Tawbah",
    "Yunus",
    "Hud",
    "Yusuf",
    "Ar-Ra'd",
    "Ibrahim",
    "Al-Hijr",
    "An-Nahl",
    "Al-Isra",
    "Al-Kahf",
    "Maryam",
    "Ta-Ha",
    "Al-Anbiya",
    "Al-Hajj",
    "Al-Mu'minun",
    "An-Nur",
    "Al-Furqan",
    "Ash-Shu'ara",
    "An-Naml",
    "Al-Qasas",
    "Al-Ankabut",
    "Ar-Rum",
    "Luqman",
    "As-Sajda",
    "Al-Ahzab",
    "Saba",
    "Fatir",
    "Ya-Sin",
    "As-Saffat",
    "Sad",
    "Az-Zumar",
    "Ghafir",
    "Fussilat",
    "Ash-Shura",
    "Az-Zukhruf",
    "Ad-Dukhan",
    "Al-Jathiya",
    "Al-Ahqaf",
    "Muhammad",
    "Al-Fath",
    "Al-Hujurat",
    "Qaf",
    "Adh-Dhariyat",
    "At-Tur",
    "An-Najm",
    "Al-Qamar",
    "Ar-Rahman",
    "Al-Waqi'a",
    "Al-Hadid",
    "Al-Mujadila",
    "Al-Hashr",
    "Al-Mumtahina",
    "As-Saff",
    "Al-Jumu'a",
    "Al-Munafiqun",
    "At-Taghabun",
    "At-Talaq",
    "At-Tahrim",
    "Al-Mulk",
    "Al-Qalam",
    "Al-Haqqah",
    "Al-Ma'arij",
    "Nuh",
    "Al-Jinn",
    "Al-Muzzammil",
    "Al-Muddathir",
    "Al-Qiyamah",
    "Al-Insan",
    "Al-Mursalat",
    "An-Naba'",
    "An-Nazi'at",
    "Abasa",
    "At-Takwir",
    "Al-Infitar",
    "Al-Mutaffifin",
    "Al-Inshiqaq",
    "Al-Buruj",
    "At-Tariq",
    "Al-A'la",
    "Al-Ghashiyah",
    "Al-Fajr",
    "Al-Balad",
    "Ash-Shams",
    "Al-Lail",
    "Ad-Duha",
    "Ash-Sharh",
    "At-Tin",
    "Al-Alaq",
    "Al-Qadr",
    "Al-Bayyina",
    "Az-Zalzalah",
    "Al-Adiyat",
    "Al-Qari'a",
    "At-Takathur",
    "Al-Asr",
    "Al-Humazah",
    "Al-Fil",
    "Quraysh",
    "Al-Ma'un",
    "Al-Kawthar",
    "Al-Kafirun",
    "An-Nasr",
    "Al-Masad",
    "Al-Ikhlas",
    "Al-Falaq",
    "An-Nas"
  ];

  List<String> ayaNumber = [
    '7',
    '286',
    '200',
    '176',
    '120',
    '165',
    '206',
    '75',
    '129',
    '109',
    '123',
    '111',
    '43',
    '52',
    '99',
    '128',
    '111',
    '110',
    '98',
    '135',
    '112',
    '78',
    '118',
    '64',
    '77',
    '227',
    '93',
    '88',
    '69',
    '60',
    '34',
    '30',
    '73',
    '54',
    '45',
    '83',
    '182',
    '88',
    '75',
    '85',
    '54',
    '53',
    '89',
    '59',
    '37',
    '35',
    '38',
    '29',
    '18',
    '45',
    '60',
    '49',
    '62',
    '55',
    '78',
    '96',
    '29',
    '22',
    '24',
    '13',
    '14',
    '11',
    '11',
    '18',
    '12',
    '12',
    '30',
    '52',
    '52',
    '44',
    '28',
    '28',
    '20',
    '56',
    '40',
    '31',
    '50',
    '40',
    '46',
    '42',
    '29',
    '19',
    '36',
    '25',
    '22',
    '17',
    '19',
    '26',
    '30',
    '20',
    '15',
    '21',
    '11',
    '8',
    '5',
    '19',
    '5',
    '8',
    '8',
    '11',
    '11',
    '8',
    '3',
    '9',
    '5',
    '4',
    '6',
    '3',
    '6',
    '3',
    '5',
    '4',
    '5',
    '6'
  ];

  List<int> ids = [];
  List<int> cardId = [];

  @override
  void initState() {
    super.initState();
    getCard();
  }

  @override
  Widget build(BuildContext context) {
    return Customscaffold(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Image.asset(AppAssets.routeIslami),
            ),
            SliverToBoxAdapter(
              child: Theme(
                data: ThemeData(
                    textSelectionTheme: TextSelectionThemeData(
                        selectionColor: AppColor.white.withOpacity(0.3),
                        selectionHandleColor: AppColor.white)),
                child: TextField(
                    style: const TextStyle(
                        color: AppColor.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    cursorColor: AppColor.white,
                    spellCheckConfiguration: const SpellCheckConfiguration(
                        misspelledSelectionColor: AppColor.white),
                    decoration: InputDecoration(
                        fillColor: AppColor.Black.withOpacity(0.3),
                        filled: true,
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(right: 9, left: 9),
                          child: ImageIcon(
                            AssetImage(AppAssets.vector),
                            color: AppColor.Gold,
                            size: 20,
                          ),
                        ),
                        hintText: "Sura Name",
                        hintStyle: const TextStyle(
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: AppColor.Gold,
                              width: 2,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: AppColor.Gold,
                              width: 2,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: AppColor.Gold,
                              width: 3,
                            ))),
                    onChanged: (value) {
                      searchSura(value);
                    }),
              ),
            ),
            if (cardId.isNotEmpty)
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 120,
                  child: ListView.builder(
                    itemCount: cardId.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      int use = cardId[index];
                      return CardSura(
                          dataSura: SuraData(arabicQuranSura[use],
                              englishQuranSura[use], use, ayaNumber[use]));
                    },
                  ),
                ),
              ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            const SliverToBoxAdapter(
              child: Text(
                'Suras List',
                style: TextStyle(
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  int useIndex = ids.isNotEmpty ? ids[index] : index;
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          add(useIndex);
                          Navigator.pushNamed(
                              context, AppRoutesName.suraDetails,
                              arguments: SuraData(
                                  arabicQuranSura[useIndex],
                                  englishQuranSura[useIndex],
                                  useIndex,
                                  ayaNumber[useIndex]));
                        },
                        child: Row(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  AppAssets.arabicArt,
                                  width: 40,
                                ),
                                Text(
                                  (useIndex + 1).toString(),
                                  style: const TextStyle(
                                      color: AppColor.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  englishQuranSura[useIndex],
                                  style: const TextStyle(
                                      color: AppColor.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${ayaNumber[useIndex]} Verses",
                                  style: const TextStyle(
                                      color: AppColor.white, fontSize: 16),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              arabicQuranSura[useIndex],
                              style: const TextStyle(
                                  color: AppColor.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                        indent: 30,
                        endIndent: 30,
                      ),
                    ],
                  );
                },
                childCount: ids.isEmpty ? 114 : ids.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void searchSura(String searchText) {
    var reg = RegExp("[\u0621-\u064A\s0-9]+");
    ids.clear();

    if (reg.hasMatch(searchText)) {
      arabicQuranSura.where(
        (sura) {
          if (sura.toLowerCase().contains(searchText.toLowerCase())) {
            ids.add(arabicQuranSura.indexOf(sura));
          }
          return true;
        },
      ).toList();
    } else {
      englishQuranSura.where(
        (sura) {
          if (sura.toLowerCase().contains(searchText.toLowerCase())) {
            ids.add(englishQuranSura.indexOf(sura));
          }
          return true;
        },
      ).toList();
    }

    setState(() {});
  }

  void add(int index) async {
    List<String> idesString = [];
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (cardId.contains(index)) {
      cardId.remove(index);
    }
    cardId.insert(0, index);
    cardId = cardId.toSet().toList();
    for (int i in cardId) {
      idesString.add(i.toString());
    }
    prefs.setStringList("history", idesString);
    setState(() {});
  }

  void getCard() async {
    List<String> idesString = [];
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    idesString = prefs.getStringList("history") ?? [];
    for (String i in idesString) {
      cardId.add(int.parse(i));
    }
    cardId = cardId.toSet().toList();

    setState(() {});
  }
}



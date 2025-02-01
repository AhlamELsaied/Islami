class PrayTime {
  final String name;
  final String time;
  final String pmAm;

  PrayTime({required this.name, required this.time, required this.pmAm});

  static List<PrayTime> prayers = [
    PrayTime(name: "Fajr", time: "09:12", pmAm: "PM"),
    PrayTime(name: "Dhuhr", time: "01:01", pmAm: "PM"),
    PrayTime(name: "Asr", time: "04:38", pmAm: "PM"),
    PrayTime(name: "Maghrib", time: "07:57", pmAm: "PM"),
    PrayTime(name: "Isha", time: "09:12", pmAm: "PM"),
  ];
}

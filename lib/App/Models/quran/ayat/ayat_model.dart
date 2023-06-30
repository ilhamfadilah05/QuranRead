class AyatModel {
  String? arabic;
  String? ayah;
  String? id;
  String? juz;
  String? latin;
  String? page;
  String? surah;
  String? translate;

  AyatModel({
    this.arabic,
    this.ayah,
    this.id,
    this.juz,
    this.latin,
    this.page,
    this.surah,
    this.translate,
  });

  factory AyatModel.fromJson(Map<String, dynamic> json) {
    return AyatModel(
      arabic: json['arabic'],
      ayah: json['ayah'],
      id: json['id'],
      juz: json['juz'],
      latin: json['latin'],
      page: json['page'],
      surah: json['surah'],
      translate: json['translate'],
    );
  }
}

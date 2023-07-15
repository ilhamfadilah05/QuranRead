class SurahModel {
  String? arabic;
  String? id;
  String? location;
  String? numAyah;
  String? surahName;
  String? translate;
  String? page;

  SurahModel({
    this.arabic,
    this.id,
    this.location,
    this.numAyah,
    this.surahName,
    this.translate,
    this.page,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      arabic: json['arabic'],
      id: json['id'],
      location: json['location'],
      numAyah: json['num_ayah'],
      surahName: json['surah_name'],
      translate: json['translate'],
      page: json['page'],
    );
  }
}

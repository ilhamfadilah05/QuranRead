// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quranread/App/Models/quran/surah/surah_model.dart';
import 'package:quranread/api_url.dart';

Future<List<SurahModel>> fetchSurah() async {
  var request =
      http.Request('GET', Uri.parse(hostApiQuran + '/quran-surah.json'));

  http.StreamedResponse response = await request.send();
  var responseString = await response.stream.bytesToString();
  List dataa = json.decode(responseString);

  var data = dataa.map((e) => SurahModel.fromJson(e)).toList();
  return data;
}

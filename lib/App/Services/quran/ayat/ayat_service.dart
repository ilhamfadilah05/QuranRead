// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quranread/App/Models/quran/ayat/ayat_model.dart';
import 'package:quranread/api_url.dart';

Future<List<AyatModel>> getAyat() async {
  var request =
      http.Request('GET', Uri.parse(hostApiQuran + '/quran-ayah.json'));

  http.StreamedResponse response = await request.send();
  var responseString = await response.stream.bytesToString();
  List dataa = json.decode(responseString);

  var data = dataa.map((e) => AyatModel.fromJson(e)).toList();
  return data;
}

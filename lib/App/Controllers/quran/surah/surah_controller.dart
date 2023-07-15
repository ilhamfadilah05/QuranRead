// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranread/App/Models/quran/surah/surah_model.dart';
import 'package:quranread/App/Services/quran/surah/surah_service.dart';

class SurahController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var title = "Qur'an Read".obs;
  late TabController controller;
  List<SurahModel>? dataSurah;

  final List<Tab> myTabs = <Tab>[
    Tab(
      text: "Surat",
    ),
    Tab(
      text: "Juz",
    )
  ];

  @override
  void onInit() {
    controller = TabController(length: 2, vsync: this);

    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}

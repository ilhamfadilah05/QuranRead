import 'package:flutter/material.dart';
import 'package:quranread/App/Views/home/home_view.dart';
import 'package:quranread/App/Views/quran/ayat/ayat_view.dart';
import 'package:quranread/App/Views/quran/surah/surah_view.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Qur'an Read",
          home: HomeView(),
        );
      },
    );
  }
}

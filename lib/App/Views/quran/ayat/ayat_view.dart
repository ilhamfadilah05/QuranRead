// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps, avoid_print

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:quranread/App/Components/widget.dart';
import 'package:quranread/App/Controllers/quran/ayat/ayat_controller.dart';
import 'package:quranread/App/Services/quran/ayat/ayat_service.dart';

class AyatView extends StatefulWidget {
  const AyatView({super.key});

  @override
  State<AyatView> createState() => _AyatViewState();
}

class _AyatViewState extends State<AyatView> {
  final conn = Get.put(AyatController());
  @override
  void initState() {
    conn.addImageList();
    getAyat().then((value) {
      conn.getDataAyat(value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
              textDefault("Qur'an Read", 18, Colors.black, FontWeight.normal),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      conn.bottomSheetTranslate(context, conn.indexImage.value);
                    },
                    child: Icon(
                      Icons.g_translate,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  conn.listBookmark.contains(conn.indexImage.value)
                      ? InkWell(
                          onTap: () {
                            conn.addListBookmark("-");
                          },
                          child: Icon(
                            Icons.bookmark,
                            size: 30,
                            color: Colors.amber,
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            conn.addListBookmark("+");
                          },
                          child: Icon(
                            Icons.bookmark_outline,
                            size: 30,
                            color: Colors.black,
                          ),
                        )
                ],
              )
            ],
          ),
        ),
        body: PageView.builder(
          reverse: true,
          controller: conn.controller,
          onPageChanged: (value) {
            conn.changeIndexImage(value);
          },
          itemCount: conn.imageList.length,
          itemBuilder: (context, index) {
            var data = conn.imageList[index];
            return Image.network(
              "$data",
            );
          },
        ),
      );
    });
  }
}

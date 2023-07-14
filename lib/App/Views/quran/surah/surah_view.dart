// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranread/App/Components/color.dart';
import 'package:quranread/App/Components/textStyle.dart';
import 'package:quranread/App/Components/widget.dart';
import 'package:quranread/App/Controllers/quran/surah/surah_controller.dart';
import 'package:quranread/App/Models/quran/surah/surah_model.dart';
import 'package:quranread/App/Services/quran/surah/surah_service.dart';
import 'package:quranread/App/Views/quran/ayat/ayat_view.dart';
import 'package:sizer/sizer.dart';

class SurahView extends StatefulWidget {
  const SurahView({super.key});

  @override
  State<SurahView> createState() => _SurahViewState();
}

class _SurahViewState extends State<SurahView> {
  final conn = Get.put(SurahController());

  @override
  void initState() {
    fetchSurah().then((value) {
      setState(() {
        conn.dataSurah = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 15.sp,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  TextDef(
                      message: conn.title.value, size: 14, color: Colors.black)
                ],
              ),
              Icon(
                Icons.history,
                color: Colors.black,
              )
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            children: [
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.sp)),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Expanded(
                        child: TextFormField(
                      style: styleDefault,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Cari Nama Surat"),
                    ))
                  ],
                ),
              ),
              TabBar(
                controller: conn.controller,
                tabs: conn.myTabs,
                labelColor: Colors.black,
                indicatorColor: kBlueDark,
                indicatorWeight: 2,
                labelStyle: styleDefault,
              ),
              Expanded(
                  child: TabBarView(controller: conn.controller, children: [
                conn.dataSurah == null
                    ? Container()
                    : SingleChildScrollView(
                        child: Column(
                          children:
                              List.generate(conn.dataSurah!.length, (index) {
                            var data = conn.dataSurah![index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return AyatView(
                                    page: "${data.page}",
                                    nameSurah: "${data.surahName}",
                                  );
                                }));
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                                width: 8.w,
                                                height: 5.h,
                                                decoration: BoxDecoration(
                                                    color: kBlueDark
                                                        .withOpacity(0.1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Center(
                                                    child: TextDef(
                                                        message: "${data.id}",
                                                        size: 14,
                                                        color: Colors.black
                                                            .withOpacity(
                                                                0.7)))),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextDef(
                                                    message:
                                                        "${data.surahName}",
                                                    size: 14,
                                                    color: Colors.black),
                                                TextDef(
                                                    message:
                                                        "${data.translate} • ${data.numAyah}",
                                                    size: 12,
                                                    color: Colors.grey)
                                              ],
                                            )
                                          ],
                                        ),
                                        TextDef(
                                          message: "${data.arabic}",
                                          size: 16.sp,
                                          textDirection: TextDirection.rtl,
                                          color: Colors.black,
                                          fw: FontWeight.bold,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Divider()
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
              ]))
            ],
          ),
        ),
      );
    });
  }
}

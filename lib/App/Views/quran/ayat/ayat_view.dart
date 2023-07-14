// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps, avoid_print, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranread/App/Components/widget.dart';
import 'package:quranread/App/Controllers/quran/ayat/ayat_controller.dart';
import 'package:quranread/App/Services/quran/ayat/ayat_service.dart';
import 'package:sizer/sizer.dart';

class AyatView extends StatefulWidget {
  AyatView({super.key, this.page, this.nameSurah});
  String? page;
  String? nameSurah;

  @override
  State<AyatView> createState() => _AyatViewState();
}

class _AyatViewState extends State<AyatView> {
  final conn = Get.put(AyatController());
  @override
  void initState() {
    conn.addImageList();
    if (widget.page != null) {
      conn.controller =
          PageController(initialPage: int.parse(widget.page!) - 1);
    }
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
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  // textDefault(
                  //     "Qur'an Read", 14.sp, Colors.black, FontWeight.normal),
                ],
              ),
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
                            size: 30.sp,
                            color: Colors.amber,
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            conn.addListBookmark("+");
                          },
                          child: Icon(
                            Icons.bookmark_outline,
                            size: 30.sp,
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

            // var data;
            // if (widget.page == null) {
            //   data = conn.imageList[index];
            // } else {
            //   data = conn.imageList[index + int.parse(widget.page!) - 1];
            // }
            return CachedNetworkImage(
              imageUrl: "$data",
              errorWidget: (context, url, error) {
                return TextDef(
                    message: "ERROR", size: 14.sp, color: Colors.black);
                // textDefault(
                //     "ERROR", 14.sp, Colors.black, FontWeight.normal);
              },
            );
          },
        ),
      );
    });
  }
}

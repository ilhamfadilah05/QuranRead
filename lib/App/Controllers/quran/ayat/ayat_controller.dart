// ignore_for_file: prefer_adjacent_string_concatenation, unnecessary_string_interpolations, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranread/App/Components/widget.dart';
import 'package:quranread/api_url.dart';

import '../../../Models/quran/ayat/ayat_model.dart';

class AyatController extends GetxController {
  var imageList = [].obs;
  var indexImage = 1.obs;
  PageController controller = PageController();
  List<AyatModel> dataAyat = [];
  var listBookmark = [].obs;

  void addImageList() {
    imageList.value = List.generate(604, (index) {
      String a = "${index + 1}";
      int length = a.length;
      return length == 1
          ? "$imageAyatUrl" + "00$a.png"
          : length == 2
              ? "$imageAyatUrl" + "0$a.png"
              : "$imageAyatUrl" + "$a.png";
    });
  }

  void changeIndexImage(int index) {
    indexImage.value = index + 1;
    int a = indexImage.value;
    print("index ${a}");
  }

  void getDataAyat(List<AyatModel> value) {
    dataAyat = value;
    print(dataAyat);
  }

  void addListBookmark(String type) {
    if (type == "+") {
      listBookmark.add(indexImage.value);
    } else {
      listBookmark.remove(indexImage.value);
    }

    print("BOOKMARK = ${listBookmark.value}");
  }

  bottomSheetTranslate(BuildContext context, int page) {
    var listTerjemahan = dataAyat.where((v) => v.page == "$page").toList();
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textDefault(
                        "Terjemahan", 18, Colors.black, FontWeight.bold),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.close,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(listTerjemahan.length, (index) {
                      var data = listTerjemahan[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textDefault("${data.ayah}.", 14, Colors.black,
                                  FontWeight.bold),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textDefault("${data.translate}", 14,
                                      Colors.black, FontWeight.normal)
                                ],
                              ))
                            ]),
                      );
                    }),
                  )),
                )
              ],
            ),
          );
        });
      },
    );
  }
}

// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:quranread/App/Components/string.dart';
import 'package:quranread/App/Components/widget.dart';
import 'package:sizer/sizer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                      height: 250,
                      child: Image.asset(
                        "$assetImage/bg_home1.jpg",
                        fit: BoxFit.cover,
                      )),
                  Positioned(
                    bottom: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.black)),
                            color: Colors.white.withOpacity(0.2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.timer_outlined,
                                    color: Colors.white,
                                    size: 12.sp,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  TextDef(
                                      message: "Dzuhur",
                                      size: 14.sp,
                                      color: Colors.white),
                                ],
                              ),
                              TextDef(
                                  message: "4 Jam 15 Menit 20 Detik",
                                  size: 8.sp,
                                  color: Colors.white),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

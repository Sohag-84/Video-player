// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'colors.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [];
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/videoinfo.json')
        .then((value) {
      videoInfo = json.decode(value);
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.gradientFirst.withOpacity(0.9),
              AppColor.gradientSecond,
            ],
            begin: FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 180.h,
              margin: EdgeInsets.only(top: 60.h, left: 20.w, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: AppColor.secondPageIconColor,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.info_outline,
                        size: 20,
                        color: AppColor.secondPageIconColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    "Legs Toning",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: AppColor.secondPageTitleColor,
                    ),
                  ),
                  Text(
                    "and Glutes Workout",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: AppColor.secondPageTitleColor,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    children: [
                      Container(
                        width: 90.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          gradient: LinearGradient(
                            colors: [
                              AppColor.secondPageContainerGradient1stColor,
                              AppColor.secondPageContainerGradient2ndColor,
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer,
                              size: 20,
                              color: AppColor.secondPageIconColor,
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              "68 min",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColor.secondPageIconColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Container(
                        width: 220,
                        height: 25.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          gradient: LinearGradient(
                            colors: [
                              AppColor.secondPageContainerGradient1stColor,
                              AppColor.secondPageContainerGradient2ndColor,
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.handyman_outlined,
                              size: 20,
                              color: AppColor.secondPageIconColor,
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              "Resistent band kettebell",
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: AppColor.secondPageIconColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        SizedBox(width: 20.h),
                        Text(
                          "Circuit 1: Legs Tonning",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor.circuitsColor,
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Icon(
                              Icons.loop,
                              size: 30,
                              color: AppColor.loopColor,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              "3 sets",
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: AppColor.setsColor,
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 20.h),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Expanded(
                      child: _listView(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _listView() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 8.h,
      ),
      itemCount: videoInfo.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            debugPrint("=== Video index: $index} ===");
          },
          child: _buildCard(index),
        );
      },
    );
  }

  _buildCard(int index) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        Row(
          children: [
            Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                  image: AssetImage(
                    videoInfo[index]['thumbnail'],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  videoInfo[index]['title'],
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Text(
                    videoInfo[index]['time'],
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Container(
              width: 80.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: Color(0xFFeaeefc),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: Text(
                  "15s rest",
                  style: TextStyle(color: Color(0xff839fed)),
                ),
              ),
            ),
            Row(
              children: [
                for (int i = 0; i < 70; i++)
                  i.isEven
                      ? Container(
                          width: 3.w,
                          height: 1.h,
                          decoration: BoxDecoration(
                            color: Color(0xFF839fed),
                            borderRadius: BorderRadius.circular(
                              2,
                            ),
                          ),
                        )
                      : Container(
                          width: 3.w,
                          height: 1.h,
                          color: Colors.white,
                        ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

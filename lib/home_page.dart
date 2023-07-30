// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];
  _initData() {
    DefaultAssetBundle.of(context).loadString('json/info.json').then((value) {
      info = json.decode(value);
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
      backgroundColor: AppColor.homePageBackground,
      body: Container(
        padding: EdgeInsets.only(top: 60.h, left: 15.w, right: 15.w),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Training",
                  style: TextStyle(
                    fontSize: 25.sp,
                    color: AppColor.homePageTitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_back_ios,
                  size: 18.h,
                  color: AppColor.homePageIcons,
                ),
                SizedBox(width: 10.w),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 18.h,
                  color: AppColor.homePageIcons,
                ),
                SizedBox(width: 15.w),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18.h,
                  color: AppColor.homePageIcons,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Text(
                  "Your program",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColor.homePageTitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColor.homePageDetail,
                  ),
                ),
                SizedBox(width: 5.w),
                Icon(
                  Icons.arrow_forward,
                  size: 18.h,
                  color: AppColor.homePageTitle,
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 180.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.gradientFirst.withOpacity(.8),
                    AppColor.gradientSecond.withOpacity(0.9),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(80.r),
                  bottomLeft: Radius.circular(10.r),
                  bottomRight: Radius.circular(10.r),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(5, 10),
                    blurRadius: 10,
                    color: AppColor.gradientSecond.withOpacity(0.2),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(left: 15.w, top: 18.h, right: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Next workout",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColor.homePageContainerTextSmall,
                      ),
                    ),
                    Text(
                      "Legs Toning",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: AppColor.homePageContainerTextSmall,
                      ),
                    ),
                    Text(
                      "and Glutes Workout",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: AppColor.homePageContainerTextSmall,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 16.h,
                              color: AppColor.homePageContainerTextSmall,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              "60",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColor.homePageContainerTextSmall,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45.r),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.gradientFirst,
                                  blurRadius: 10.r,
                                  offset: Offset(4, 8),
                                ),
                              ]),
                          child: Icon(
                            Icons.play_circle_fill,
                            color: Colors.white,
                            size: 45.h,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 130.h,
              width: MediaQuery.sizeOf(context).width,
              margin: EdgeInsets.only(top: 20.h),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 120.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      image: DecorationImage(
                        image: AssetImage("assets/card.jpg"),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20.r,
                          offset: Offset(5, 8),
                          color: AppColor.gradientSecond.withOpacity(0.3),
                        ),
                        BoxShadow(
                          blurRadius: 10.r,
                          offset: Offset(-1, -15),
                          color: AppColor.gradientSecond.withOpacity(0.3),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    margin: EdgeInsets.only(right: 200.w, bottom: 20.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      image: DecorationImage(
                        image: AssetImage("assets/figure.png"),
                      ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 100.h,
                    margin: EdgeInsets.only(left: 130.w, top: 30.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You are doing great",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor.homePageDetail,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        RichText(
                          text: TextSpan(
                              text: "Keep it up\n",
                              style: TextStyle(
                                color: AppColor.homePageSubtitle,
                                fontSize: 14.sp,
                              ),
                              children: [
                                TextSpan(text: "stick to your plan"),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Area of focus",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.homePageTitle,
                ),
              ),
            ),
            Expanded(
              child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    itemCount: info.length.toDouble() ~/ 2,
                    itemBuilder: (context, index) {
                      int a = 2 * index;
                      int b = 2 * index + 1;
                      return Row(
                        children: [
                          Container(
                            width: (MediaQuery.sizeOf(context).width - 90) / 2,
                            height: 135.h,
                            padding: EdgeInsets.only(bottom: 2.h),
                            margin: EdgeInsets.only(
                                left: 30, bottom: 15.h, top: 15.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.r),
                              image: DecorationImage(
                                image: AssetImage(
                                  info[a]['img'],
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3.r,
                                  offset: Offset(-5, -5),
                                  color:
                                      AppColor.gradientSecond.withOpacity(0.1),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[a]['title'],
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: AppColor.homePageDetail,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 135.h,
                            width: (MediaQuery.sizeOf(context).width - 90) / 2,
                            padding: EdgeInsets.only(bottom: 2.h),
                            margin: EdgeInsets.only(
                                left: 30, bottom: 15.h, top: 15.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.r),
                              image: DecorationImage(
                                image: AssetImage(
                                  info[b]['img'],
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3.r,
                                  offset: Offset(-5, -5),
                                  color:
                                      AppColor.gradientSecond.withOpacity(0.1),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[b]['title'],
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: AppColor.homePageDetail,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.homePageBackground,
      body: Container(
        padding: EdgeInsets.only(top: 60.h, left: 30.w, right: 30.w),
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
          ],
        ),
      ),
    );
  }
}

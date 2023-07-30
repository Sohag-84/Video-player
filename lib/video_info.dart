// ignore_for_file: prefer_const_constructors, unused_field, avoid_single_cascade_in_expression_statements, prefer_is_empty

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'colors.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [];
  bool _playArea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;

  VideoPlayerController? _controller;

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
  void dispose() {
    super.dispose();
    _disposed = true;
    _controller!.pause();
    _controller!.dispose();
    _controller = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _playArea == false
            ? BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.gradientFirst.withOpacity(0.9),
                    AppColor.gradientSecond,
                  ],
                  begin: FractionalOffset(0.0, 0.4),
                  end: Alignment.topRight,
                ),
              )
            : BoxDecoration(color: AppColor.gradientSecond),
        child: Column(
          children: [
            _playArea == false
                ? Container(
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
                                    AppColor
                                        .secondPageContainerGradient1stColor,
                                    AppColor
                                        .secondPageContainerGradient2ndColor,
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
                              width: 210,
                              height: 25.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                gradient: LinearGradient(
                                  colors: [
                                    AppColor
                                        .secondPageContainerGradient1stColor,
                                    AppColor
                                        .secondPageContainerGradient2ndColor,
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
                  )
                : Column(
                    children: [
                      Container(
                        height: 80.h,
                        padding: EdgeInsets.only(
                          top: 30,
                          left: 20.w,
                          right: 20.w,
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: AppColor.secondPageTopIconColor,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: AppColor.secondPageTopIconColor,
                            ),
                          ],
                        ),
                      ),
                      _playView(context),
                      _controlView(context),
                    ],
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

  /// for video controller button
  Widget _controlView(BuildContext context) {
    /// first check controller exits or not
    /// then check controller value
    /// then check controller volume
    /// controller volume exits means video plays loudly
    final noMute = (_controller!.value.volume ?? 0) > 0;

    return Container(
      height: 70.h,
      width: MediaQuery.sizeOf(context).width,
      color: AppColor.gradientSecond,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              if (noMute) {
                _controller!.setVolume(0);
              } else {
                _controller!.setVolume(1);
              }
              setState(() {});
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.0, 0.0),
                      blurRadius: 4.r,
                      color: Color.fromARGB(50, 0, 0, 0),
                    ),
                  ],
                ),
                child: Icon(
                  noMute ? Icons.volume_up : Icons.volume_off,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () async {
              final index = _isPlayingIndex - 1;
              if (index >= 0 && videoInfo.length >= 0) {
                _initializedVideo(index);
              } else {
                Get.snackbar(
                  "Video",
                  "",
                  snackPosition: SnackPosition.BOTTOM,
                  icon: Icon(
                    Icons.face,
                    size: 30,
                    color: Colors.white,
                  ),
                  backgroundColor: AppColor.gradientSecond,
                  colorText: Colors.white,
                  messageText: Text(
                    "No ahead videos in the  playlist",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                );
              }
            },
            icon: Icon(
              Icons.fast_rewind,
              size: 36,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () async {
              if (_isPlaying) {
                setState(() {
                  _isPlaying = false;
                });
                _controller!.pause();
              } else {
                setState(() {
                  _isPlaying = true;
                });
                _controller!.play();
              }
            },
            icon: Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow,
              size: 36,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () async {
              final index = _isPlayingIndex + 1;
              if (index <= videoInfo.length - 1) {
                _initializedVideo(index);
              } else {
                Get.snackbar(
                  "Video",
                  "",
                  snackPosition: SnackPosition.BOTTOM,
                  icon: Icon(
                    Icons.face,
                    size: 30,
                    color: Colors.white,
                  ),
                  backgroundColor: AppColor.gradientSecond,
                  colorText: Colors.white,
                  messageText: Text(
                    "You have finished watching all the videos. Congrats !",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                );
              }
            },
            icon: Icon(
              Icons.fast_forward,
              size: 36,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  /// play video view
  Widget _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(
          child: Text(
            "Loading....",
            style: TextStyle(
              fontSize: 20.sp,
              color: Colors.white60,
            ),
          ),
        ),
      );
    }
  }

  var _onUpdateControllerTime;
  void _onControllerUpdate() async {
    ///if user wants to try to play video frequently
    if (_disposed) {
      return;
    }
    _onUpdateControllerTime = 0;
    final now = DateTime.now().microsecondsSinceEpoch;
    if (_onUpdateControllerTime > now) {
      return;
    }
    _onUpdateControllerTime = now + 500;

    /// -------------condition stop----------------- ///

    final controller = _controller;
    if (controller == null) {
      debugPrint("Controller is null");
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint("Controller can't be initialized");
      return;
    }
    final playing = controller.value.isPlaying;
    _isPlaying = playing;
  }

  /// to play video
  _initializedVideo(int index) {
    final controller = VideoPlayerController.networkUrl(
      Uri.parse(videoInfo[index]['videoUrl']),
    );
    final oldController = _controller;
    _controller = controller;
    if (oldController != null) {
      oldController.removeListener(
        () {
          _onControllerUpdate();
          oldController.pause();
        },
      );
    }
    setState(() {});
    controller
      ..initialize().then((_) {
        ///if old controller exist we dispose it
        ///old controller exist means already video playing
        oldController!.dispose();

        ///to track video index
        _isPlayingIndex = index;

        ///to playing video and update controller value
        controller.addListener(() {
          _onControllerUpdate();
        });
        controller.play();
        setState(() {});
      });
  }

  /// video list
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
            _initializedVideo(index);
            setState(() {
              if (_playArea == false) {
                _playArea = true;
              }
            });
          },
          child: _buildCard(index),
        );
      },
    );
  }

  /// video list style
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

import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool isLoop;
  Video({required this.videoPlayerController, required this.isLoop});
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late ChewieController chewieController;
  @override
  void initState() {
   chewieController =chewieController;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


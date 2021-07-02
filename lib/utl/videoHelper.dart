import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:graduation/utl/natwork.dart';

// ignore: must_be_immutable
class Video extends StatefulWidget {
  final videoUrl;
  Video({this.videoUrl});
   @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late ChewieController _chewieController;
  late VideoPlayerController videoPlayerController;
  @override
  void initState() {
    super.initState();
    //Wrapper on top of videoPlayerController
     _chewieController =ChewieController(
        videoPlayerController:  VideoPlayerController.network(widget.videoUrl),
        aspectRatio: 16/9,
        autoInitialize: true,
        looping: false,
        errorBuilder: (context , errorMessage){
          return Center(
            child: Text(
              errorMessage,
              style: TextStyle(color: Colors.white),
            ),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: _chewieController,
    );
  }
  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
    _chewieController.dispose();
  }
}



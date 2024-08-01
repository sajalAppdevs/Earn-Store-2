// ignore_for_file: deprecated_member_use

import 'package:earn_store/Controllers/Home%20Controllers/all_video_controller.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:earn_store/Views/Pages/Home%20Pages/root_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class GeneralVideoDetails extends StatefulWidget {
  final String videoUrl;
  final String videoID;
  const GeneralVideoDetails({
    super.key,
    required this.videoUrl,
    required this.videoID,
  });
  @override
  State<GeneralVideoDetails> createState() => _GeneralVideoDetailsState();
}

class _GeneralVideoDetailsState extends State<GeneralVideoDetails> {
  late VideoPlayerController _controller;
  IconData iconData = Icons.pause;
  bool isComplete = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      widget.videoUrl,
    );
    _controller.initialize().then((_) {
      setState(() {
        _controller.play();
      });
      _controller.addListener(() {
        if (_controller.value.position == _controller.value.duration) {
          videoFinished();
        }
      });
    });
  }

  void videoFinished() async {
    _controller.dispose();
    setState(() {
      isComplete = true;
    });
    AllVideoController videoController = Get.put(AllVideoController());
    await videoController.addSeenVideo(videoID: widget.videoID);

    setState(() {
      isComplete = false;
    });

    Snackbars.successSnackBar(
      title: "Video Status",
      description: "Point Added Successfully",
    );
    Get.offAll(const RootScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: isComplete
              ? const CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ) // Adj
              : _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : _buildLoadingIndicator(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            setState(
              () {
                if (_controller.value.isPlaying) {
                  iconData = Icons.play_arrow;
                  _controller.pause();
                } else {
                  iconData = Icons.pause;
                  _controller.play();
                }
              },
            );
          },
          child: Icon(
            iconData,
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
      ), // Adjust style as needed
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

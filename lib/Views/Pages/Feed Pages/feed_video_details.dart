// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class FeedVideoDetails extends StatefulWidget {
  final String videoUrl;
  const FeedVideoDetails({
    super.key,
    required this.videoUrl,
  });
  @override
  State<FeedVideoDetails> createState() => _FeedVideoDetailsState();
}

class _FeedVideoDetailsState extends State<FeedVideoDetails> {
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
    Get.back();
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

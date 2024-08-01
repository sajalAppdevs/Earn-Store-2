// ignore_for_file: deprecated_member_use, unnecessary_null_comparison, sort_child_properties_last

import 'package:earn_store/Controllers/Home%20Controllers/all_youtube_video_controller.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:earn_store/Views/Pages/Home%20Pages/root_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoDetails extends StatefulWidget {
  final String videoUrl;
  final String videoID;

  const YoutubeVideoDetails({
    super.key,
    required this.videoUrl,
    required this.videoID,
  });
  @override
  State<YoutubeVideoDetails> createState() => _YoutubeVideoDetailsState();
}

class _YoutubeVideoDetailsState extends State<YoutubeVideoDetails> {
  late String _videoId;
  late YoutubePlayerController _controller;
  IconData iconData = Icons.pause;
  bool isComplete = false;

  @override
  void initState() {
    super.initState();
    _videoId = YoutubePlayer.convertUrlToId(widget.videoUrl)!;
    _controller = YoutubePlayerController(
      initialVideoId: _videoId,
      flags: const YoutubePlayerFlags(
        hideControls: true,
        disableDragSeek: true,
        showLiveFullscreenButton: false,
      ),
    );
  }

  void videoFinished() async {
    _controller.dispose();
    setState(() {
      isComplete = true;
    });
    AllYoutubeVideoController videoController =
        Get.put(AllYoutubeVideoController());
    await videoController.addSeenVideo(
      videoID: widget.videoID,
    );

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
        body: isComplete
            ? _buildLoadingIndicator()
            : Center(
                child: YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    onEnded: (metadata) {
                      videoFinished();
                    },
                  ),
                  builder: (context, player) {
                    return GestureDetector(
                      onTap: () {
                        // if (_controller.value.isPlaying) {
                        //   _controller.pause();
                        // } else {
                        //   _controller.play();
                        // }
                      },
                      child: player,
                    );
                  },
                ),
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

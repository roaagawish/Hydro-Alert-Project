import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class ClimateScreen extends StatefulWidget {
  const ClimateScreen({super.key});

  @override
  State<ClimateScreen> createState() => _ClimateScreenState();
}

class _ClimateScreenState extends State<ClimateScreen> {
  late VideoPlayerController controller;

  @override
  void initState() {
    // TODO: implement initState
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer() {
    controller =
        VideoPlayerController.asset("assets/Videos/lv_0_٢٠٢٣١٠٠٦١٠١٩٠٥.mp4");
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Climate Change"),
      ),
      body: Container(
          child: Column(
              children: [
                AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: VideoPlayer(controller),
                ),

                Container( //duration of video
                  child: Text("Total Duration: " +
                      controller.value.duration.toString()),
                ),

                Container(
                    child: VideoProgressIndicator(
                        controller,
                        allowScrubbing: true,
                        colors: VideoProgressColors(
                          backgroundColor: Colors.blueAccent,
                          playedColor: Colors.blue,
                          bufferedColor: Color(0xFF64B5F6),
                        )
                    )
                ),

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            if (controller.value.isPlaying) {
                              controller.pause();
                            } else {
                              controller.play();
                            }

                            setState(() {

                            });
                          },
                          icon: Icon(
                              controller.value.isPlaying ? Icons.pause : Icons
                                  .play_arrow)
                      ),

                      IconButton(
                          onPressed: () {
                            controller.seekTo(Duration(seconds: 0));

                            setState(() {

                            });
                          },
                          icon: Icon(Icons.stop)
                      )
                    ],
                  ),
                )
              ]
          )
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// // import 'package:flutter_html/flutter_html.dart';
//
// class WaterCycle extends StatefulWidget {
//   const WaterCycle({super.key});
//
//   @override
//   State<WaterCycle> createState() => _WaterCycleState();
// }
// // const htmlData = r"""
// // <p>The water cycle is a continuous process that describes how water moves around the Earth. It's also known as the hydrologic cycle. Water is essential for life, and this cycle helps distribute fresh water to every part of our planet.<br><br>
// // 1. Evaporation: It all starts with the Sun. The Sun's energy heats up water in oceans, rivers, lakes, and even puddles. As the water gets warmer, it turns into water vapor, which is like invisible steam rising into the sky. This process is called evaporation.<br>
// // </p>
// // <p>2. Condensation: As the water vapor rises high into the sky, it cools down. When it cools, it changes back into tiny water droplets. These droplets come together to form clouds. This is called condensation.<br><br>
// //    3. Precipitation: Inside the clouds, the water droplets get bigger and bigger. When they become too heavy, they fall from the sky as rain, snow, sleet, or hail. This is called precipitation.<br> <br>
// // </p>
// // <p>4. Collection: When the precipitation reaches the ground, it collects in various places like rivers, lakes, and underground. Some of it soaks into the soil to replenish groundwater. This collected water is now ready to start the cycle all over again.<br> <br>
// // 5. Runoff: Not all the precipitation soaks into the ground. Some flows over the land's surface, forming streams and rivers. These rivers eventually carry the water back to the oceans. <br>   This is called runoff.<br>
// // <p> 6. Transpiration: It's not just oceans, rivers, and lakes that are part of the water cycle. Plants also play a role. They take in water through their roots and release it into the air through tiny openings in their leaves. This process is called transpiration.<br><br>
// // 7. Sublimation: Sometimes, ice and snow can turn directly into water vapor without melting first. This is called sublimation. It happens in very cold places,  like at the top of high mountains.
// // </p>
// // """;
// class _WaterCycleState extends State<WaterCycle> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar:  AppBar(
//         title:const Text("Water Cycle"),
//        ),
//        //  body: SingleChildScrollView(
//        //    child: Html(data:htmlData),
//        // ),
//
//     );
//   }
// }
// //
 import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class WaterCycle extends StatefulWidget {
  const WaterCycle({super.key});

  @override
  State<WaterCycle> createState() => _WaterCycleState();
}

class _WaterCycleState extends State<WaterCycle> {
  late VideoPlayerController controller;

  @override
  void initState() {
    // TODO: implement initState
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer() {
    controller =
        VideoPlayerController.asset("assets/Videos/lv_0_٢٠٢٣١٠٠٥٢٢٣٦١١.mp4");
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
        title: Text("Water Cycle"),
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


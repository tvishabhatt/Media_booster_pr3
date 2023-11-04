import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pr3_in_adv/Modalclass.dart';


import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'ForProvider.dart';
late VideoPlayerController controller1;
late VideoPlayerController controller2;
late VideoPlayerController controller3;
late VideoPlayerController controller4;
late VideoPlayerController controller5;
List<VideoPlayerController> listofController=[controller1,controller2,controller3,controller4,controller5];


class VideoScreen extends StatefulWidget{
  int Selctedindex=0;
  VideoScreen({required this.Selctedindex});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VideoScreenState(Selctedindex);
  }

}
class VideoScreenState extends State<VideoScreen>
{
  int Selctedindex=0;
  VideoScreenState(this.Selctedindex);
  late TabController tabController;
  CarouselController Controller=CarouselController();

  @override
  void initState() {
    // TODO: implement initState
    controller1=VideoPlayerController.networkUrl(Uri.parse(videos[0].url))..initialize();
    controller2=VideoPlayerController.networkUrl(Uri.parse(videos[1].url))..initialize();
    controller3=VideoPlayerController.networkUrl(Uri.parse(videos[2].url))..initialize();
    controller4=VideoPlayerController.networkUrl(Uri.parse(videos[3].url))..initialize();
    controller5=VideoPlayerController.networkUrl(Uri.parse(videos[4].url))..initialize();

    super.initState();
  }
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Videos"),
      ),
      body:  Consumer(builder: (context, ForProvider, child) {
        final videoProvider = Provider.of<VideoProvuder>(context);
        return CarouselSlider(
          carouselController:Controller,
          items: [
            for (int i = 0; i < videos.length; i++) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    listofController[i].value.isInitialized?
                    Padding(padding: EdgeInsets.all(20),
                      child: AspectRatio(aspectRatio: listofController[i].value.aspectRatio,
                        child: VideoPlayer(listofController[i]),),):
                    Center(child:Image.asset(videos[i].thumbnail,fit: BoxFit.contain,
                    ),),
                    SizedBox(
                      height: 20,
                    ),
                    Text(videos[i].name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      height: 20,
                      child: VideoProgressIndicator(
                        listofController[i],
                        allowScrubbing: true,
                        padding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              listofController[i].seekTo(Duration(seconds: -10));
                            },
                            icon: Icon(
                              Icons.fast_rewind,
                              color: Colors.black,
                              size: 30,
                            )),
                        IconButton(
                            onPressed: () {
                              Controller.previousPage();
                            },
                            icon: Icon(
                              Icons.skip_previous,
                              color: Colors.black,
                              size: 30,
                            )),
                        IconButton(
                          onPressed: () {
                            listofController[i].value.isPlaying?listofController[i].pause():listofController[i].play();

                            videoProvider.changeValue();

                          },
                          icon: Icon(videoProvider.isplaying?Icons.pause:Icons.play_arrow_rounded,
                            size: 30, color: Colors.black,),


                        ),
                        IconButton(
                            onPressed: () {
                              Controller.nextPage();
                            },
                            icon: Icon(
                              Icons.skip_next,
                              color: Colors.black,
                              size: 30,
                            )),
                        IconButton(
                            onPressed: () {
                              listofController[i].seekTo(Duration(seconds: 10));
                            },
                            icon: Icon(
                              Icons.fast_forward,
                              color: Colors.black,
                              size: 30,
                            )),
                      ],
                    ),
                  ],
                ),
              )
            ]
          ],
          options: CarouselOptions(
              height: double.infinity,
              initialPage: Selctedindex,
              enlargeCenterPage: true,
              viewportFraction: 0.98,
              onPageChanged: (index, reason) async {
                index==0?listofController[index=4].pause():listofController[index-1].pause();
                videoProvider.changingindex(index);
                videoProvider.isplaying=false;
                await listofController[index].pause();
              }),
        );
      }),
    );


  }

}
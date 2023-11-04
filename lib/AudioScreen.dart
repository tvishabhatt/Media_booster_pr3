import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:blur/blur.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pr3_in_adv/ForProvider.dart';
import 'package:pr3_in_adv/Screen1.dart';
import 'package:provider/provider.dart';



class AudioScreen extends StatefulWidget{
  int selectedindex;
  AudioScreen({required this.selectedindex});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AudioScreenState(selectedindex);
  }

}
class AudioScreenState extends State<AudioScreen>{
  int selectedindex;
  AudioScreenState(this.selectedindex);
  CarouselController Controller=CarouselController();
  @override
  void initState() {
    initAudio();
    // TODO: implement initState
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:  Consumer(builder: (context, ForProvider, child) {
        final audioProvider = Provider.of<AudioProvider>(context);

        return CarouselSlider(
          carouselController: Controller,
          items: [
            for (int i = 0; i < modalList.length; i++) ...[
              Stack(
                children: [
                  Blur(
                      blur: 10,
                      child: Image(
                        image: NetworkImage(modalList[i].Ima),
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.fitHeight,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(2, 4),
                                  blurRadius: 4),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              modalList[i].Ima,
                              height: 300,
                              width: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          modalList[i].title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          modalList[i].artist, style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        StreamBuilder<Duration>(
                          stream:modalList[audioProvider.i].Controller.currentPosition ,
                          builder: (context, snapshot) {

                            if(snapshot.hasData){
                              Duration duration=snapshot.data!;
                              return ProgressBar(
                                barHeight: 8,
                                baseBarColor: Colors.grey,
                                bufferedBarColor: Colors.grey,
                                progressBarColor: Colors.red,
                                thumbColor: Colors.red,
                                timeLabelTextStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                                progress: modalList[audioProvider.i].Controller.currentPosition.value,
                                total: durationList[audioProvider.i],
                                onSeek: (value) {
                                  modalList[audioProvider.i].Controller.seekBy(value);
                                },
                              );
                            }
                            else{
                              return CircularProgressIndicator(color: Colors.white,);
                            }
                          },),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  modalList[i].Controller.seekBy(Duration(seconds: -10));
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
                                // modalList[i].Controller.play();
                                modalList[i].Controller.isPlaying.value?modalList[i].Controller.pause():modalList[i].Controller.play();
                                audioProvider.changevalue();

                              },
                              icon: Icon(audioProvider.isplaying?Icons.pause:Icons.play_arrow_rounded,
                                // modalList[i].Controller.isPlaying.value?Icons.pause_rounded:Icons.play_arrow_rounded,
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
                                  modalList[i].Controller.seekBy(Duration(seconds: 10));
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
                  ),
                ],
              )
            ]
          ],
          options: CarouselOptions(
              height: double.infinity,
              initialPage: selectedindex,
              enlargeCenterPage: true,
              viewportFraction: 0.98,
              onPageChanged: (index, reason) async {

                index==0?modalList[index=4].Controller.stop():modalList[index-1].Controller.stop();
                audioProvider.ChangIndex(index);
                audioProvider.isplaying=false;
                await modalList[audioProvider.i].Controller.stopped;
              }),
        );
      }),
    );
  }
  Future<void> initAudio() async {
    for(int i=0;i<modalList.length;i++)
    {
      await modalList[i].Controller
          .open(Audio(modalList[i].song), autoStart: false);
      modalList[i].Controller.current.listen((event) {
        if (event != null) {
          Duration duration = event.audio.duration;
          durationList.add(duration);
        }

        setState(() {}); // Trigger a rebuild to update your UI with the loaded audio data
      });
    }
  }

}



import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pr3_in_adv/AudioScreen.dart';
import 'package:pr3_in_adv/Modalclass.dart';
import 'package:pr3_in_adv/VideoScreen.dart';



class Screen1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Screen1State();
  }
}

List<Modal> modalList = [
  Modal(
      Ima:
      "https://pagalnew.com/coverimages/o-bedardeya-tu-jhoothi-main-makkaar-500-500.jpg",
      title: "O Bedardiya",
      artist: "Arijit Shing",
      song: "assets/O Bedardeya Tu Jhoothi Main Makkaar 128 Kbps.mp3",
      Controller: AssetsAudioPlayer()),
  Modal(
      Ima:
      "https://pagalfree.com/images/128Chaleya%20-%20Jawan%20128%20Kbps.jpg",
      title: "Chaleya",
      artist: "Anirudh Ravichander,Arijit Shing,Shilpa Rap",
      song: "assets/Chaleya - Jawan.mp3",
      Controller: AssetsAudioPlayer()),
  Modal(
      Ima:
      "https://pagalnew.com/coverimages/ve-kamleya-rocky-aur-rani-kii-prem-kahaani-500-500.jpg",
      title: "Ve Kamleya",
      artist: "Arijit Singh, Shreya Ghoshal, Shadab Faridi, Altamash Faridi",
      song: "assets/Ve Kamleya Rocky Aur Rani Kii Prem Kahaani 128 Kbps.mp3",
      Controller: AssetsAudioPlayer()),
  Modal(
      Ima:
      "https://pagalfree.com/images/128Heeriye%20(feat.%20Arijit%20Singh)%20-%20Dulquer%20Salmaan%20128%20Kbps.jpg",
      title: "Heeriye",
      artist: "Arijit Singh",
      song: "assets/Heeriye Arijit Singh 128 Kbps.mp3",
      Controller: AssetsAudioPlayer()),
  Modal(
      Ima:
      "https://pagalfree.com/images/128Leke%20Prabhu%20Ka%20Naam%20-%20Tiger%203%20128%20Kbps.jpg",
      title: "Leke Prabhu Ka Naam",
      artist: "Arjit Singh",
      song: "assets/Leke Prabhu Ka Naam Tiger 3 128 Kbps.mp3",
      Controller: AssetsAudioPlayer())
];
List<Duration> durationList = [];



class Screen1State extends State<Screen1> with SingleTickerProviderStateMixin {
  late TabController tabController;





  CarouselController Controller = CarouselController();


  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();

  }


  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          Container(color: Colors.black12,
            child: TabBar(
              controller: tabController,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.white,
              labelStyle: TextStyle(color: Colors.black),
              labelColor: Colors.black,

              unselectedLabelStyle: TextStyle(color: Colors.grey),
              tabs: [
                Tab(text: "Audios",),
                Tab(text: "Videos",),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: TabBarView(controller: tabController, children: [
                ListView.builder(
                  itemCount: modalList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.black,
                      child:   InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AudioScreen(selectedindex: index),));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Image(
                                image: NetworkImage(modalList[index].Ima),
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover),
                            title: Text(
                              modalList[index].title,
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                      ),

                    );
                  },
                ),
                ListView.builder(
                  itemCount: videos.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => VideoScreen(Selctedindex: index),));
                      },
                      child: Padding(padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.asset(videos[index].thumbnail,fit: BoxFit.contain,),
                            ),
                            SizedBox(width: 20,),
                            Text(videos[index].name,style: TextStyle(color: Colors.black,fontSize: 20),),
                          ],
                        ),),
                    );
                  },)
              ]),
            ),
          )
        ],
      ),
    );
  }






}


import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:pr3_in_adv/Screen1.dart';
import 'package:pr3_in_adv/VideoScreen.dart';


class AudioProvider extends ChangeNotifier{
  int i=0;

  bool isplaying=false;
  void ChangIndex(value){
    i=value;
    notifyListeners();
  }

  void changevalue(){
    isplaying=!isplaying;
    notifyListeners();
  }


  Future<void> init()async{
    await modalList[AudioProvider().i].Controller.open(
        Audio(modalList[AudioProvider().i].song,),autoStart: false);
    modalList[AudioProvider().i].Controller.current.listen((event) {
      if(event != null){
        Duration duration=event.audio.duration;
        print(duration);
        durationList.add(duration);
        print(durationList);
      }
    });
    notifyListeners();

  }

}
class VideoProvuder extends ChangeNotifier{
  int i=0;
  int value=0;
  bool isplaying=false;

  void play(){
    listofController[i].play();
    notifyListeners();
  }

  void pause(){
    listofController[i].pause();
    notifyListeners();
  }

  void changeValue(){
    if(isplaying==true){
      isplaying=false;
    }
    else{
      isplaying=true;
    }
    notifyListeners();
  }

  void setindex(int index){
    value=index;
    notifyListeners();
  }

  void changingindex(value){
    i=value;
    notifyListeners();
  }

}
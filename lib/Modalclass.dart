import 'package:assets_audio_player/assets_audio_player.dart';
class Video{
  final String name;
  final String url;
  final String thumbnail;

  Video({required this.name,required  this.url,required this.thumbnail});

}
List<Video> videos=[
  Video(name: "Video  1",
      url:"https://file-examples.com/storage/fe1734aff46541d35a76822/2017/04/file_example_MP4_480_1_5MG.mp4",
      thumbnail: "assets/videoimg1.png"),
  Video(name: "Video 2",
      url:"https://samplelib.com/lib/preview/mp4/sample-10s.mp4",
      thumbnail:"assets/videoimg2.png"),
  Video(name: "Video 3",
    url:"https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
    thumbnail: "assets/videoimg3.png",),
  Video(name: "Video 4",
      url:"https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
      thumbnail: "assets/videoimg4.png"),
  Video(name: "Video 5", url: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
      thumbnail: "assets/videoimg5.png")


];
class Modal {
  String Ima = "";
  String title = "";
  String artist = "";
  String song = "";
  AssetsAudioPlayer Controller = AssetsAudioPlayer();

  Modal(
      {required this.Ima,
        required this.title,
        required this.artist,
        required this.song,
        required this.Controller});
}

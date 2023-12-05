import 'package:flutter/material.dart';
import 'package:pr3_in_adv/Screen1.dart';

class Splace_Screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Splace_ScreenState();
  }

}
class Splace_ScreenState extends State<Splace_Screen> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.repeat(reverse: false);
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Screen1()),
      );
    });
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Stack(
          children: [
            Image(image: AssetImage("assets/musicbg.jpg"),fit: BoxFit.cover,height: double.infinity,width: double.infinity,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: RotationTransition(
                    turns: _animation,
                    alignment: Alignment.center,
                    child: Image(image: AssetImage("assets/cd.png"),height: 200,width: 200,)
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Music...',
                    style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
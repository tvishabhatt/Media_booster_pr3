import 'package:flutter/material.dart';
import 'package:pr3_in_adv/ForProvider.dart';
import 'package:pr3_in_adv/Screen1.dart';
import 'package:pr3_in_adv/Splace_Screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => AudioProvider(),),
        ChangeNotifierProvider(create: (context) => VideoProvuder(),)
      ],child:const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
<<<<<<< HEAD
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Splace_Screen(),
=======
 
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Screen1(),
>>>>>>> origin/master
    );
  }
}

<<<<<<< HEAD

=======
>>>>>>> origin/master

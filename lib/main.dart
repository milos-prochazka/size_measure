import 'package:flutter/material.dart';
import 'package:size_measure/MediaSize.dart';
import 'package:size_measure/SizedContext.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      title: 'Flutter Demo',
      theme: ThemeData
      (
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget
{
  MyHomePage({Key? key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  String? title;

  @override
  Widget build(BuildContext context)
  {

    final measure = MediaSize(context);
    final r = NamedDistance(20, DistanceUnit.MM).toPixels(measure);
    final h = measure.screenHeight;

    return Scaffold
    (
      body: Container
      (
        child: Column
        (
          children:
          [
            CircleAvatar
            (
              backgroundColor: Colors.amberAccent,
              radius: r,
              child: Text("Muj textik"),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import "package:middara_dice/middara_dice.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
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
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              child: const DieFace(
                color: Colors.blue,
                inkColor: Colors.black87,
                number: 10,
                iconTL: DieIcon.burst,
                iconTR: DieIcon.shield,
                iconBL: DieIcon.book,
                iconBR: DieIcon.shield,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              width: 150,
              child: const DieFace(
                iconTL: DieIcon.book,
                iconTR: DieIcon.shield,
                iconBL: DieIcon.book,
                iconBR: DieIcon.shield,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              width: 50,
              child: const DieFace(
                iconTL: DieIcon.skull,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

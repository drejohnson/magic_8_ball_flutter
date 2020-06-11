import 'dart:math';

import 'package:flutter/material.dart';
import 'package:magic_8ball/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic 8 Ball',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2B3990),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF192255),
        title: Text('Ask and I\'ll Tell'),
      ),
      body: Container(
        child: Center(
          child: MagicBall(),
        ),
      ),
    );
  }
}

class MagicBall extends StatefulWidget {
  MagicBall({Key key}) : super(key: key);

  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall>
    with SingleTickerProviderStateMixin {
  int replyNumber = 1;
  double _scale;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void changeReply() {
    setState(() {
      replyNumber = Random().nextInt(6) + 1;
    });
  }

  void _onTapDown(TapDownDetails details) {
    changeReply();
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Container(
      padding: EdgeInsets.all(16.0),
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        child: Transform.scale(
          scale: _scale,
          child: Image.asset('images/ball$replyNumber.png'),
        ),
      ),
    );
  }
}

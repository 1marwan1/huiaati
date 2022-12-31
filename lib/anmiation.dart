import 'dart:math';

import 'package:flutter/material.dart';

class Anmit extends StatefulWidget {
  bool flag = false;
  Anmit({Key? key, this.flag = false}) : super(key: key);

  @override
  _AnmitState createState() => _AnmitState();
}

class _AnmitState extends State<Anmit> with SingleTickerProviderStateMixin {
  AnimationController? _AnimationController;
  Animation<double>? _Animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _AnimationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat();
    _Animation =
        CurvedAnimation(parent: _AnimationController!, curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            widget.flag = !widget.flag;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
      body: ListView(
        children: [
          //=============================================================
          RotationTransition(
            turns: _Animation!,
            child: Container(
              height: 100,
              child: FlutterLogo(
                size: 150.0,
              ),
            ),
          ),
          //=============================================================
          AnimatedContainer(
            duration: Duration(seconds: 2),
            color: widget.flag ? Colors.green : Colors.red,
            width: 100,
            height: 100,
          ),
          //====================================
          Container(
            width: 100,
            height: 150,
            color: Colors.black,
            child: Stack(
              children: [
                AnimatedPositioned(
                  left: widget.flag ? 0 : 300,
                  top: widget.flag ? 0 : 100,
                  child: FlutterLogo(
                    size: 30,
                  ),
                  duration: Duration(seconds: 2),
                )
              ],
            ),
          ),
          //===============================================
          AnimatedPadding(
            padding: EdgeInsets.all(widget.flag ? 0 : 50),
            duration: Duration(seconds: 2),
            child: Container(
              color: Colors.cyan,
              height: 100,
            ),
          ),
          //===============================================
          //=============================================================
          //=============================================================
          Transform.rotate(
            angle: 20 * (pi / 180),
            child: Container(
              child: Text(
                "Transform.rotate",
                textAlign: TextAlign.center,
              ),
              color: Colors.red,
              width: 100,
              height: 50,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          //===========================================
          Transform.scale(
            scale: 2,
            child: Container(
              child: Text(
                "Transform.scale",
                textAlign: TextAlign.center,
              ),
              color: Colors.green,
              width: 40,
              height: 20,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          //===========================================
          Transform.translate(
            offset: Offset(60, 5),
            child: Container(
              child: Text(
                "Transform.translate",
                textAlign: TextAlign.center,
              ),
              color: Colors.blue,
              width: 40,
              height: 20,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          //===========================================
          Transform(
            //transform: Matrix4.skew(1, 0),
            //transform: Matrix4.skewX(1),
            //transform: Matrix4.skewY(1),
            //transform: Matrix4.rotationX(20),
            //transform: Matrix4.rotationY(20),
            transform: Matrix4.rotationZ(50),
            //transform: Matrix4.zero(),
            child: Container(
              child: Text(
                "Matrix4.skew(1, 0)",
                textAlign: TextAlign.center,
              ),
              color: Colors.yellow,
              width: 40,
              height: 120,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            transform: Matrix4.skewX(5),
            width: 40,
            height: 40,
            color: Colors.pink,
          ),
        ],
      ),
    );
  }
}

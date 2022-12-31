import 'package:flutter/material.dart';
import 'package:hotel_data/anmiation.dart';

class slidReghtTween extends PageRouteBuilder {
  final Widget page;

  slidReghtTween(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: Duration(milliseconds: 1000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            var begin = Offset(-1, 0);
            var end = Offset(0, 0);
            var tween = Tween(begin: begin, end: end);
            var offset = animation.drive(tween);
            return SlideTransition(
              position: offset,
              child: child,
            );
          },
        );
}

class slidReghtCurved extends PageRouteBuilder {
  final Widget page;
  final Curve curve;
  slidReghtCurved(this.page, {this.curve = Curves.easeInOutBack})
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: Duration(milliseconds: 2000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            var begin = Offset(-1, 0);
            var end = Offset(0, 0);
            var tween = Tween(begin: begin, end: end);
            var Curved = CurvedAnimation(parent: animation, curve: curve);
            return SlideTransition(
              position: tween.animate(Curved),
              child: child,
            );
          },
        );
}

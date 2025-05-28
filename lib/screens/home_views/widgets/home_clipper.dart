import 'package:flutter/material.dart';

class HomeClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.toString());
    var path = Path();
    path.lineTo(0, size.height * .69);
    var firstStart = Offset(size.width * .03, size.height * .9);
    var firstEnd = Offset(size.width * .17, size.height * .9);
    path.quadraticBezierTo(
      firstStart.dx,
      firstStart.dy,
      firstEnd.dx,
      firstEnd.dy,
    );

    var secondStart = Offset(size.width * .9, size.height * .9);
    var secondEnd = Offset(size.width * .9, size.height * .9);
    path.quadraticBezierTo(
      secondStart.dx,
      secondStart.dy,
      secondEnd.dx,
      secondEnd.dy,
    );

    var thirdStart = Offset(size.width * .97, size.height * .9);
    var thirdEnd = Offset(size.width, size.height * .71);
    path.quadraticBezierTo(
      thirdStart.dx,
      thirdStart.dy,
      thirdEnd.dx,
      thirdEnd.dy,
    );

    var fourStart = Offset(size.width, size.height * .69);
    var fourEnd = Offset(size.width, 0);
    path.quadraticBezierTo(fourStart.dx, fourStart.dy, fourEnd.dx, fourEnd.dy);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

import 'package:flutter/material.dart';

class BackgroundImage extends CustomPainter {
  final BuildContext context;

  BackgroundImage({required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    Path backgroundPath = Path()
      ..lineTo(width, 0)
      ..lineTo(width, height / 3.0)
      ..lineTo(0, height * 2.0 / 3.0)
      ..close();
    canvas.drawPath(backgroundPath, Paint()..color = Colors.black);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SignInSocialLine extends CustomPainter {
  final BuildContext context;

  SignInSocialLine({required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    Path backgroundPath = Path()
      ..lineTo(width, 0)
      ..lineTo(width, 2)
      ..lineTo(0, 2)
      ..close();
    canvas.drawPath(
        backgroundPath,
        Paint()..shader = LinearGradient(
            colors: [
              Colors.black,
              Colors.white
            ]
        ).createShader(Rect.fromLTRB(0, 0, width, 2))
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

void main() {
  runApp( const Isohel() );
}

class Isohel extends StatelessWidget {
  const Isohel({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: IsohelMainScreen()
    );
  }
}


class IsohelMainScreen extends StatelessWidget {
  const IsohelMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShaderBuilder(
        assetKey: 'shaders/background.glsl',
        (context, shader, child) => CustomPaint(
          size: MediaQuery.of(context).size,
          painter: ShaderPainter(
            shader: shader,
          ),
        )
        ),
    );
  }
}

class ShaderPainter extends CustomPainter {
  ShaderPainter({required this.shader});
  ui.FragmentShader shader;

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(0, size.height);

    final paint = Paint()..shader = shader;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
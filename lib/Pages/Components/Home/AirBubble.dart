import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../../../Utility/CustomTheme.dart';

class AirBubble extends StatefulWidget {
  final double maxWidth;
  final double maxHeight;
  final List<Color> gradientColors;
  final Widget child;
  final double radius;

  const AirBubble({
    super.key,
    required this.maxWidth,
    required this.maxHeight,
    required this.child,
    required this.radius,
    required this.gradientColors,
  });

  @override
  State<AirBubble> createState() => _AirBubbleState();
}

class _AirBubbleState extends State<AirBubble> {
  late Matrix4 _transformationMatrix;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _transformationMatrix = _getRandomTranslationMatrix();
    _startMoving();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startMoving() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        _transformationMatrix = _getRandomTranslationMatrix();
      });
    });
  }

  Matrix4 _getRandomTranslationMatrix() {
    final random = Random();
    final translateX = random.nextDouble() * widget.maxWidth;
    final translateY = random.nextDouble() * widget.maxHeight;
    return Matrix4.translationValues(translateX, translateY, 0);
  }

  @override
  Widget build(BuildContext context) {
    CustomThemeData OBJ = CustomThemeData.from(context);
    double bubbleRadius = min(widget.radius + 60, 140);
    return AnimatedContainer(
      duration: const Duration(seconds: 4),
      transform: _transformationMatrix,
      child: ShaderMask(
        shaderCallback: (bounds) =>
            LinearGradient(colors: widget.gradientColors).createShader(bounds),
        child: CircleAvatar(
          radius: OBJ.aspectRatio * bubbleRadius,
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          child: widget.child,
        ),
      ),
    );
  }
}

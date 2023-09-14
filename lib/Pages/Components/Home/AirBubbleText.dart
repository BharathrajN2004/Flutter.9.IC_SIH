import 'package:flutter/material.dart';

class AirBubbleText extends StatelessWidget {
  const AirBubbleText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    );
  }
}

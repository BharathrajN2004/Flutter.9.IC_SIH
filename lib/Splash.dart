import 'package:flutter/material.dart';

import 'Pages/Navigation.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key});
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const Navigation(),
              transitionDuration:
                  const Duration(seconds: 1), // Animation duration
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = 0.0;
                const end = 1.0;
                var tween = Tween(begin: begin, end: end);
                var opacityAnimation = animation.drive(tween);

                return FadeTransition(
                  opacity: opacityAnimation,
                  child: child,
                );
              },
            ));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: child,
            );
          },
          child: const FlutterLogo(size: 200.0),
        ),
      ),
    );
  }
}

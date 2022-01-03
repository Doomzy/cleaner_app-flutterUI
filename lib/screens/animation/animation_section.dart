import 'package:flutter/material.dart';

class MyLoadingAnim extends StatefulWidget {
  @override
  State<MyLoadingAnim> createState() => _MyLoadingAnimState();
}

class _MyLoadingAnimState extends State<MyLoadingAnim>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Image.asset('assets/animation/steps/anim7.png'),
        ),
      ),
    );
  }
}

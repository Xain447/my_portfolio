


import 'package:flutter/material.dart';

class EntranceFader extends StatefulWidget {

  final Widget child;        /// Child to be animated on entrance
  final Duration delay;     /// Delay after which the animation will start
  final Duration duration; /// Duration of entrance animation
  final Offset offset;    /// Starting point from which the widget will fade to its default position

  const EntranceFader({Key? key, required this.child, this.delay = const Duration(milliseconds: 0),
    this.duration = const Duration(milliseconds: 400), this.offset = const Offset(0.0, 32.0) }) : super(key: key);

  @override
  EntranceFaderState createState() {
    return EntranceFaderState();
  }
}

class EntranceFaderState extends State<EntranceFader> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation? _dxAnimation;
  Animation? _dyAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _dxAnimation = Tween(begin: widget.offset.dx, end: 0.0).animate(_controller!);
    _dyAnimation = Tween(begin: widget.offset.dy, end: 0.0).animate(_controller!);

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller!.forward();
      }
    });

  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, child) => Opacity(
        opacity: _controller!.value,
        child: Transform.translate(
          offset: Offset(_dxAnimation!.value, _dyAnimation!.value),
          child: widget.child,
        ),
      ),
    );
  }
}

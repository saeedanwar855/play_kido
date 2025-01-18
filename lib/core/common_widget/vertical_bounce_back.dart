import 'package:flutter/material.dart';

class VerticalBounceWidget extends StatefulWidget {
  const VerticalBounceWidget({
    required this.child,
    super.key,
    this.duration = const Duration(milliseconds: 1500),
    this.bounceHeight = 20.0,
  });

  final Widget child;
  final Duration duration;
  final double bounceHeight;

  @override
  State<VerticalBounceWidget> createState() => _VerticalBounceWidgetState();
}

class _VerticalBounceWidgetState extends State<VerticalBounceWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0,
      end: widget.bounceHeight,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -_animation.value),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

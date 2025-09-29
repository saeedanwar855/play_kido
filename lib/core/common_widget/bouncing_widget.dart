import 'package:flutter/material.dart';

class BouncingWidget extends StatefulWidget {
  const BouncingWidget({
    required this.child,
    super.key,
    this.duration = const Duration(milliseconds: 1000),
    this.bounceScale = 0.05,
  });

  final Widget child;
  final Duration duration;
  final double bounceScale;

  @override
  State<BouncingWidget> createState() => _BouncingWidgetState();
}

class _BouncingWidgetState extends State<BouncingWidget> with SingleTickerProviderStateMixin {
  late AnimationController _bounceController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _bounceController = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = CurvedAnimation(
      parent: _bounceController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _bounceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: 1 + (_scaleAnimation.value * widget.bounceScale),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WalkingDogAnimation extends StatefulWidget {
  const WalkingDogAnimation({
    super.key,
    this.width = 200,
    this.height = 200,
    this.duration = const Duration(seconds: 3),
  });

  final double width;
  final double height;
  final Duration duration;

  @override
  State<WalkingDogAnimation> createState() => _WalkingDogAnimationState();
}

class _WalkingDogAnimationState extends State<WalkingDogAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _positionAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..forward();

    // Fade animation
    _fadeAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 1),
      ),
    );

    // Repeat the animation
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // _controller.reset();
        _controller.forward();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Initialize position animation here where MediaQuery is available
    _positionAnimation = Tween<double>(
      begin: -widget.width,
      end: MediaQuery.of(context).size.width,
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
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_positionAnimation.value, 0),
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: SizedBox(
              width: widget.width,
              height: widget.height,
              child: LottieBuilder.asset(
                'assets/lottie/dog_gif.json',
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }
}

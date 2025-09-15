import 'package:flutter/material.dart';
import 'dart:math' as math;

class TracingStarWidget extends StatefulWidget {
  final Offset position;
  final bool isActive;
  final double size;

  const TracingStarWidget({
    super.key,
    required this.position,
    this.isActive = false,
    this.size = 30.0,
  });

  @override
  State<TracingStarWidget> createState() => _TracingStarWidgetState();
}

class _TracingStarWidgetState extends State<TracingStarWidget>
    with TickerProviderStateMixin {
  late AnimationController _glowController;
  late AnimationController _rotateController;
  late AnimationController _pulseController;

  late Animation<double> _glowAnimation;
  late Animation<double> _rotateAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _glowController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _rotateController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat();

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _glowController,
      curve: Curves.easeInOut,
    ));

    _rotateAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * math.pi,
    ).animate(CurvedAnimation(
      parent: _rotateController,
      curve: Curves.linear,
    ));

    _pulseAnimation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _glowController.dispose();
    _rotateController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.position.dx - widget.size / 2,
      top: widget.position.dy - widget.size / 2,
      child: AnimatedBuilder(
        animation: Listenable.merge([
          _glowAnimation,
          _rotateAnimation,
          _pulseAnimation,
        ]),
        builder: (context, child) {
          return Transform.scale(
            scale: widget.isActive ? _pulseAnimation.value : 1.0,
            child: Transform.rotate(
              angle: widget.isActive ? _rotateAnimation.value : 0.0,
              child: Container(
                width: widget.size,
                height: widget.size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFFD700).withValues(
                        alpha: widget.isActive ? _glowAnimation.value : 0.3,
                      ),
                      blurRadius: widget.isActive ? 20 : 10,
                      spreadRadius: widget.isActive ? 5 : 2,
                    ),
                    BoxShadow(
                      color: const Color(0xFFFF6B6B).withValues(
                        alpha: widget.isActive ? _glowAnimation.value * 0.5 : 0.1,
                      ),
                      blurRadius: widget.isActive ? 15 : 8,
                      spreadRadius: widget.isActive ? 3 : 1,
                    ),
                  ],
                ),
                child: CustomPaint(
                  painter: StarPainter(
                    isActive: widget.isActive,
                    glowIntensity: _glowAnimation.value,
                  ),
                  size: Size(widget.size, widget.size),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class StarPainter extends CustomPainter {
  final bool isActive;
  final double glowIntensity;

  StarPainter({
    required this.isActive,
    required this.glowIntensity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Draw outer glow
    if (isActive) {
      final glowPaint = Paint()
        ..color = const Color(0xFFFFD700).withValues(alpha: glowIntensity * 0.3)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(center, radius * 1.5, glowPaint);
    }

    // Draw star background
    final backgroundPaint = Paint()
      ..color = const Color(0xFFFFD700)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius * 0.9, backgroundPaint);

    // Draw star shape
    final starPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    _drawStar(canvas, center, radius * 0.7, starPaint);

    // Draw inner highlight
    final highlightPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.8)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius * 0.3, highlightPaint);
  }

  void _drawStar(Canvas canvas, Offset center, double radius, Paint paint) {
    final path = Path();
    const numPoints = 5;
    const angleStep = 2 * math.pi / numPoints;

    for (int i = 0; i < numPoints; i++) {
      final angle = i * angleStep - math.pi / 2;
      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);
      
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

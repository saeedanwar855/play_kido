import 'package:flutter/material.dart';
import 'dart:math' as math;

class SparkleEffectWidget extends StatefulWidget {
  final bool isActive;
  final Duration duration;

  const SparkleEffectWidget({
    super.key,
    this.isActive = false,
    this.duration = const Duration(milliseconds: 2000),
  });

  @override
  State<SparkleEffectWidget> createState() => _SparkleEffectWidgetState();
}

class _SparkleEffectWidgetState extends State<SparkleEffectWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  List<Sparkle> _sparkles = [];

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
  }

  void _initializeAnimation() {
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _animation.addListener(() {
      setState(() {
        _updateSparkles();
      });
    });
  }

  void _updateSparkles() {
    if (widget.isActive && _sparkles.length < 20) {
      _sparkles.add(Sparkle.random());
    }

    _sparkles.removeWhere((sparkle) {
      sparkle.update();
      return sparkle.life <= 0;
    });
  }

  @override
  void didUpdateWidget(SparkleEffectWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive && !oldWidget.isActive) {
      _controller.forward();
      _sparkles.clear();
    } else if (!widget.isActive && oldWidget.isActive) {
      _controller.reset();
      _sparkles.clear();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isActive || _sparkles.isEmpty) {
      return const SizedBox.shrink();
    }

    return CustomPaint(
      painter: SparklePainter(_sparkles),
      size: Size.infinite,
    );
  }
}

class Sparkle {
  Offset position;
  double size;
  double life;
  double maxLife;
  Color color;
  double rotation;

  Sparkle({
    required this.position,
    required this.size,
    required this.maxLife,
    required this.color,
    required this.rotation,
  }) : life = maxLife;

  factory Sparkle.random() {
    final random = math.Random();
    return Sparkle(
      position: Offset(
        random.nextDouble() * 200,
        random.nextDouble() * 200,
      ),
      size: random.nextDouble() * 8 + 4,
      maxLife: random.nextDouble() * 1000 + 500,
      color: [
        const Color(0xFFFFD700),
        const Color(0xFFFF6B6B),
        const Color(0xFF4CAF50),
        const Color(0xFF2196F3),
        const Color(0xFFFF9800),
      ][random.nextInt(5)],
      rotation: random.nextDouble() * 2 * math.pi,
    );
  }

  void update() {
    life -= 16; // Assuming 60fps
    position = Offset(
      position.dx + math.sin(life * 0.01) * 2,
      position.dy - 1,
    );
    rotation += 0.1;
  }
}

class SparklePainter extends CustomPainter {
  final List<Sparkle> sparkles;

  SparklePainter(this.sparkles);

  @override
  void paint(Canvas canvas, Size size) {
    for (final sparkle in sparkles) {
      final alpha = (sparkle.life / sparkle.maxLife).clamp(0.0, 1.0);
      final paint = Paint()
        ..color = sparkle.color.withValues(alpha: alpha)
        ..style = PaintingStyle.fill;

      canvas.save();
      canvas.translate(sparkle.position.dx, sparkle.position.dy);
      canvas.rotate(sparkle.rotation);

      // Draw sparkle shape
      final path = Path();
      path.moveTo(0, -sparkle.size);
      path.lineTo(sparkle.size * 0.3, -sparkle.size * 0.3);
      path.lineTo(sparkle.size, 0);
      path.lineTo(sparkle.size * 0.3, sparkle.size * 0.3);
      path.lineTo(0, sparkle.size);
      path.lineTo(-sparkle.size * 0.3, sparkle.size * 0.3);
      path.lineTo(-sparkle.size, 0);
      path.lineTo(-sparkle.size * 0.3, -sparkle.size * 0.3);
      path.close();

      canvas.drawPath(path, paint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

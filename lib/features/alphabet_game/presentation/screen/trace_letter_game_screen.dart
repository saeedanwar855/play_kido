import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'package:play_kido/core/size_config/size_config.dart';
import 'package:play_kido/core/theme/app_colors.dart';

class TraceLetterGameScreen extends StatefulWidget {
  final String letter;
  final String word;
  final String animalIcon;

  const TraceLetterGameScreen({
    super.key,
    required this.letter,
    required this.word,
    required this.animalIcon,
  });

  @override
  State<TraceLetterGameScreen> createState() => _TraceLetterGameScreenState();
}

class _TraceLetterGameScreenState extends State<TraceLetterGameScreen>
    with TickerProviderStateMixin {
  late AnimationController _starController;
  late AnimationController _sparkleController;
  late AnimationController _heartController;
  
  late Animation<double> _starAnimation;
  late Animation<double> _sparkleAnimation;
  late Animation<double> _heartAnimation;

  List<Offset> _tracedPoints = [];
  bool _isTracing = false;
  bool _showSuccess = false;
  int _stars = 12;
  int _lives = 3;
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _starController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();

    _sparkleController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();

    _heartController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _starAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _starController,
      curve: Curves.easeInOut,
    ));

    _sparkleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _sparkleController,
      curve: Curves.easeInOut,
    ));

    _heartAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _heartController,
      curve: Curves.elasticOut,
    ));
  }

  @override
  void dispose() {
    _starController.dispose();
    _sparkleController.dispose();
    _heartController.dispose();
    super.dispose();
  }

  void _onPanStart(DragStartDetails details) {
    setState(() {
      _isTracing = true;
      _tracedPoints.clear();
      _showSuccess = false;
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (_isTracing) {
      setState(() {
        _tracedPoints.add(details.localPosition);
        _progress = (_tracedPoints.length / 100).clamp(0.0, 1.0);
      });
    }
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() {
      _isTracing = false;
      if (_progress > 0.8) {
        _showSuccess = true;
        _stars += 5;
        _sparkleController.forward();
      } else {
        _lives--;
        _heartController.forward();
      }
    });
  }

  void _checkTrace() {
    if (_progress > 0.8) {
      setState(() {
        _showSuccess = true;
        _stars += 10;
      });
      _sparkleController.forward();
    } else {
      setState(() {
        _lives--;
      });
      _heartController.forward();
    }
  }

  void _repeatTrace() {
    setState(() {
      _tracedPoints.clear();
      _progress = 0.0;
      _showSuccess = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Expanded(
              child: _buildGameArea(),
            ),
            _buildBottomBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.getWidth(5),
        vertical: SizeConfig.getHeight(2),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildBackButton(),
          _buildStarsCounter(),
          _buildLivesCounter(),
        ],
      ),
    );
  }

  Widget _buildBackButton() {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: SizeConfig.getWidth(12),
        height: SizeConfig.getWidth(12),
        decoration: BoxDecoration(
          color: AppColors.candyPink,
          borderRadius: BorderRadius.circular(SizeConfig.getWidth(6)),
          boxShadow: [
            BoxShadow(
              color: AppColors.candyPink.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  Widget _buildStarsCounter() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.getWidth(4),
        vertical: SizeConfig.getHeight(1),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFFD700),
        borderRadius: BorderRadius.circular(SizeConfig.getWidth(6)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFD700).withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: _starAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: 1.0 + (_starAnimation.value * 0.2),
                child: const Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 20,
                ),
              );
            },
          ),
          SizedBox(width: SizeConfig.getWidth(2)),
          Text(
            '$_stars',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'ComicSans',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLivesCounter() {
    return Row(
      children: List.generate(3, (index) {
        final isActive = index < _lives;
        return AnimatedBuilder(
          animation: _heartAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: isActive ? _heartAnimation.value : 1.0,
              child: Container(
                margin: EdgeInsets.only(left: SizeConfig.getWidth(1)),
                child: Icon(
                  Icons.favorite,
                  color: isActive ? Colors.red : Colors.grey.shade300,
                  size: 24,
                ),
              ),
            );
          },
        );
      }),
    );
  }

  Widget _buildGameArea() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(5)),
      child: Column(
        children: [
          SizedBox(height: SizeConfig.getHeight(3)),
          _buildLetterArea(),
          SizedBox(height: SizeConfig.getHeight(2)),
          _buildWordSection(),
          SizedBox(height: SizeConfig.getHeight(2)),
          if (_showSuccess) _buildSuccessMessage(),
        ],
      ),
    );
  }

  Widget _buildLetterArea() {
    return Container(
      width: SizeConfig.getWidth(90),
      height: SizeConfig.getHeight(50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.getWidth(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(SizeConfig.getWidth(8)),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFE8F5E8),
                Color(0xFFF0F8F0),
              ],
            ),
          ),
          child: Stack(
            children: [
              _buildLetterOutline(),
              _buildTracingArea(),
              if (_isTracing) _buildTracingStar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLetterOutline() {
    return Center(
      child: Container(
        width: SizeConfig.getWidth(60),
        height: SizeConfig.getHeight(40),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF4A90E2),
            width: 8,
          ),
          borderRadius: BorderRadius.circular(SizeConfig.getWidth(4)),
        ),
        child: Center(
          child: Text(
            widget.letter,
            style: TextStyle(
              fontSize: SizeConfig.getWidth(25),
              fontWeight: FontWeight.bold,
              color: const Color(0xFF4A90E2),
              fontFamily: 'ComicSans',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTracingArea() {
    return GestureDetector(
      onPanStart: _onPanStart,
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: CustomPaint(
        painter: TracingPainter(_tracedPoints),
        size: Size(SizeConfig.getWidth(90), SizeConfig.getHeight(50)),
      ),
    );
  }

  Widget _buildTracingStar() {
    if (_tracedPoints.isEmpty) return const SizedBox.shrink();
    
    final lastPoint = _tracedPoints.last;
    return Positioned(
      left: lastPoint.dx - SizeConfig.getWidth(3),
      top: lastPoint.dy - SizeConfig.getWidth(3),
      child: AnimatedBuilder(
        animation: _starAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: 1.0 + (_starAnimation.value * 0.3),
            child: Container(
              width: SizeConfig.getWidth(6),
              height: SizeConfig.getWidth(6),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD700),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFFD700).withValues(alpha: 0.8),
                    blurRadius: 15,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: const Icon(
                Icons.star,
                color: Colors.white,
                size: 20,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildWordSection() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.getWidth(8),
        vertical: SizeConfig.getHeight(2),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(SizeConfig.getWidth(6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.word,
            style: TextStyle(
              fontSize: SizeConfig.getWidth(6),
              fontWeight: FontWeight.bold,
              color: const Color(0xFF4A90E2),
              fontFamily: 'ComicSans',
            ),
          ),
          SizedBox(width: SizeConfig.getWidth(3)),
          Container(
            width: SizeConfig.getWidth(8),
            height: SizeConfig.getWidth(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeConfig.getWidth(4)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(SizeConfig.getWidth(4)),
              child: Image.asset(
                widget.animalIcon,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessMessage() {
    return AnimatedBuilder(
      animation: _sparkleAnimation,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.getWidth(6),
            vertical: SizeConfig.getHeight(1.5),
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF4CAF50),
            borderRadius: BorderRadius.circular(SizeConfig.getWidth(6)),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF4CAF50).withValues(alpha: 0.3),
                blurRadius: 15,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Great Job!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.getWidth(4.5),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ComicSans',
                ),
              ),
              SizedBox(width: SizeConfig.getWidth(2)),
              Transform.rotate(
                angle: _sparkleAnimation.value * 2 * math.pi,
                child: const Icon(
                  Icons.auto_awesome,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.getWidth(8),
        vertical: SizeConfig.getHeight(3),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildCheckButton(),
          ),
          SizedBox(width: SizeConfig.getWidth(4)),
          Expanded(
            child: _buildRepeatButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckButton() {
    return GestureDetector(
      onTap: _checkTrace,
      child: Container(
        height: SizeConfig.getHeight(8),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF4CAF50), Color(0xFF45A049)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(SizeConfig.getWidth(8)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF4CAF50).withValues(alpha: 0.3),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            'Check',
            style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.getWidth(4.5),
              fontWeight: FontWeight.bold,
              fontFamily: 'ComicSans',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRepeatButton() {
    return GestureDetector(
      onTap: _repeatTrace,
      child: Container(
        height: SizeConfig.getHeight(8),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(SizeConfig.getWidth(8)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF2196F3).withValues(alpha: 0.3),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.refresh,
                color: Colors.white,
                size: 20,
              ),
              SizedBox(width: SizeConfig.getWidth(2)),
              Text(
                'Repeat',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.getWidth(4.5),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ComicSans',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TracingPainter extends CustomPainter {
  final List<Offset> points;

  TracingPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length < 2) return;

    final paint = Paint()
      ..color = const Color(0xFFFF6B6B)
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

import 'package:flutter/material.dart';
import 'package:play_kido/core/common_widget/common_pressable_scale.dart';

class OptionWidget extends StatefulWidget {
  const OptionWidget({
    required this.options,
    required this.index,
    required this.ontap,
    super.key,
  });

  final List<String> options;
  final int index;
  final VoidCallback ontap;

  @override
  State<OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PressableScale(
      onTap: widget.ontap,
      child: Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: widget.index.isEven ? const Color(0xfff1f1f1) : const Color(0xFFEF3349),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: widget.index.isEven ? const Color(0xfff1f1f1) : const Color(0xFFD92036),
              offset: const Offset(0, 2),
              spreadRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: Text(
            widget.options[widget.index],
            style: TextStyle(
              color: widget.index.isEven ? const Color(0xFFEF3349) : Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'ComicSans',
            ),
          ),
        ),
      ),
    );
  }
}

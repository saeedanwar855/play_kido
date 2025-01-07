import 'package:flutter/material.dart';

class NumberCard extends StatefulWidget {
  const NumberCard({super.key});

  @override
  State<NumberCard> createState() => _NumberCardState();
}

class _NumberCardState extends State<NumberCard> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Alphabits'),
      ],
    );
  }
}

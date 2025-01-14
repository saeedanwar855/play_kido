import 'package:flutter/material.dart';

class HomeShapeScreen extends StatefulWidget {
  const HomeShapeScreen({super.key});

  @override
  State<HomeShapeScreen> createState() => _HomeShapeScreenState();
}

class _HomeShapeScreenState extends State<HomeShapeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Shapes',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'ComicSans',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:play_kido/core/size_config/size_config.dart';

class AlphabitsScreen extends StatefulWidget {
  const AlphabitsScreen({super.key});

  @override
  State<AlphabitsScreen> createState() => _AlphabitsScreenState();
}

class _AlphabitsScreenState extends State<AlphabitsScreen> {
  List<String> letters = [
    'assets/letters/a.png',
    'assets/letters/b.png',
    'assets/letters/c.png',
    'assets/letters/d.png',
    'assets/letters/e.png',
    'assets/letters/f.png',
    'assets/letters/g.png',
    'assets/letters/h.png',
    'assets/letters/i.png',
    'assets/letters/j.png',
    'assets/letters/k.png',
    'assets/letters/l.png',
    'assets/letters/m.png',
    'assets/letters/n.png',
    'assets/letters/o.png',
    'assets/letters/p.png',
    'assets/letters/q.png',
    'assets/letters/r.png',
    'assets/letters/s.png',
    'assets/letters/t.png',
    'assets/letters/u.png',
    'assets/letters/v.png',
    'assets/letters/w.png',
    'assets/letters/x.png',
    'assets/letters/y.png',
    'assets/letters/z.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      'assets/icon/back_icon.png',
                      height: 80,
                    ),
                  ),
                  const Text(
                    'Alphabits',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/letters/a.png',
                      width: 250,
                    ),
                    Container(
                      height: SizeConfig.getHeight(30),
                      width: SizeConfig.getWidth(30),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 6,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.network(
                        'https://img.freepik.com/premium-photo/3d-character-design-model-cherry-shape-style-naive_921860-171711.jpg?w=1380',
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      'Apple',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

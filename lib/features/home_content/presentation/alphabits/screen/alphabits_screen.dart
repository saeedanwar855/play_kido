import 'package:flutter/material.dart';

class AlphabitsScreen extends StatefulWidget {
  const AlphabitsScreen({super.key});

  @override
  State<AlphabitsScreen> createState() => _AlphabitsScreenState();
}

class _AlphabitsScreenState extends State<AlphabitsScreen> {
  List<String> letters = [
    'assets/letters/a.jpg',
    'assets/letters/b.jpg',
    'assets/letters/c.jpg',
    'assets/letters/d.jpg',
    'assets/letters/e.jpg',
    'assets/letters/f.jpg',
    'assets/letters/g.jpg',
    'assets/letters/h.jpg',
    'assets/letters/i.jpg',
    'assets/letters/j.jpg',
    'assets/letters/k.jpg',
    'assets/letters/l.jpg',
    'assets/letters/m.jpg',
    'assets/letters/n.jpg',
    'assets/letters/o.jpg',
    'assets/letters/p.jpg',
    'assets/letters/q.jpg',
    'assets/letters/r.jpg',
    'assets/letters/s.jpg',
    'assets/letters/t.jpg',
    'assets/letters/u.jpg',
    'assets/letters/v.jpg',
    'assets/letters/w.jpg',
    'assets/letters/x.jpg',
    'assets/letters/y.jpg',
    'assets/letters/z.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: letters.length,
                itemBuilder: (context, index) {
                  return Image.asset(letters[index]);
                },
              ),
            ),
            // Image.asset('assets/letters/a.jpg'),
          ],
        ),
      ),
    );
  }
}

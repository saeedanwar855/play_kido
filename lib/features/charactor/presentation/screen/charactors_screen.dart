import 'package:flutter/material.dart';

class CharactorsScreen extends StatefulWidget {
  const CharactorsScreen({super.key});

  @override
  State<CharactorsScreen> createState() => _CharactorsScreenState();
}

class _CharactorsScreenState extends State<CharactorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/icon/back_icon.png'),
                const Text('Charactorsb here us rge '),
                Image.asset('assets/icon/forward_icon.png'),
              ],
            ),
            const Text('Choose Charactor fro the bellow '),
            const SizedBox(height: 20),
            SingleChildScrollView(
              child: Row(
                children: List.generate(10, (index) => const CharactorCard()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CharactorCard extends StatelessWidget {
  const CharactorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width / 4,
      height: MediaQuery.sizeOf(context).width / 4,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        // border: Border.all(width: 2, color: Colors.amber),
        color: Color(0xfff1f8fb),
      ),
    );
  }
}

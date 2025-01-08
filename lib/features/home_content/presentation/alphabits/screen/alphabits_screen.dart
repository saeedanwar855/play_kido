// import 'package:flutter/material.dart';
// import 'package:play_kido/core/size_config/size_config.dart';

// class AlphabitsScreen extends StatefulWidget {
//   const AlphabitsScreen({super.key});

//   @override
//   State<AlphabitsScreen> createState() => _AlphabitsScreenState();
// }

// class _AlphabitsScreenState extends State<AlphabitsScreen> {
// List<String> letters = [
//   'assets/animated_alphabits/a.gif',
//   'assets/animated_alphabits/b.gif',
//   'assets/animated_alphabits/c.gif',
//   'assets/animated_alphabits/d.gif',
//   'assets/animated_alphabits/e.gif',
//   'assets/animated_alphabits/f.gif',
//   'assets/animated_alphabits/g.gif',
//   'assets/animated_alphabits/h.gif',
//   'assets/animated_alphabits/i.gif',
//   'assets/animated_alphabits/j.gif',
//   'assets/animated_alphabits/k.gif',
//   'assets/animated_alphabits/l.gif',
//   'assets/animated_alphabits/m.gif',
//   'assets/animated_alphabits/n.gif',
//   'assets/animated_alphabits/o.gif',
//   'assets/animated_alphabits/p.gif',
//   'assets/animated_alphabits/q.gif',
//   'assets/animated_alphabits/r.gif',
//   'assets/animated_alphabits/s.gif',
//   'assets/animated_alphabits/t.gif',
//   'assets/animated_alphabits/u.gif',
//   'assets/animated_alphabits/v.gif',
//   'assets/animated_alphabits/w.gif',
//   'assets/animated_alphabits/x.gif',
//   'assets/animated_alphabits/y.gif',
//   'assets/animated_alphabits/z.gif',
// ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Image.asset(
//                       'assets/icon/back_icon.png',
//                       height: 80,
//                     ),
//                   ),
//                   const Text(
//                     'Alphabits',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.deepPurple,
//                     ),
//                   ),
//                   const SizedBox(),
//                 ],
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Image.asset(
//                       'assets/letters/a.png',
//                       width: 250,
//                     ),
//                     Container(
//                       height: SizeConfig.getHeight(30),
//                       width: SizeConfig.getWidth(30),
//                       margin: const EdgeInsets.symmetric(horizontal: 5),
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.deepPurple,
//                           width: 6,
//                         ),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Image.network(
//                         'https://img.freepik.com/premium-photo/3d-character-design-model-cherry-shape-style-naive_921860-171711.jpg?w=1380',
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Row(
//                   children: [
//                     Text(
//                       'Apple',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.deepPurple,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:play_kido/core/size_config/size_config.dart';

class AlphabitsScreen extends StatefulWidget {
  const AlphabitsScreen({super.key});

  @override
  State<AlphabitsScreen> createState() => _AlphabitsScreenState();
}

class _AlphabitsScreenState extends State<AlphabitsScreen> {
  List<Map<String, String>> alphabets = [
    {
      'letter': 'A',
      'word': 'Apple',
      'image': 'assets/images/apple.png',
      'gif': 'assets/animated_alphabits/a.gif',
    },
    // Add more letters with their corresponding words and images
  ];
  List<String> letters = [
    'assets/animated_alphabits/a.gif',
    'assets/animated_alphabits/b.gif',
    'assets/animated_alphabits/c.gif',
    'assets/animated_alphabits/d.gif',
    'assets/animated_alphabits/e.gif',
    'assets/animated_alphabits/f.gif',
    'assets/animated_alphabits/g.gif',
    'assets/animated_alphabits/h.gif',
    'assets/animated_alphabits/i.gif',
    'assets/animated_alphabits/j.gif',
    'assets/animated_alphabits/k.gif',
    'assets/animated_alphabits/l.gif',
    'assets/animated_alphabits/m.gif',
    'assets/animated_alphabits/n.gif',
    'assets/animated_alphabits/o.gif',
    'assets/animated_alphabits/p.gif',
    'assets/animated_alphabits/q.gif',
    'assets/animated_alphabits/r.gif',
    'assets/animated_alphabits/s.gif',
    'assets/animated_alphabits/t.gif',
    'assets/animated_alphabits/u.gif',
    'assets/animated_alphabits/v.gif',
    'assets/animated_alphabits/w.gif',
    'assets/animated_alphabits/x.gif',
    'assets/animated_alphabits/y.gif',
    'assets/animated_alphabits/z.gif',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
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
                    'Alphabets',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(width: 80),
                ],
              ),
            ),

            // Grid of Letters
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: letters.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => setState(() => currentIndex = index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      letters[index],
                      errorBuilder: (context, error, stackTrace) {
                        return const Text('Error loading image');
                      },
                    ),
                  ),
                ),
              ),
            ),

            // Interactive Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: GestureDetector(
                onTap: () {
                  // Add your game logic here
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.deepPurple, Colors.purple],
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Start Learning',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

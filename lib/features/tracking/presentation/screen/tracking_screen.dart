// import 'package:flutter/material.dart';
// import 'package:play_kido/features/home_content/presentation/alphabits/widgets/header_widget.dart';

// class TrackingScreen extends StatelessWidget {
//   const TrackingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               fit: BoxFit.fill,
//               image: AssetImage(
//                 'assets/icon/tracking_bg.jpg',
//               ),
//             ),
//           ),
//           child: Column(
//             children: [
//               KidsAppHeader(
//                 title: ' Tracking',
//                 onBackPress: () => Navigator.pop(context),
//               ),
//               const SizedBox(height: 30),
//               const Text(
//                 'Kids Activity Status',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                   fontFamily: 'ComicSans',
//                 ),
//               ),

//               const SizedBox(height: 10),

//               Column(
//                 children: [
//                   const Text(
//                     'Weekly overview',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                       fontFamily: 'ComicSans',
//                     ),
//                   ),
//                   const Text(
//                     'April 10 - April 17',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey,
//                       fontFamily: 'ComicSans',
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     height: 150,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: _buildWeeklyBars(),
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 30),

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Progress visibility',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                       fontFamily: 'ComicSans',
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: const Text(
//                       'View more',
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontFamily: 'ComicSans',
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 10),

//               // Progress Bars
//               _buildProgressBar(
//                 context,
//                 'Alphabets',
//                 0.28,
//                 Colors.blue.shade200,
//                 'assets/icon/abc_icon.png',
//                 'assets/character/captain_majid.png',
//               ),
//               const SizedBox(height: 10),
//               _buildProgressBar(
//                 context,
//                 'Numbers',
//                 0.42,
//                 const Color(0xFFD2B48C),
//                 'assets/icon/kite_icon.png',
//                 'assets/character/chota_bheem.png',
//               ),
//               const SizedBox(height: 10),
//               _buildProgressBar(
//                 context,
//                 'Maths',
//                 0.89,
//                 Colors.lightGreen.shade200,
//                 'assets/icon/count_icon.png',
//                 'assets/character/oggy.png',
//               ),
//               const SizedBox(height: 10),
//               _buildProgressBar(
//                 context,
//                 'Shapes',
//                 0.19,
//                 Colors.purple.shade200,
//                 'assets/icon/shapes_icon.png',
//                 'assets/character/singham.png',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   List<Widget> _buildWeeklyBars() {
//     final days = ['sun', 'mon', 'tue', 'wed', 'thus', 'fri', 'sat'];
//     final heights = [0.3, 0.5, 0.4, 0.4, 0.8, 0.6, 0.3];
//     final emojis = ['😊', '😄', '😃', '😊', '🤪', '😁', '🙂'];

//     return List.generate(
//       7,
//       (index) => Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Stack(
//             alignment: Alignment.bottomCenter,
//             children: [
//               Container(
//                 width: 20,
//                 height: 80,
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade200,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               Container(
//                 width: 20,
//                 height: 80 * heights[index],
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFFF9046),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 5),
//           Text(days[index]),
//           Text(
//             emojis[index],
//             style: const TextStyle(
//               fontSize: 25,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildProgressBar(
//     BuildContext context,
//     String title,
//     double progress,
//     Color color,
//     String leftIcon,
//     String rightIcon,
//   ) {
//     return Container(
//       height: 80,
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(40),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 80,
//             padding: const EdgeInsets.all(20),
//             height: MediaQuery.sizeOf(context).height,
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(40),
//                 bottomLeft: Radius.circular(40),
//               ),
//               color: Colors.black26,
//             ),
//             child: Image.asset(
//               leftIcon,
//             ),
//           ),
//           const SizedBox(width: 15),
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     fontFamily: 'ComicSans',
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 Stack(
//                   children: [
//                     Container(
//                       height: 10,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                     ),
//                     Container(
//                       height: 10,
//                       width: MediaQuery.of(context).size.width * progress * 0.5,
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFFF9046),
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Text(
//             '${(progress * 100).toInt()}%',
//             style: const TextStyle(
//               fontFamily: 'ComicSans',
//             ),
//           ),
//           const SizedBox(width: 10),
//           Image.asset(rightIcon, height: 40),
//           const SizedBox(width: 15),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/widgets/header_widget.dart';
import 'package:lottie/lottie.dart'; // Add this package for animations

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFFFE0E0), Color(0xFFFFF8E0)],
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              KidsAppHeader(
                title: ' Learning Journey ',
                onBackPress: () => Navigator.pop(context),
              ),
              const SizedBox(height: 20),
              _buildStreakCard(),
              const SizedBox(height: 20),
              _buildWeeklyOverview(),
              const SizedBox(height: 20),
              _buildProgressSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStreakCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStreakItem('7', 'Day Streak 🔥'),
          _buildStreakItem('248', 'Stars Earned ⭐'),
          _buildStreakItem('4', 'Badges 🎖️'),
        ],
      ),
    );
  }

  Widget _buildStreakItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'ComicSans',
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            fontFamily: 'ComicSans',
          ),
        ),
      ],
    );
  }

  Widget _buildWeeklyOverview() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Weekly Progress',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'ComicSans',
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 180,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: _buildWeeklyBars(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar(
    String title,
    double progress,
    Color color,
    String leftIcon,
    String rightIcon,
  ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(leftIcon, height: 40),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ComicSans',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Stack(
                      children: [
                        Container(
                          height: 12,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          height: 12,
                          width: MediaQuery.of(context).size.width * progress * 0.5,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF9046),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${(progress * 100).toInt()}%',
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ComicSans',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Learning Progress',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'ComicSans',
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'View Details →',
                style: TextStyle(
                  color: Color(0xFFFF9046),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ComicSans',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildProgressBar(
          'Alphabets',
          0.28,
          Colors.blue.shade200,
          'assets/icon/abc_icon.png',
          'assets/character/captain_majid.png',
        ),
        _buildProgressBar(
          'Numbers',
          0.42,
          const Color(0xFFD2B48C),
          'assets/icon/kite_icon.png',
          'assets/character/chota_bheem.png',
        ),
        _buildProgressBar(
          'Maths',
          0.89,
          Colors.lightGreen.shade200,
          'assets/icon/count_icon.png',
          'assets/character/oggy.png',
        ),
        _buildProgressBar(
          'Shapes',
          0.19,
          Colors.purple.shade200,
          'assets/icon/shapes_icon.png',
          'assets/character/singham.png',
        ),
      ],
    );
  }

  List<Widget> _buildWeeklyBars() {
    // Your existing _buildWeeklyBars implementation
    // Add animation to the bars using AnimatedContainer
    final days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    final heights = [0.3, 0.5, 0.4, 0.4, 0.8, 0.6, 0.3];
    final emojis = ['😊', '😄', '😃', '😊', '🤪', '😁', '🙂'];

    return List.generate(
      7,
      (index) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 500 + (index * 100)),
            height: 100 * heights[index],
            width: 24,
            decoration: BoxDecoration(
              color: const Color(0xFFFF9046),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFF9046).withOpacity(0.3),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            days[index],
            style: const TextStyle(
              fontFamily: 'ComicSans',
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            emojis[index],
            style: const TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}

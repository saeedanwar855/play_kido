import 'package:flutter/material.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Image.asset(
                  'assets/icon/back_icon.png',
                  height: 30,
                ),
              ),

              const SizedBox(height: 20),

              // Title
              const Text(
                'Tracking',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // Kids Activity Status
              const Text(
                'Kids Activity Status',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 20),

              // Weekly Overview Section
              Column(
                children: [
                  const Text(
                    'Weekly overview',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    'April 10 - April 17',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Weekly Chart
                  SizedBox(
                    height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: _buildWeeklyBars(),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Progress Visibility Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Progress visibility',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View more',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Progress Bars
              _buildProgressBar(
                context,
                'Alphabets',
                0.28,
                Colors.blue.shade200,
                'assets/icon/abc_icon.png',
                'assets/character/captain_majid.png',
              ),
              const SizedBox(height: 10),
              _buildProgressBar(
                context,
                'Numbers',
                0.42,
                const Color(0xFFD2B48C),
                'assets/icon/kite_icon.png',
                'assets/character/chota_bheem.png',
              ),
              const SizedBox(height: 10),
              _buildProgressBar(
                context,
                'Maths',
                0.89,
                Colors.lightGreen.shade200,
                'assets/icon/count_icon.png',
                'assets/character/oggy.png',
              ),
              const SizedBox(height: 10),
              _buildProgressBar(
                context,
                'Shapes',
                0.19,
                Colors.purple.shade200,
                'assets/icon/shapes_icon.png',
                'assets/character/singham.png',
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildWeeklyBars() {
    final days = ['sun', 'mon', 'tue', 'wed', 'thus', 'fri', 'sat'];
    final heights = [0.3, 0.5, 0.4, 0.4, 0.8, 0.6, 0.3];
    final emojis = ['😊', '😄', '😃', '😊', '🤪', '😁', '🙂'];

    return List.generate(
      7,
      (index) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 20,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                width: 20,
                height: 80 * heights[index],
                decoration: BoxDecoration(
                  color: const Color(0xFFFF9046),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(days[index]),
          Text(
            emojis[index],
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar(
    BuildContext context,
    String title,
    double progress,
    Color color,
    String leftIcon,
    String rightIcon,
  ) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            padding: const EdgeInsets.all(20),
            height: MediaQuery.sizeOf(context).height,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                bottomLeft: Radius.circular(40),
              ),
              color: Colors.black26,
            ),
            child: Image.asset(
              leftIcon,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                Stack(
                  children: [
                    Container(
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Container(
                      height: 10,
                      width: MediaQuery.of(context).size.width * progress * 0.5,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF9046),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text('${(progress * 100).toInt()}%'),
          const SizedBox(width: 10),
          Image.asset(rightIcon, height: 40),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}

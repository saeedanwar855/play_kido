import 'package:flutter/material.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  final List<ScoreData> scores = [
    ScoreData(1, 'Merlin', 990),
    ScoreData(2, 'Reshmi', 912),
    ScoreData(3, 'Cemy', 850),
    ScoreData(4, 'Jacklin', 801),
    ScoreData(5, 'Sam Androns', 800),
    ScoreData(6, 'Rahul', 777),
    ScoreData(2, 'Reshmi', 912),
    ScoreData(3, 'Cemy', 850),
    ScoreData(4, 'Jacklin', 801),
    ScoreData(5, 'Sam Androns', 800),
    ScoreData(6, 'Rahul', 777),
    ScoreData(2, 'Reshmi', 912),
    ScoreData(3, 'Cemy', 850),
    ScoreData(4, 'Jacklin', 801),
    ScoreData(5, 'Sam Androns', 800),
    ScoreData(6, 'Rahul', 777),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Image.asset(
                      'assets/icon/back_icon.png',
                      height: 60,
                    ),
                  ),
                  const Text(
                    'Score Board',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(width: 24), // For symmetry
                ],
              ),
            ),
            const SizedBox(height: 20),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  'assets/icon/base.png',
                  height: 216,
                  width: MediaQuery.sizeOf(context).width,
                ),
                const Positioned(
                  bottom: 0,
                  left: 65,
                  right: 0,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'cemy',
                            style: TextStyle(
                              color: Color(0xff894d14),
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '850',
                            style: TextStyle(
                              color: Color(0xff894d14),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  left: 0,
                  right: 0,
                  bottom: 50,
                  child: Column(
                    children: [
                      Text(
                        'cemy',
                        style: TextStyle(
                          color: Color(0xff894d14),
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '850',
                        style: TextStyle(
                          color: Color(0xff894d14),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  left: 0,
                  right: 70,
                  bottom: -6,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Text(
                            'cemy',
                            style: TextStyle(
                              color: Color(0xff894d14),
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '850',
                            style: TextStyle(
                              color: Color(0xff894d14),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  bottom: 60,
                  left: 50,
                  child: ScoreProfile(),
                ),
                const Positioned(
                  bottom: 110,
                  left: 200,
                  // right: 0,
                  child: ScoreProfile(),
                ),
                const Positioned(
                  bottom: 50,
                  right: 60,
                  child: ScoreProfile(),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Color(0xFFFFB974),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Rank',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Points',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: scores.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFF5EC),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              scores[index].rank.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              scores[index].name,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              scores[index].points.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScoreData {
  ScoreData(this.rank, this.name, this.points);
  final int rank;
  final String name;
  final int points;
}

class ScoreProfile extends StatelessWidget {
  const ScoreProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 80,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xffffd5b3),
              width: 4,
            ),
            image: const DecorationImage(
              image: NetworkImage(
                'https://thumbs.dreamstime.com/b/beautiful-toddler-boy-profile-109342.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: -20,
          right: 0,
          left: 5,
          child: Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icon/star.png'),
                colorFilter: ColorFilter.mode(Color(0xff894d14), BlendMode.srcIn),
              ),
            ),
            child: const Text(
              '1',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
        Positioned(
          top: -45,
          right: 0,
          left: 0,
          child: Image.asset(
            'assets/icon/crown.png',
            height: 70,
            width: 70,
          ),
        ),
      ],
    );
  }
}

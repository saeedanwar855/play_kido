import 'package:flutter/material.dart';
import 'package:play_kido/core/size_config/size_config.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/widgets/header_widget.dart';

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
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/icon/score_bg.jpg',
              ),
            ),
          ),
          child: Column(
            children: [
              KidsAppHeader(
                title: ' Score Board',
                onBackPress: () => Navigator.pop(context),
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.getHeight(21),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/icon/base.png',
                        ),
                      ),
                    ),

                    // child: Image.asset(
                    //   'assets/icon/base.png',
                    //   height: SizeConfig.getHeight(21),
                    //   width: MediaQuery.sizeOf(context).width,
                    // ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 65,
                    right: 0,
                    child: Row(
                      children: [
                        nameScoreWidgets(),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 40,
                    child: nameScoreWidgets(),
                  ),
                  Positioned(
                    left: 0,
                    right: 70,
                    bottom: -6,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        nameScoreWidgets(),
                      ],
                    ),
                  ),
                  const Positioned(
                    bottom: 45,
                    left: 50,
                    child: ScoreProfile(),
                  ),
                  const Positioned(
                    bottom: 80,
                    left: 200,
                    // right: 0,
                    child: ScoreProfile(),
                  ),
                  const Positioned(
                    bottom: 35,
                    right: 60,
                    child: ScoreProfile(),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFB974),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Rank',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'ComicSans',
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
                          fontFamily: 'ComicSans',
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
                          fontFamily: 'ComicSans',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
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
                                  fontFamily: 'ComicSans',
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
                                  fontFamily: 'ComicSans',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                scores[index].points.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'ComicSans',
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
      ),
    );
  }

  Column nameScoreWidgets() {
    return const Column(
      children: [
        Text(
          'cemy',
          style: TextStyle(
            color: Color(0xff894d14),
            fontWeight: FontWeight.w600,
            fontSize: 18,
            fontFamily: 'ComicSans',
          ),
        ),
        Text(
          '850',
          style: TextStyle(
            color: Color(0xff894d14),
            fontFamily: 'ComicSans',
            fontSize: 16,
          ),
        ),
      ],
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
          width: SizeConfig.getWidth(16),
          height: SizeConfig.getHeight(16),
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
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
          bottom: -20,
          right: 0,
          left: 5,
          child: Container(
            width: SizeConfig.getWidth(10),
            height: SizeConfig.getHeight(10),
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
                fontFamily: 'ComicSans',
                fontSize: 15,
              ),
            ),
          ),
        ),
        Positioned(
          top: -30,
          right: 0,
          left: 0,
          child: Image.asset(
            'assets/icon/crown.png',
            height: SizeConfig.getWidth(20),
          ),
        ),
      ],
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:play_kido/core/size_config/size_config.dart';
// import 'package:play_kido/features/home_content/presentation/alphabits/widgets/header_widget.dart';
// import 'package:lottie/lottie.dart';

// class ScoreScreen extends StatefulWidget {
//   const ScoreScreen({super.key});

//   @override
//   State<ScoreScreen> createState() => _ScoreScreenState();
// }

// class _ScoreScreenState extends State<ScoreScreen> with TickerProviderStateMixin {
//   late TabController _tabController;
//   late AnimationController _confettiController;

//   final List<ScoreData> scores = [
//     ScoreData(1, 'Merlin', 990, true, ['🏆', '⭐'], 2),
//     ScoreData(2, 'Reshmi', 912, false, ['⭐'], -1),
//     ScoreData(3, 'Cemy', 850, true, ['🎯'], 1),
//     ScoreData(4, 'Jacklin', 801, false, ['🎮'], 0),
//     ScoreData(5, 'Sam Androns', 800, true, ['🎨'], -2),
//     ScoreData(6, 'Rahul', 777, false, ['📚'], 1),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//     _confettiController = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );
//     _confettiController.repeat();
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     _confettiController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Colors.orange.shade100,
//                 Colors.white,
//               ],
//             ),
//           ),
//           child: Column(
//             children: [
//               KidsAppHeader(
//                 title: '🏆 Score Board 🌟',
//                 onBackPress: () => Navigator.pop(context),
//               ),
//               _buildTabBar(),
//               _buildPodium(),
//               _buildLeaderboardHeader(),
//               Expanded(
//                 child: _buildLeaderboardList(),
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: showChallengeDialog,
//         backgroundColor: Colors.orange,
//         child: const Icon(Icons.emoji_events, color: Colors.white),
//       ),
//     );
//   }

//   Widget _buildTabBar() {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(25),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: TabBar(
//         controller: _tabController,
//         indicator: BoxDecoration(
//           borderRadius: BorderRadius.circular(25),
//           color: Colors.orange,
//         ),
//         labelColor: Colors.white,
//         unselectedLabelColor: Colors.orange,
//         tabs: const [
//           Tab(text: 'Daily'),
//           Tab(text: 'Weekly'),
//           Tab(text: 'Monthly'),
//         ],
//       ),
//     );
//   }

//   Widget _buildPodium() {
//     return Stack(
//       children: [
//         Positioned(
//           top: 0,
//           left: 0,
//           right: 0,
//           child: Image.asset(
//             'assets/icon/base.png',
//             // controller: _confettiController,
//             height: 200,
//           ),
//         ),
//         Container(
//           height: SizeConfig.getHeight(30),
//           margin: const EdgeInsets.symmetric(horizontal: 16),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               _buildPodiumItem(scores[1], 2, Colors.grey.shade300, 0.8),
//               _buildPodiumItem(scores[0], 1, Colors.orange.shade300, 1),
//               _buildPodiumItem(scores[2], 3, Colors.brown.shade200, 0.7),
//             ],
//           ),
//         ),
//         // if (_confettiController.isAnimating)
//       ],
//     );
//   }

//   Widget _buildPodiumItem(ScoreData score, int position, Color color, double height) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         _buildProfileWithCrown(score, position),
//         const SizedBox(height: 8),
//         AnimatedContainer(
//           duration: const Duration(milliseconds: 500),
//           width: 80,
//           height: 100 * height,
//           decoration: BoxDecoration(
//             color: color,
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
//             boxShadow: [
//               BoxShadow(
//                 color: color.withOpacity(0.5),
//                 blurRadius: 8,
//                 offset: const Offset(0, -2),
//               ),
//             ],
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 '#$position',
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               Text(
//                 '${score.points}',
//                 style: const TextStyle(
//                   fontSize: 16,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildLeaderboardHeader() {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.orange.shade300,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: const Row(
//         children: [
//           Expanded(child: Text('Rank', style: TextStyle(fontWeight: FontWeight.bold))),
//           Expanded(flex: 2, child: Text('Player', style: TextStyle(fontWeight: FontWeight.bold))),
//           Expanded(child: Text('Points', style: TextStyle(fontWeight: FontWeight.bold))),
//         ],
//       ),
//     );
//   }

//   Widget _buildLeaderboardList() {
//     return ListView.builder(
//       itemCount: scores.length,
//       itemBuilder: (context, index) {
//         final score = scores[index];
//         return _buildLeaderboardItem(score, index);
//       },
//     );
//   }

//   Widget _buildProfileWithCrown(ScoreData score, int position) {
//     return Stack(
//       clipBehavior: Clip.none,
//       children: [
//         // Profile Circle
//         Container(
//           width: SizeConfig.getWidth(16),
//           height: SizeConfig.getWidth(16),
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             border: Border.all(
//               color: position == 1
//                   ? Colors.orange.shade300
//                   : position == 2
//                       ? Colors.grey.shade300
//                       : Colors.brown.shade200,
//               width: 4,
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 blurRadius: 8,
//                 offset: const Offset(0, 2),
//               ),
//             ],
//             image: DecorationImage(
//               image: NetworkImage(
//                 score.imageUrl ??
//                     'https://thumbs.dreamstime.com/b/beautiful-toddler-boy-profile-109342.jpg',
//               ),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),

//         // Crown for top position
//         if (position == 1)
//           Positioned(
//             top: -SizeConfig.getHeight(8),
//             left: -SizeConfig.getWidth(2),
//             right: -SizeConfig.getWidth(2),
//             child: TweenAnimationBuilder(
//               tween: Tween<double>(begin: 0, end: 1),
//               duration: const Duration(milliseconds: 500),
//               builder: (context, double value, child) {
//                 return Transform.translate(
//                   offset: Offset(0, -2 * value),
//                   child: Transform.scale(
//                     scale: value,
//                     child: Image.asset(
//                       'assets/icon/crown.png',
//                       height: SizeConfig.getHeight(12),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),

//         // Star with position number
//         Positioned(
//           bottom: -SizeConfig.getHeight(5),
//           right: -SizeConfig.getWidth(2),
//           child: Container(
//             width: SizeConfig.getWidth(8),
//             height: SizeConfig.getWidth(8),
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: position == 1
//                   ? Colors.orange.shade300
//                   : position == 2
//                       ? Colors.grey.shade300
//                       : Colors.brown.shade200,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.1),
//                   blurRadius: 4,
//                   offset: const Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: Center(
//               child: Text(
//                 '$position',
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 14,
//                 ),
//               ),
//             ),
//           ),
//         ),

//         // Online status indicator
//         if (score.isOnline)
//           Positioned(
//             bottom: 0,
//             right: 0,
//             child: Container(
//               width: SizeConfig.getWidth(4),
//               height: SizeConfig.getWidth(4),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.green,
//                 border: Border.all(
//                   color: Colors.white,
//                   width: 2,
//                 ),
//               ),
//             ),
//           ),
//       ],
//     );
//   }

//   Widget _buildLeaderboardItem(ScoreData score, int index) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Row(
//               children: [
//                 Text('${score.rank}'),
//                 if (score.rankChange != 0)
//                   Icon(
//                     score.rankChange > 0 ? Icons.arrow_upward : Icons.arrow_downward,
//                     color: score.rankChange > 0 ? Colors.green : Colors.red,
//                     size: 16,
//                   ),
//               ],
//             ),
//           ),
//           Expanded(
//             flex: 2,
//             child: Row(
//               children: [
//                 CircleAvatar(
//                   radius: 15,
//                   backgroundImage: NetworkImage(score.imageUrl ?? 'default_image_url'),
//                 ),
//                 const SizedBox(width: 8),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(score.name),
//                     Row(children: score.badges.map(Text.new).toList()),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Text(
//               '${score.points}',
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void showChallengeDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Challenge Friends'),
//         content: const Text('Send a challenge to climb the leaderboard!'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               // Implement challenge logic
//               Navigator.pop(context);
//             },
//             child: const Text('Send Challenge'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ScoreData {
//   ScoreData(
//     this.rank,
//     this.name,
//     this.points,
//     this.isOnline,
//     this.badges,
//     this.rankChange, {
//     this.imageUrl,
//   });
//   final int rank;
//   final String name;
//   final int points;
//   final bool isOnline;
//   final List<String> badges;
//   final int rankChange;
//   final String? imageUrl;
// }

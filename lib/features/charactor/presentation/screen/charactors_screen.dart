import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_kido/core/common_widget/vertical_bounce_back.dart';
import 'package:play_kido/core/size_config/size_config.dart';
import 'package:play_kido/features/charactor/data/model/charactor_model.dart';
import 'package:play_kido/features/charactor/presentation/state_management/character_cubit.dart';
import 'package:play_kido/features/charactor/presentation/state_management/character_state.dart';
import 'package:play_kido/features/charactor/presentation/widget/charactor_card.dart';

// class CharactersScreen extends StatefulWidget {
//   const CharactersScreen({super.key});
//   @override
//   State<CharactersScreen> createState() => _CharactersScreenState();
// }
// class _CharactersScreenState extends State<CharactersScreen> {
//   late PageController _pageController;
//   int currentIndex = 0;
//   bool isLeftPressed = false;
//   bool isRightPressed = false;
//   // Mock data for player stats
//   final int playerStars = 12;
//   final int playerCandies = 150;
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: currentIndex);
//   }
//   Future<void> changeCharacter({required bool next}) async {
//     if (context.read<CharacterCubit>().state is CharacterLoaded) {
//       final characters = (context.read<CharacterCubit>().state as CharacterLoaded).characters;
//       if (next && currentIndex < characters.length - 1) {
//         setState(() {
//           isRightPressed = true;
//           currentIndex++;
//         });
//         await _pageController.animateToPage(
//           currentIndex,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeInOut,
//         );
//         Future.delayed(const Duration(milliseconds: 100), () {
//           setState(() {
//             isRightPressed = false;
//           });
//         });
//       } else if (!next && currentIndex > 0) {
//         setState(() {
//           isLeftPressed = true;
//           currentIndex--;
//         });
//         await _pageController.animateToPage(
//           currentIndex,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeInOut,
//         );
//         Future.delayed(const Duration(milliseconds: 100), () {
//           setState(() {
//             isLeftPressed = false;
//           });
//         });
//       }
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: BlocBuilder<CharacterCubit, CharacterState>(
//           builder: (context, state) {
//             if (state is CharacterLoaded) {
//               return Container(
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: AssetImage('assets/icon/7.jpg'),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     // Player Stats Bar
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           _buildStatsContainer('assets/icon/star.png', playerStars),
//                           _buildStatsContainer('assets/icon/candy.png', playerCandies),
//                         ],
//                       ),
//                     ),
//                     // Character Showcase
//                     Expanded(
//                       flex: 2,
//                       child: _buildCharacterShowcase(state.characters),
//                     ),
//                     // Character Grid
//                     Expanded(
//                       flex: 2,
//                       child: _buildCharacterGrid(state.characters),
//                     ),
//                   ],
//                 ),
//               );
//             }
//             return const Center(child: CircularProgressIndicator());
//           },
//         ),
//       ),
//     );
//   }
//   Widget _buildStatsContainer(String assetPath, int value) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       decoration: BoxDecoration(
//         color: Colors.black.withOpacity(0.5),
//         borderRadius: BorderRadius.circular(25),
//       ),
//       child: Row(
//         children: [
//           Image.asset(
//             assetPath,
//             height: 30,
//           ),
//           const SizedBox(width: 5),
//           Text(
//             '$value',
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               fontFamily: 'ComicSans',
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   Widget _buildCharacterShowcase(List<CharacterModel> characters) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Container(
//           margin: const EdgeInsets.symmetric(vertical: 20),
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.3),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: PageView.builder(
//             controller: _pageController,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: characters.length,
//             onPageChanged: (index) => setState(() => currentIndex = index),
//             itemBuilder: (context, index) {
//               final character = characters[index];
//               return _buildCharacterCard(character);
//             },
//           ),
//         ),
//       ],
//     );
//   }
//   Widget _buildCharacterCard(CharacterModel character) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Stack(
//           alignment: Alignment.topRight,
//           children: [
//             VerticalBounceWidget(
//               child: Image.asset(
//                 character.imagePath,
//                 height: SizeConfig.getHeight(25),
//               ),
//             ),
//             if (!character.isUnlocked) _buildUnlockWidget(character.price.toInt()),
//           ],
//         ),
//         const SizedBox(height: 10),
//         Container(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 20,
//             vertical: 10,
//           ),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 character.name,
//                 style: const TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                   fontFamily: 'ComicSans',
//                 ),
//               ),
//               Text(
//                 character.description,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   color: Colors.black,
//                   fontFamily: 'ComicSans',
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//   Widget _buildUnlockWidget(int price) {
//     return Container(
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Colors.orange,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Image.asset(
//             'assets/icon/candy.png',
//             height: 20,
//           ),
//           const SizedBox(width: 5),
//           Text(
//             '$price',
//             style: const TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   Widget _buildCharacterGrid(List<CharacterModel> characters) {
//     return Container(
//       margin: const EdgeInsets.all(10),
//       padding: const EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.9),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         children: [
//           const Text(
//             'Choose Your Learning Buddy!',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.deepPurple,
//               fontFamily: 'ComicSans',
//             ),
//           ),
//           Expanded(
//             child: GridView.builder(
//               padding: const EdgeInsets.all(10),
//               itemCount: characters.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 16,
//               ),
//               itemBuilder: (context, index) {
//                 final character = characters[index];
//                 return CharacterCard(
//                   index: index,
//                   character: character,
//                   onTap: () {
//                     if (character.isUnlocked) {
//                       context.read<CharacterCubit>().selectCharacter(character);
//                     } else {
//                       _showUnlockDialog(context, character);
//                     }
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   void _showUnlockDialog(BuildContext context, CharacterModel character) {
//     showDialog<AlertDialog>(
//       context: context,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         backgroundColor: Colors.white.withOpacity(0.9),
//         title: Text(
//           'Unlock ${character.name}?',
//           style: const TextStyle(
//             color: Colors.deepPurple,
//             fontFamily: 'ComicSans',
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Image.asset(
//               character.imagePath,
//               height: 100,
//             ),
//             const SizedBox(height: 10),
//             _buildUnlockWidget(character.price.toInt()),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text(
//               'Cancel',
//               style: TextStyle(color: Colors.grey),
//             ),
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.deepPurple,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//             ),
//             onPressed: () {
//               context.read<CharacterCubit>().unlockCharacter(character);
//               Navigator.pop(context);
//             },
//             child: const Text(
//               'Unlock',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
  }

  Future<void> _navigateCharacters(bool next) async {
    final characters = (context.read<CharacterCubit>().state as CharacterLoaded).characters;
    if (next && currentIndex < characters.length - 1) {
      setState(() => currentIndex++);
      await _pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else if (!next && currentIndex > 0) {
      setState(() => currentIndex--);
      await _pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        if (state is CharacterLoaded) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/icon/bg.jpeg',
                ),
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  _buildStatsBar(state.characters),
                  Expanded(child: _buildCharacterShowcase(state.characters)),
                  _buildCharacterGrid(state.characters),
                ],
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildStatsBar(List<CharacterModel> characters) {
    const playerStars = 12;
    const playerCandies = 150;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStatsContainer('assets/icon/star.png', playerStars, Colors.yellow),
          _buildStatsContainer('assets/icon/candy.png', playerCandies, Colors.pink),
        ],
      ),
    );
  }

  Widget _buildStatsContainer(String assetPath, int value, Color backgroundColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(assetPath, height: 24),
          const SizedBox(width: 8),
          Text(
            '$value',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'ComicSans',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCharacterShowcase(List<CharacterModel> characters) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: characters.length,
              onPageChanged: (index) => setState(() => currentIndex = index),
              itemBuilder: (context, index) => _buildCharacterCard(characters[index]),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => _navigateCharacters(false),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Image.asset('assets/icon/back_icon.png', height: 40),
                ),
              ),
              GestureDetector(
                onTap: () => _navigateCharacters(true),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Image.asset('assets/icon/forward_icon.png', height: 40),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCharacterCard(CharacterModel character) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              VerticalBounceWidget(
                child: Image.asset(
                  character.imagePath,
                  height: SizeConfig.getHeight(25),
                ),
              ),
              if (!character.isUnlocked) _buildUnlockWidget(character.price.toInt()),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            character.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
              fontFamily: 'ComicSans',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            character.description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.deepOrange,
              fontFamily: 'ComicSans',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildUnlockWidget(int price) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/icon/candy.png', height: 20),
          const SizedBox(width: 8),
          Text('$price', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildCharacterGrid(List<CharacterModel> characters) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: SizeConfig.getHeight(30),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.7,
            mainAxisExtent: 200,
          ),
          itemCount: characters.length,
          itemBuilder: (context, index) => CharacterCard(
            index: index,
            character: characters[index],
            onTap: () => _handleCharacterTap,
          ),
        ),
      ),
    );
  }

  void _handleCharacterTap(CharacterModel character) {
    if (character.isUnlocked) {
      context.read<CharacterCubit>().selectCharacter(character);
    } else {
      _showUnlockDialog(context, character);
    }
  }

  void _showUnlockDialog(BuildContext context, CharacterModel character) {
    showDialog<AlertDialog>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        backgroundColor: Colors.white,
        title: Text(
          'Unlock ${character.name}?',
          style: const TextStyle(
            color: Colors.deepOrange,
            fontFamily: 'ComicSans',
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(character.imagePath, height: 120),
            const SizedBox(height: 16),
            _buildUnlockWidget(character.price.toInt()),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            onPressed: () {
              context.read<CharacterCubit>().unlockCharacter(character);
              Navigator.pop(context);
            },
            child: const Text('Unlock', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/screen/alphabits_screen.dart';
import 'package:play_kido/features/home_content/presentation/numbers/screen/number_screen.dart';

class SubjectsGrid extends StatelessWidget {
  const SubjectsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children: [
          _buildSubjectCard(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<AlphabitsScreen>(builder: (context) => const AlphabitsScreen()),
              );
            },
            'Alphabets',
            'assets/icon/abcds.jpg',
            const Color(0xFF49B3FF),
            context,
          ),
          _buildSubjectCard(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<AlphabitsScreen>(builder: (context) => const NumberScreen()),
              );
            },
            'Numbers',
            'assets/icon/1234.jpeg',
            const Color(0xFF6B4CE6),
            context,
          ),
          _buildSubjectCard(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<AlphabitsScreen>(builder: (context) => const AlphabitsScreen()),
              );
            },
            'Shapes',
            'assets/icon/shapes.jpg',
            const Color(0xFF2E7D32),
            context,
          ),
          _buildSubjectCard(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<AlphabitsScreen>(builder: (context) => const AlphabitsScreen()),
              );
            },
            'Maths',
            'assets/icon/maths.png',
            const Color(0xFFE91E63),
            context,
          ),
          _buildSubjectCard(
            'Arts',
            'assets/icon/kids_art.jpg',
            const Color(0xFF26A69A),
            context,
          ),
        ],
      ),
    );
  }

  Widget _buildSubjectCard(
    String title,
    String imageUrl,
    Color color,
    BuildContext context, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Positioned.fill(
                child: imageUrl.contains('http')
                    ? Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        imageUrl,
                        fit: BoxFit.fill,
                      ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  color: color,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SubjectsGrid extends StatelessWidget {
  const SubjectsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(15),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          children: [
            _buildSubjectCard(
              'Alphabets',
              'assets/icon/abc.png',
              const Color(0xFF49B3FF),
              context,
            ),
            _buildSubjectCard(
              'Numbers',
              'assets/icon/number.png',
              const Color(0xFF6B4CE6),
              context,
            ),
            _buildSubjectCard(
              'Shapes',
              'assets/icon/shape.png',
              const Color(0xFF2E7D32),
              context,
            ),
            _buildSubjectCard(
              'Maths',
              'assets/icon/maths.png',
              const Color(0xFFE91E63),
              context,
            ),
            _buildSubjectCard(
              'Arts',
              'assets/icon/arts.png',
              const Color(0xFF26A69A),
              context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectCard(String title, String imageUrl, Color color, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add navigation logic here
      },
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

import 'package:flutter/material.dart';
import 'package:play_kido/core/common_widget/interactive_common_button.dart';
import 'package:play_kido/core/size_config/size_config.dart';
import 'package:play_kido/core/theme/app_colors.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/widgets/game_volume_button.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/widgets/header_widget.dart';
import 'package:play_kido/features/home_content/presentation/shapes/data/model/shapes_model.dart';

class HomeShapeScreen extends StatefulWidget {
  const HomeShapeScreen({super.key});

  @override
  State<HomeShapeScreen> createState() => _HomeShapeScreenState();
}

class _HomeShapeScreenState extends State<HomeShapeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  double _opacity = 1;

  void _navigateToNextPage() {
    if (_currentPage < shapeModels.length - 1) {
      setState(() {
        _opacity = 0.0; // Start fade-out animation
      });

      Future.delayed(const Duration(milliseconds: 300), () {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        setState(() {
          _opacity = 1.0; // Start fade-in animation
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icon/tracking_bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              KidsAppHeader(
                isBack: true,
                title: 'Shapes',
                onBackPress: () => Navigator.pop(context),
              ),
              Text(
                'This is a',
                style: TextStyle(
                  color: AppColors.darkText,
                  fontSize: SizeConfig.getHeight(4),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ComicSans',
                ),
              ),
              Expanded(
                flex: 4,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: shapeModels.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final shape = shapeModels[index];
                    return AnimatedOpacity(
                      opacity: _opacity,
                      duration: const Duration(milliseconds: 300),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            shape.name,
                            style: TextStyle(
                              color: AppColors.darkText,
                              fontSize: SizeConfig.getHeight(3.5),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ComicSans',
                            ),
                          ),
                          SizedBox(height: SizeConfig.getHeight(2)),
                          Image.asset(
                            shape.imagePath,
                            height: SizeConfig.getHeight(30),
                            width: SizeConfig.getWidth(30),
                          ),
                          SizedBox(height: SizeConfig.getHeight(2)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              shape.description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.darkText,
                                fontFamily: 'ComicSans',
                                fontSize: SizeConfig.getHeight(2.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GameVolumeButton(
                      onTap: () {},
                    ),
                    InteractiveButton(
                      buttonText: _currentPage == shapeModels.length - 1 ? 'Finish' : 'Next',
                      ontap: _navigateToNextPage,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

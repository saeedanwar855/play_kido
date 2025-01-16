// import 'dart:math';

// import 'package:flutter/material.dart';

// class ComplicatedPhysics extends StatefulWidget {
//   const ComplicatedPhysics({super.key});

//   @override
//   State<ComplicatedPhysics> createState() => _ComplicatedPhysicsState();
// }

// class _ComplicatedPhysicsState extends State<ComplicatedPhysics>
//     with SingleTickerProviderStateMixin {
//   bool isClick = false;
//   bool collapse = false;
//   myBall ball = myBall.origin();
//   late AnimationController _animationController;
//   double baseTime = 0.001;
//   double accel = 40000;

//   @override
//   void initState() {
//     super.initState();

//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 16),
//     );
//     _animationController
//       ..forward()
//       ..addStatusListener((status) {
//         if (!isClick) {
//           setState(() {
//             // if (ball.yPos + ball.ballRad > 300) {
//             //   ball.mulYvel(-1);
//             //   print("${ball.yVel}, ${ball.yPos}");
//             //   //ball.outVel();
//             // }

//             if (!collapse &&
//                 (ball.yVel.abs() * _animationController.value * baseTime +
//                         ball.yPos +
//                         ball.ballRad >
//                     300)) {
//               ball
//                 ..mulYvel(-0.9)
//                 ..subYpos(0.5 * accel * pow(baseTime, 2) - ball.yVel * baseTime)
//                 ..updateAnimation(_animationController.value);
//               collapse = true;
//               ball.outVel();
//               return;
//             }

//             ball
//               ..addYvel(baseTime * accel)
//               ..subYpos(0.5 * accel * pow(baseTime, 2) - ball.yVel * baseTime)
//               //ball.updateDraw();
//               ..updateAnimation(_animationController.value);
//             collapse = false;
//           });
//         }
//         if (status == AnimationStatus.completed) {
//           _animationController
//             ..value = 0
//             ..forward();
//         }
//       });
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Bounce!!'),
//       ),
//       body: Center(
//         child: GestureDetector(
//           onHorizontalDragDown: (details) {
//             setState(() {
//               if (ball.isBallRegion(details.localPosition.dx, details.localPosition.dy)) {
//                 isClick = true;
//                 ball.stop();
//               }
//             });
//           },
//           onHorizontalDragEnd: (details) {
//             if (isClick) {
//               setState(() {
//                 isClick = false;
//               });
//             }
//           },
//           onHorizontalDragUpdate: (details) {
//             if (isClick) {
//               setState(() {
//                 ball.setPosition(details.localPosition.dx, details.localPosition.dy);
//                 ball.updateDraw();
//               });
//             }
//           },
//           child: Container(
//             width: 300,
//             height: 300,
//             color: Colors.white70,
//             child: CustomPaint(
//               painter: _paint(ballPath: ball.draw),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _paint extends CustomPainter {
//   _paint({
//     required this.ballPath,
//   });
//   final Path ballPath;

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.brown
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2;

//     final path = Path();
//     path.addPath(ballPath, Offset.zero);

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }

// class myBall {
//   myBall.origin() {
//     xPos = 100;
//     yPos = 100;
//     xVel = 0;
//     yVel = 0;
//     ballRad = 20;
//     draw = Path();
//     for (var i = 0; i < ballRad - 1; i++) {
//       draw.addOval(
//         Rect.fromCircle(
//           center: Offset(
//             xPos,
//             yPos,
//           ),
//           radius: i.toDouble(),
//         ),
//       );
//     }
//   }
//   late double xPos;
//   late double yPos;
//   late double xVel;
//   late double yVel;
//   late double ballRad;
//   late Path draw;
//   double baseTime = 0.002;

//   void addXpos(double x) {
//     xPos += x;
//   }

//   void subXpos(double x) {
//     xPos -= x;
//   }

//   void addYpos(double y) {
//     yPos += y;
//   }

//   void subYpos(double y) {
//     yPos -= y;
//   }

//   void addXvel(double x) {
//     xVel += x;
//   }

//   void subXvel(double x) {
//     xVel -= x;
//   }

//   void addYvel(double y) {
//     yVel += y;
//   }

//   void subYvel(double y) {
//     yVel -= y;
//   }

//   void mulXvel(double v) {
//     xVel *= v;
//   }

//   void mulYvel(double v) {
//     yVel *= v;
//   }

//   void stop() {
//     xVel = 0;
//     yVel = 0;
//   }

//   void outVel() {
//     if (yVel.abs() < 500) {
//       yVel = 0;
//     }
//     if (xVel.abs() < 100) {
//       xVel = 0;
//     }
//   }

//   void setPosition(double x, double y) {
//     xPos = x;
//     yPos = y;
//   }

//   bool isBallRegion(double checkX, double checkY) {
//     if ((pow(xPos - checkX, 2) + pow(yPos - checkY, 2)) <= pow(ballRad, 2)) {
//       return true;
//     }
//     return false;
//   }

//   void updateDraw() {
//     draw = Path();
//     for (var i = 0; i < ballRad - 1; i++) {
//       draw.addOval(
//         Rect.fromCircle(
//           center: Offset(
//             xPos,
//             yPos,
//           ),
//           radius: i.toDouble(),
//         ),
//       );
//     }
//   }

//   void updateAnimation(double animationValue) {
//     draw = Path();
//     for (var i = 0; i < ballRad - 1; i++) {
//       draw.addOval(
//         Rect.fromCircle(
//           center: Offset(
//             xPos + animationValue * xVel * baseTime,
//             yPos + animationValue * yVel * baseTime,
//           ),
//           radius: i.toDouble(),
//         ),
//       );
//     }
//   }
// }
import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DoraemonPhysics extends StatefulWidget {
  const DoraemonPhysics({super.key});

  @override
  State<DoraemonPhysics> createState() => _DoraemonPhysicsState();
}

class _DoraemonPhysicsState extends State<DoraemonPhysics> with SingleTickerProviderStateMixin {
  bool isClick = false;
  bool collapse = false;
  late DoraemonSprite doraemon;
  late AnimationController _animationController;
  ui.Image? characterImage;
  double baseTime = 0.001;
  double accel = 40000;

  @override
  void initState() {
    super.initState();
    doraemon = DoraemonSprite.origin();
    _loadImage();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 16),
    );

    _animationController
      ..forward()
      ..addStatusListener((status) {
        if (!isClick) {
          setState(() {
            if (!collapse &&
                (doraemon.yVel.abs() * _animationController.value * baseTime +
                        doraemon.yPos +
                        doraemon.size >
                    300)) {
              doraemon
                ..mulYvel(-0.9)
                ..subYpos(0.5 * accel * pow(baseTime, 2) - doraemon.yVel * baseTime)
                ..updateAnimation(_animationController.value);
              collapse = true;
              doraemon.outVel();
              return;
            }

            doraemon
              ..addYvel(baseTime * accel)
              ..subYpos(0.5 * accel * pow(baseTime, 2) - doraemon.yVel * baseTime)
              ..updateAnimation(_animationController.value);
            collapse = false;
          });
        }
        if (status == AnimationStatus.completed) {
          _animationController
            ..value = 0
            ..forward();
        }
      });
  }

  Future<void> _loadImage() async {
    final data = await rootBundle.load('assets/character/doremon.png');
    final bytes = data.buffer.asUint8List();
    final image = await decodeImageFromList(bytes);
    setState(() {
      characterImage = image;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bouncing Doraemon'),
      ),
      body: Center(
        child: GestureDetector(
          onPanDown: (details) {
            setState(() {
              if (doraemon.isInRegion(details.localPosition.dx, details.localPosition.dy)) {
                isClick = true;
                doraemon.stop();
              }
            });
          },
          onPanEnd: (details) {
            if (isClick) {
              setState(() {
                isClick = false;
              });
            }
          },
          onPanUpdate: (details) {
            if (isClick) {
              setState(() {
                doraemon.setPosition(details.localPosition.dx, details.localPosition.dy);
              });
            }
          },
          child: Container(
            width: 300,
            height: 300,
            color: Colors.white70,
            child: CustomPaint(
              painter: DoraemonPainter(
                position: Offset(doraemon.xPos, doraemon.yPos),
                image: characterImage,
                size: doraemon.size,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DoraemonSprite {
  DoraemonSprite.origin() {
    xPos = 100;
    yPos = 100;
    xVel = 0;
    yVel = 0;
    size = 60;
    baseTime = 0.002;
  }

  late double xPos;
  late double yPos;
  late double xVel;
  late double yVel;
  late double size;
  late double baseTime;

  void addXpos(double x) => xPos += x;
  void subXpos(double x) => xPos -= x;
  void addYpos(double y) => yPos += y;
  void subYpos(double y) => yPos -= y;

  void addXvel(double x) => xVel += x;
  void subXvel(double x) => xVel -= x;
  void addYvel(double y) => yVel += y;
  void subYvel(double y) => yVel -= y;

  void mulXvel(double v) => xVel *= v;
  void mulYvel(double v) => yVel *= v;

  void stop() {
    xVel = 0;
    yVel = 0;
  }

  void outVel() {
    if (yVel.abs() < 500) yVel = 0;
    if (xVel.abs() < 100) xVel = 0;
  }

  bool isInRegion(double checkX, double checkY) {
    return checkX >= xPos - size / 2 &&
        checkX <= xPos + size / 2 &&
        checkY >= yPos - size / 2 &&
        checkY <= yPos + size / 2;
  }

  void setPosition(double x, double y) {
    xPos = x;
    yPos = y;
  }

  void updateAnimation(double animationValue) {
    xPos += animationValue * xVel * baseTime;
    yPos += animationValue * yVel * baseTime;
  }
}

class DoraemonPainter extends CustomPainter {
  DoraemonPainter({
    required this.position,
    required this.image,
    required this.size,
  });
  final Offset position;
  final ui.Image? image;
  final double size;

  @override
  void paint(Canvas canvas, Size canvasSize) {
    if (image != null) {
      canvas.drawImageRect(
        image!,
        Rect.fromLTWH(0, 0, image!.width.toDouble(), image!.height.toDouble()),
        Rect.fromCenter(
          center: position,
          width: size,
          height: size,
        ),
        Paint(),
      );
    }
  }

  @override
  bool shouldRepaint(DoraemonPainter oldDelegate) => true;
}

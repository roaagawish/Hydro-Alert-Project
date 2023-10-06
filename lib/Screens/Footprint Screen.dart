import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



class FootprintScreen extends StatefulWidget {
  const FootprintScreen({super.key});

  @override
  _FootprintScreenState createState() => _FootprintScreenState();
}

class _FootprintScreenState extends State<FootprintScreen> with TickerProviderStateMixin {

  late AnimationController firstController;
  late Animation<double> firstAnimation;
  late AnimationController secondController;
  late Animation<double> secondAnimation;
  late AnimationController thirdController;
  late Animation<double> thirdAnimation;
  late AnimationController fourthController;
  late Animation<double> fourthAnimation;

  @override
  void initState() {
    super.initState();
    firstController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    firstAnimation = Tween<double>(begin: 1.9, end: 2.1).animate(
        CurvedAnimation(parent: firstController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          firstController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          firstController.forward();
        }
      });

    secondController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    secondAnimation = Tween<double>(begin: 1.8, end: 2.4).animate(
        CurvedAnimation(parent: secondController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          secondController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          secondController.forward();
        }
      });

    thirdController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    thirdAnimation = Tween<double>(begin: 1.8, end: 2.4).animate(
        CurvedAnimation(parent: thirdController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          thirdController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          thirdController.forward();
        }
      });

    fourthController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    fourthAnimation = Tween<double>(begin: 1.9, end: 2.1).animate(
        CurvedAnimation(parent: fourthController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fourthController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          fourthController.forward();
        }
      });
    Timer(const Duration(seconds: 2), () {
      firstController.forward();
    });
    Timer(const Duration(milliseconds: 1600), () {
      secondController.forward();
    });
    Timer(const Duration(milliseconds: 800), () {
      thirdController.forward();
    });
    fourthController.forward();
  }
  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    super.dispose();
  }
  num waterlevel = 8;
  bool show = false;
  bool show2= false;

  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: const Text("Water Footprint"),
      ),
      body: Stack(
        //alignment:  Alignment.topLeft,
        children: [
          CustomPaint(
            painter: MyPainter(
              firstAnimation.value*waterlevel,
              secondAnimation.value*waterlevel,
              thirdAnimation.value*waterlevel,
              fourthAnimation.value*waterlevel,
            ),
            child: SizedBox(
              height: size.height,
              width: size.width,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text("Your Ideal Daily Water Footprint is : 3800 Litter/day ", style: TextStyle(fontSize: 25 ) ),
                  const SizedBox( height: 30,),
                  const Text("Every meal or drink you take during your day , reduces your daily limit of water litters.\n"
                      " So be wise with them!", style: TextStyle(color: Colors.black54,fontSize: 10), ),
                  const SizedBox(height: 20,),
                  const Text("Enter your meal"),
                  const SizedBox(height: 20,),
                  IconButton(onPressed: () {
                         setState(() {
                           waterlevel= waterlevel-0.2;
                           if (waterlevel == 0.5) {
                             show = true ;
                             //alert = "assets/animation_redDots.json";
                           }
                           if (waterlevel ==  1) {
                              show2 = true  ;
                             //alert = "assets/animation_blueAlert.json";
                           }
                           if (waterlevel == 0.2) {
                             waterlevel = 8;
                           }
                         });
                  }, icon: const Icon(Icons.add)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double firstValue;
  final double secondValue;
  final double thirdValue;
  final double fourthValue;

  MyPainter(
      this.firstValue,
      this.secondValue,
      this.thirdValue,
      this.fourthValue,
      );

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
     ..color = Colors.blue.withOpacity(.5)
      ..style = PaintingStyle.fill;

    var path = Path()
      ..moveTo(0, size.height / firstValue)
      ..cubicTo(size.width * .4, size.height / secondValue, size.width * .7,
          size.height / thirdValue, size.width, size.height / fourthValue)
      ..lineTo(size.width , size.height)
      ..lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


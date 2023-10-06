import 'package:flutter/material.dart';
import 'package:hydro_alert/Screens/Login%20Screen.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Welcome Screen.dart';
import 'package:lottie/lottie.dart';

class OnLandingScreen extends StatelessWidget {
   OnLandingScreen({super.key});

  final List<PageViewModel> pages = [
  PageViewModel(
  title: 'Welcome to \n "Hydro Alert" ',
  body:
  'In our app we will take you in a long journey with the most important thing in our world "Water" ',
  image: Center(
  child: Lottie.asset("assets/animation_waterfull.json"),
  ),
  decoration: const PageDecoration(
  titleTextStyle: TextStyle(
  fontSize: 25,
  color: Colors.blue,
  fontWeight: FontWeight.bold,
  ),
  bodyTextStyle: TextStyle(color:Color(0xFF64B5F6),fontSize: 18)
  ),
   ),
    PageViewModel(
      title: "Dewy's Journey ",
      body:
      'Our friend "Dewy" will take you in her journey to know all details of the "Water Cycle" starting from the ocean to your cup of water ',
      image: Center(
        child: Lottie.asset('assets/animation_waterdrop.json',),
      ),
      decoration: const PageDecoration(
      titleTextStyle: TextStyle(
      fontSize: 25,
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      ),
      bodyTextStyle: TextStyle(color:Color(0xFF64B5F6),fontSize: 18)
      ),
    ),
    PageViewModel(
      title: 'Climate Change & Water ',
      body:
      'We will explain to you how the water around you affected by the changes of the climate in the world',
      image: Center(
        child: Lottie.asset('assets/animation_climate.json',),
      ),
      decoration: const PageDecoration(
      titleTextStyle: TextStyle(
      fontSize: 25,
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      ),
      bodyTextStyle: TextStyle(color:Color(0xFF64B5F6),fontSize: 18)
      ),
    ),
    PageViewModel(
      title: 'Water Footprint ',
      body:
      'You will know about the water footprint and the affect of your choices on the water around you',
      image: Center(
        child: Lottie.asset('assets/animation_waterfootprint.json',),
      ),
      decoration: const PageDecoration(
          titleTextStyle: TextStyle(
            fontSize: 25,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
          bodyTextStyle: TextStyle(color:Color(0xFF64B5F6),fontSize: 18)
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.only(top: 60 , left:10.0 , right: 10.0 , bottom: 10.0),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(10, 10),
            color: Colors.blue,
            activeSize: Size.square(15),
            activeColor: Color.fromRGBO(30,136,229,1),
          ),
          showDoneButton: true,
          done: const Text(
            'Done',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
            ),
          ),
          showSkipButton: true,
          skip: const Text(
            'Skip',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
            ),
          ),
          showNextButton: true,
          next: const Icon(
            Icons.arrow_forward,
            size: 30,
            color:Colors.blue ,
          ),
          onDone: () => onDone(context),
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('showHome', true);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}


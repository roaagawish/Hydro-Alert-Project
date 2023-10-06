import 'package:flutter/material.dart';
import 'Climate Screen.dart';
import 'Footprint Screen.dart';
import 'Home Screen.dart';
import 'Settings Screen.dart';
import 'Water Cycle Screen.dart';

class RouteScreen extends StatefulWidget {
  const RouteScreen({super.key});

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
   int selectedIndex = 0;
   List screens =[
      const Home(),
      const WaterCycle(),
      const ClimateScreen(),
      const FootprintScreen(),
      const SettingsScreen(),
    ];

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF64B5F6),
        unselectedItemColor: Colors.black26,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        currentIndex: selectedIndex,
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.water_drop_outlined),
            label: "Water Cycle",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.sunny_snowing),
            label: "Climate ",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.fastfood),
            label: "Footprint",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}


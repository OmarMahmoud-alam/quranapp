import 'package:flutter/material.dart';
import 'package:quranapp/core/resources/route_manager.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: Colors.greenAccent,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
ElevatedButton(
            onPressed: () {
              RouteManager.goTo(RouteManager.surah,
                  arguments: '2');
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(200, 50), backgroundColor: Colors.white, // Button color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Small curve
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Adjust padding if needed
            ),
            child: Text('Custom Button', style: TextStyle(color: Colors.greenAccent),),
          ),
        
          ],
        ),
      ),
    );
  }
}
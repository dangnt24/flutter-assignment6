import 'package:flutter/material.dart';
import 'package:assignment6/game_screen.dart';
import 'package:flutter/services.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        child: SafeArea(
          child: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'GAME for KIDS',
                    style: TextStyle(fontSize: 32, fontFamily: 'FjallaOne'),
                  ),
                  SizedBox(height: 80),
                  Image.asset('assets/logo.jpeg', width: 400,),
                  SizedBox(height: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white30,
                      foregroundColor: Colors.black,
                      minimumSize: Size(100, 50),
                      shape: RoundedRectangleBorder(),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GameScreen()),
                      );
                    },
                    child: Text(
                      'START',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
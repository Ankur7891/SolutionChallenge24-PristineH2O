import 'dart:async';

import 'homescreen.dart';
import 'package:flutter/material.dart';
import 'package:gradient_icon/gradient_icon.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with SingleTickerProviderStateMixin{
  double _opacity = 0.0;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    startTimer();
    // Add a delay to start the main opacity animation after a certain duration
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    // Animation controller for the circle icons
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    // Curved animation for smoother transitions
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    // Start the animation
    _controller.forward();
  }
  startTimer()async{
    var duration=Duration(seconds:4);
    return Timer(duration,route);
  }
  route(){
    Navigator.pushReplacement(context as BuildContext, MaterialPageRoute(builder: (context)=>HomeScreen()
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("images/logo1.png"),
              ),
              SizedBox(height: 10),
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 1),
                child: Image(
                  image: AssetImage("images/PristineH2O.png"),
                ),
              ),
              SizedBox(height: 10),
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 5),
                child: Image(
                  image: AssetImage("images/Slogan.png"),
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _animation.value,

                        child: GradientIcon(
                          icon: Icons.circle,
                          gradient: LinearGradient(
                            colors: [Colors.blue.shade50, Colors.blue.shade100],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          size: 30,
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 10),
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _animation.value,
                        child: GradientIcon(
                          icon: Icons.circle,
                          gradient: LinearGradient(
                            colors: [Colors.teal.shade50, Colors.teal.shade100],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          size: 30,
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 10),
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _animation.value,
                        child: GradientIcon(
                          icon: Icons.circle,
                          gradient: LinearGradient(
                            colors: [Colors.amber.shade100, Colors.amber.shade50],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomRight,
                          ),
                          size: 30,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_dragonball/pages/home/home.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
            image: AssetImage("assets/logo/ingnex.png"),
            width: 200,
          ),
          SizedBox(
            height: 50,
          ),
          SpinKitPianoWave(
            color: Colors.red,
            size: 50.0,
          ),
        ]),
      ),
    );
  }
}

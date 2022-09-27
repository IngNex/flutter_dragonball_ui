import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Stack(
            children: [
              Positioned(
                bottom: -25,
                right: -25,
                child: Image.asset(
                  'images/logo.png',
                  height: 150,
                  fit: BoxFit.fitWidth,
                  color: Colors.white12.withOpacity(0.2),
                  colorBlendMode: BlendMode.modulate,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

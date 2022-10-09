import 'package:flutter/material.dart';

class imgRadar extends StatelessWidget {
  const imgRadar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: -50,
      child: Image.asset(
        'assets/images/radar.png',
        width: 140,
        color: Colors.white.withOpacity(.3),
        colorBlendMode: BlendMode.modulate,
      ),
    );
  }
}

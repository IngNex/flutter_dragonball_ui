import 'package:flutter/material.dart';
import 'package:flutter_dragonball/utils/dimensions.dart';

class imgRadar extends StatelessWidget {
  const imgRadar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: -Dimensions.width50,
      child: Image.asset(
        'assets/images/radar.png',
        width: Dimensions.width130,
        color: Colors.white.withOpacity(.3),
        colorBlendMode: BlendMode.modulate,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_dragonball/utils/dimensions.dart';

class imgTituloLogo extends StatelessWidget {
  const imgTituloLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Dimensions.height30,
      left: Dimensions.width30,
      child: Image.asset(
        'assets/images/logo.png',
        width: Dimensions.width250,
      ),
    );
  }
}

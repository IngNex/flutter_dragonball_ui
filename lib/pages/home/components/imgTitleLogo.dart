import 'package:flutter/material.dart';

class imgTituloLogo extends StatelessWidget {
  const imgTituloLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      left: 30,
      child: Image.asset(
        'assets/images/logo.png',
        width: 250,
      ),
    );
  }
}

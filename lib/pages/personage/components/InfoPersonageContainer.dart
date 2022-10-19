import 'package:flutter/material.dart';
import 'package:flutter_dragonball/pages/personage/personages_details.dart';

class infoPersonagesContainer extends StatelessWidget {
  const infoPersonagesContainer({
    Key? key,
    required this.color,
    required this.species,
  }) : super(key: key);

  final Color color;
  final String species;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * .02),
      padding: EdgeInsets.all(5),
      height: 60,
      width: 80,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: color.withOpacity(0.5),
              offset: Offset(-3, 3),
              blurRadius: 10),
          BoxShadow(
            color: Colors.white,
            offset: Offset(10, -10),
            blurRadius: 15,
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFF9F8FD),
      ),
      child: Center(
        child: Text(
          '$species',
        ),
      ),
    );
  }
}

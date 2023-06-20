import 'package:flutter/material.dart';
import 'package:flutter_dragonball/ui/utils/dimensions.dart';

class infoPersonagesContainer extends StatelessWidget {
  const infoPersonagesContainer({
    Key? key,
    required this.color,
    required this.species,
    required this.title,
  }) : super(key: key);

  final Color color;
  final String species;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.screenHeight * .02),
      padding: const EdgeInsets.all(5),
      height: Dimensions.height60,
      width: Dimensions.width80,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: color.withOpacity(0.5),
              offset: const Offset(-2, 2),
              blurRadius: 4),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(2, -2),
            blurRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        color: const Color(0xFFF9F8FD),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: Dimensions.font12),
          ),
          Center(
            child: Text(
              species,
              style: TextStyle(
                  fontSize: Dimensions.font14, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

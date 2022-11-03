import 'package:flutter/material.dart';
import 'package:flutter_dragonball/utils/dimensions.dart';

class DetailDataPersonage extends StatelessWidget {
  const DetailDataPersonage({
    Key? key,
    required this.textinfo,
  }) : super(key: key);
  final String textinfo;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Dimensions.height10,
      left: Dimensions.width12,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius50)),
          color: Colors.white.withOpacity(.5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 4, right: 8, left: 8),
          child: Text(
            textinfo,
            style: TextStyle(
                fontSize: Dimensions.font12,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

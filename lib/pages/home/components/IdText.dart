import 'package:flutter/material.dart';

class DetailDataPersonage extends StatelessWidget {
  const DetailDataPersonage({
    Key? key,
    required this.textinfo,
  }) : super(key: key);
  final String textinfo;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 12,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.white.withOpacity(.5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 4, right: 8, left: 8),
          child: Text(
            textinfo,
            style: const TextStyle(
                fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

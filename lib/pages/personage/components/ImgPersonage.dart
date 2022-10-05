import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class imgPersonage extends StatelessWidget {
  const imgPersonage({
    Key? key,
    required this.color,
    required this.img,
  }) : super(key: key);

  final Color color;
  final String img;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.75,
      width: size.width * 0.7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 60,
                color: color.withOpacity(0.35))
          ]),
      child: CachedNetworkImage(
        imageUrl: img,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
    );
  }
}

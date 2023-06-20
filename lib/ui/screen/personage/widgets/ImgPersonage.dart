import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dragonball/ui/utils/dimensions.dart';

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
    return Container(
      height: Dimensions.screenHeight * 0.75,
      width: Dimensions.screenWidth * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius60),
          bottomLeft: Radius.circular(Dimensions.radius60),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(-5, 10),
            blurRadius: 15,
            color: color.withOpacity(0.65),
          ),
        ],
      ),
      child: CachedNetworkImage(
        imageUrl: img,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
        imageBuilder: (context, imageProvider) => Container(
          height: Dimensions.height100,
          width: Dimensions.width100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius60),
              bottomLeft: Radius.circular(Dimensions.radius60),
            ),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 0,
                color: color.withOpacity(.65),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
child: CachedNetworkImage(
        imageUrl: img,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
 */
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_dragonball/ui/screen/personage/widgets/ImgPersonage.dart';
import 'package:flutter_dragonball/ui/screen/personage/widgets/InfoPersonageContainer.dart';
import 'package:flutter_dragonball/ui/screen/personage/personages_details.dart';
import 'package:flutter_dragonball/ui/utils/dimensions.dart';

class InfoImgPersonage extends StatelessWidget {
  InfoImgPersonage({
    Key? key,
    required this.index,
    required this.color,
    required this.widget,
  }) : super(key: key);

  final int index;
  final Color color;
  final PersonagesDetails widget;

  @override
  Widget build(BuildContext context) {
    var personage = widget.personageDetail;
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.height10),
      child: SizedBox(
        height: Dimensions.screenHeight * .75,
        /* influye en la img */
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: Dimensions.height60),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width20),
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const Spacer(),
                    infoPersonagesContainer(
                        color: color,
                        title: "Power:",
                        species: personage.power),
                    infoPersonagesContainer(
                        color: color,
                        title: "Height:",
                        species: personage.height),
                    infoPersonagesContainer(
                        color: color,
                        title: "Weight:",
                        species: personage.weight),
                    infoPersonagesContainer(
                        color: color,
                        title: "Gender:",
                        species: personage.gender),
                  ],
                ),
              ),
            ),
            Hero(
                tag: index,
                child: imgPersonage(color: color, img: personage.img))
          ],
        ),
      ),
    );
  }
}

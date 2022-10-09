import 'package:flutter/material.dart';
import 'package:flutter_dragonball/pages/personage/components/ImgPersonage.dart';
import 'package:flutter_dragonball/pages/personage/components/InfoPersonageContainer.dart';
import 'package:flutter_dragonball/pages/personage/personages_details.dart';

class InfoImgPersonage extends StatelessWidget {
  const InfoImgPersonage({
    Key? key,
    required this.color,
    required this.widget,
  }) : super(key: key);

  final Color color;
  final PersonagesDetails widget;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: size.height * .75,
        /* influye en la img */
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 60),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Spacer(),
                    infoPersonagesContainer(
                        color: color, species: widget.personageDetail['saga']),
                    infoPersonagesContainer(
                        color: color,
                        species: widget.personageDetail['species']),
                    infoPersonagesContainer(
                        color: color, species: widget.personageDetail['saga']),
                    infoPersonagesContainer(
                        color: color,
                        species: widget.personageDetail['species']),
                  ],
                ),
              ),
            ),
            imgPersonage(color: color, img: widget.personageDetail['img'])
          ],
        ),
      ),
    );
  }
}

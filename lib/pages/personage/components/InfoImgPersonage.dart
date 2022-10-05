import 'package:flutter/material.dart';
import 'package:flutter_dragonball/pages/personage/components/ImgPersonage.dart';
import 'package:flutter_dragonball/pages/personage/components/InfoPersonageContainer.dart';

class InfoImgPersonage extends StatelessWidget {
  const InfoImgPersonage({
    Key? key,
    required this.color,
    required this.species,
    required this.img,
    required this.saga,
  }) : super(key: key);

  final Color color;
  final String species;
  final String saga;
  final String img;

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
                    infoPersonagesContainer(color: color, species: saga),
                    infoPersonagesContainer(color: color, species: species),
                    infoPersonagesContainer(color: color, species: species),
                    infoPersonagesContainer(color: color, species: species),
                  ],
                ),
              ),
            ),
            imgPersonage(color: color, img: img)
          ],
        ),
      ),
    );
  }
}

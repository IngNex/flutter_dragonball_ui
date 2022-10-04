import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dragonball/pages/personage/components/ImgPersonage.dart';
import 'package:flutter_dragonball/pages/personage/components/InfoPersonageContainer.dart';

class PersonagesDetails extends StatefulWidget {
  final personageDetail;
  final Color color;
  final int indexTag;
  const PersonagesDetails(
      {super.key,
      required this.personageDetail,
      required this.color,
      required this.indexTag});

  @override
  State<PersonagesDetails> createState() => _PersonagesDetailsState();
}

class _PersonagesDetailsState extends State<PersonagesDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var species = widget.personageDetail['species'];
    var img = widget.personageDetail['img'];
    var color = widget.color;
    return Scaffold(
      body: Column(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                height: size.height * .65,
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
                                color: color, species: species),
                          ],
                        ),
                      ),
                    ),
                    imgPersonage(color: color, img: img)
                  ],
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}

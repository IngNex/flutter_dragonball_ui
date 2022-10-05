import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dragonball/pages/personage/components/DataPersonageName.dart';
import 'package:flutter_dragonball/pages/personage/components/ImgPersonage.dart';
import 'package:flutter_dragonball/pages/personage/components/InfoImgPersonage.dart';
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
    var saga = widget.personageDetail['saga'];
    var img = widget.personageDetail['img'];
    var name = widget.personageDetail['name'];
    var color = widget.color;
    return Scaffold(
      body: Column(children: [
        Column(
          children: [
            InfoImgPersonage(
                color: color, species: species, saga: saga, img: img),
            dataPersonageName(widget: widget, color: color),
            dataPersonageName(widget: widget, color: color),
            Row(
              children: [
                SizedBox(
                  width: size.width / 2,
                  height: 84,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      name,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width / 2,
                  height: 84,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      name,
                      style: TextStyle(color: color, fontSize: 25),
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ]),
    );
  }
}

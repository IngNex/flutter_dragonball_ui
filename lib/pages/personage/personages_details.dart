import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dragonball/pages/personage/components/ButtonMore.dart';
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
    var color = widget.color;
    return Scaffold(
      body: Column(children: [
        Column(
          children: [
            InfoImgPersonage(
              color: color,
              widget: widget,
            ),
            dataPersonageName(widget: widget, color: color),
            ButtonMore(color: color, widget: widget)
          ],
        )
      ]),
    );
  }
}

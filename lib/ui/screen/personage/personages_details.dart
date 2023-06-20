import 'package:flutter/material.dart';
import 'package:flutter_dragonball/ui/screen/personage/widgets/ButtonMore.dart';
import 'package:flutter_dragonball/ui/screen/personage/widgets/DataPersonageName.dart';
import 'package:flutter_dragonball/ui/screen/personage/widgets/InfoImgPersonage.dart';

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
      backgroundColor: Colors.white,
      body: Column(children: [
        Column(
          children: [
            InfoImgPersonage(
                color: color, widget: widget, index: widget.indexTag),
            dataPersonageName(widget: widget, color: color),
            ButtonMore(color: color, widget: widget)
          ],
        )
      ]),
    );
  }
}

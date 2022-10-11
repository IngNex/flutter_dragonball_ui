import 'package:flutter/material.dart';
import 'package:flutter_dragonball/pages/personage/personages_details.dart';

class ButtonMore extends StatelessWidget {
  const ButtonMore({
    Key? key,
    required this.color,
    required this.widget,
  }) : super(key: key);

  final Color color;
  final PersonagesDetails widget;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: size.width / 2,
          height: 55,
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
              widget.personageDetail['transformation'],
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
        SizedBox(
          width: size.width / 2,
          height: 55,
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
              'More',
              style: TextStyle(color: color, fontSize: 25),
            ),
          ),
        ),
      ],
    );
  }
}

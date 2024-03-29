import 'package:flutter/material.dart';
import 'package:flutter_dragonball/ui/screen/personage/personages_details.dart';
import 'package:flutter_dragonball/ui/utils/dimensions.dart';

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
    final personage = widget.personageDetail;
    return Row(
      children: [
        SizedBox(
          width: Dimensions.screenWidth / 2,
          height: Dimensions.height55,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius50),
                ),
              ),
              foregroundColor: Colors.white,
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Saga: ',
                  style: TextStyle(
                      color: Colors.black, fontSize: Dimensions.font13),
                ),
                Text(
                  personage.saga,
                  style: TextStyle(
                      color: Colors.white, fontSize: Dimensions.font20),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: Dimensions.screenWidth / 2,
          height: Dimensions.height55,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius50),
                ),
              ),
              foregroundColor: color,
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Evo: ',
                  style: TextStyle(
                      color: Colors.black, fontSize: Dimensions.font13),
                ),
                Text(
                  personage.transformation,
                  style: TextStyle(color: color, fontSize: Dimensions.font20),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

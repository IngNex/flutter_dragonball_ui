import 'package:flutter/material.dart';
import 'package:flutter_dragonball/pages/personage/personages_details.dart';
import 'package:flutter_dragonball/utils/dimensions.dart';

class dataPersonageName extends StatelessWidget {
  const dataPersonageName({
    Key? key,
    required this.widget,
    required this.color,
  }) : super(key: key);

  final PersonagesDetails widget;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width25, vertical: Dimensions.height10),
      child: Column(
        children: [
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${widget.personageDetail['name']}\n",
                      style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.font30),
                    ),
                    TextSpan(
                      text: "raza: ${widget.personageDetail['species']}",
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.w500,
                        fontSize: Dimensions.font18,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Text(
                "Planeta: ${widget.personageDetail['planet']}",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
          Container(
            height: Dimensions.height58,
            child: Center(
              child: Text(
                'Goku es un sayajin criado en la tierra y a tenido muchos combates con seres poderosos Goku es un sayajin criado en la tierra y a tenido muchos combates con seres poderosos',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

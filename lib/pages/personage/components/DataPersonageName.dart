import 'package:flutter/material.dart';
import 'package:flutter_dragonball/pages/personage/personages_details.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${widget.personageDetail['name']}\n",
                  style: TextStyle(
                      color: color, fontWeight: FontWeight.bold, fontSize: 30),
                ),
                TextSpan(
                  text: 'Raza: ${widget.personageDetail['species']}',
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            'Saga: ${widget.personageDetail['saga']}',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ],
      ),
    );
  }
}

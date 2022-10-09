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
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
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
                          fontSize: 30),
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
          Container(
            height: 58,
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

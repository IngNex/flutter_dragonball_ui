import 'package:flutter/material.dart';
import 'package:flutter_dragonball/ui/screen/personage/personages_details.dart';
import 'package:flutter_dragonball/ui/utils/dimensions.dart';

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
    final personage = widget.personageDetail;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width25, vertical: Dimensions.height12),
      child: Column(
        children: [
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${personage.name}\n",
                      style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.font30),
                    ),
                    TextSpan(
                      text: "raza: ${personage.species}",
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
                "Planeta: ${personage.planet}",
                style:
                    TextStyle(color: Colors.black, fontSize: Dimensions.font20),
              ),
            ],
          ),
          Container(
            height: Dimensions.height60,
            child: Center(
              child: Text(
                'Dragon Ball Z se centra en la vida adulta de Son Goku, quien tendrá que defender la tierra de los numerosos villanos que amenazan con destruirla. Además, la serie trama de forma paralela la madurez de su hijo Gohan. La producción destaca por tener un tono más serio que su predecesora.Dragon Ball Z se centra en la vida adulta de Son Goku, quien tendrá que defender la tierra de los numerosos villanos que amenazan con destruirla. Además, la serie trama de forma paralela la madurez de su hijo Gohan. La producción destaca por tener un tono más serio que su predecesora.',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Dimensions.font12,
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

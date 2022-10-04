import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: size.height * .03),
                              padding: EdgeInsets.all(5),
                              height: 60,
                              width: 100,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: widget.color.withOpacity(0.22),
                                      offset: Offset(0, 5),
                                      blurRadius: 22),
                                  BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(-15, -15),
                                      blurRadius: 20)
                                ],
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFFF9F8FD),
                              ),
                              child: Center(
                                child: Text(
                                  species,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: size.height * 0.65,
                      width: size.width * 0.65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60),
                          ),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 60,
                                color: widget.color.withOpacity(0.35))
                          ]),
                      child: CachedNetworkImage(
                        imageUrl: img,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    )
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

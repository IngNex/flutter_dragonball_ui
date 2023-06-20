import 'dart:convert';

import 'package:flutter_dragonball/ui/utils/color/MaterialColor.dart';
import 'package:flutter_dragonball/ui/screen/home/widgets/IdText.dart';
import 'package:flutter_dragonball/ui/screen/home/widgets/SinConexion.dart';
import 'package:flutter_dragonball/ui/screen/home/widgets/imgRadar.dart';
import 'package:flutter_dragonball/ui/screen/home/widgets/imgTitleLogo.dart';
import 'package:flutter_dragonball/ui/screen/personage/personages_details.dart';
import 'package:flutter_dragonball/ui/utils/dimensions.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /* ================ Consumir Api ================= */
  var DBZApi =
      'https://raw.githubusercontent.com/IngNex/dragonball-api-sagas/master/dragonballz.json';

  List dbzData = [];

  void initState() {
    super.initState();
    if (mounted) {
      fetchDadronBallData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          imgTituloLogo(),
          imgRadar(),
          /*Positioned(
            child: Center(
              child: Image.asset(
                'assets/images/esferasdragon.png',
                width: 400,
                color: Colors.white.withOpacity(.6),
                colorBlendMode: BlendMode.modulate,
              ),
            ),
          ),*/
          dbzData.length != 0
              ? Positioned(
                  top: Dimensions.height150,
                  bottom: 0,
                  width: Dimensions.screenWidth,
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 1.1),
                          itemCount: dbzData.length,
                          itemBuilder: (context, index) {
                            var id = dbzData[index]['id'];
                            var img = dbzData[index]['img'];
                            var name = dbzData[index]['name'];
                            var species = dbzData[index]['species'];
                            var saga = dbzData[index]['saga'];
                            return InkWell(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: getColor(species),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      /* ====== Img Fondo ===== */
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Image.asset(
                                          getImage(species),
                                          height: Dimensions.height120,
                                          color: Colors.white.withOpacity(.3),
                                          colorBlendMode: BlendMode.modulate,
                                        ),
                                      ),
                                      /* ====== IMG PERSONAGES ====== */
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          width: Dimensions.height135,
                                          height: Dimensions.height135,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radius100),
                                          ),
                                          child: Hero(
                                            tag: index,
                                            child: ClipOval(
                                              child: CachedNetworkImage(
                                                imageUrl: img,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      /* ====== Name ===== */
                                      Positioned(
                                        top: Dimensions.height10,
                                        right: Dimensions.width12,
                                        child: Text(
                                          name.toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: Dimensions.font18),
                                        ),
                                      ),
                                      /* ====== Spaces ===== */
                                      Positioned(
                                        top: Dimensions.height40,
                                        left: Dimensions.width12,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(20)),
                                              color:
                                                  Colors.black.withOpacity(.5)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 4,
                                                bottom: 4,
                                                right: 8,
                                                left: 8),
                                            child: Text(
                                              species,
                                              style: TextStyle(
                                                  fontSize: Dimensions.font12,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: Dimensions.height35,
                                        left: Dimensions.width18,
                                        child: Text(
                                          "Saga:",
                                          style: TextStyle(
                                              fontSize: Dimensions.font13),
                                        ),
                                      ),
                                      /* == Saga == */
                                      Positioned(
                                        bottom: Dimensions.height10,
                                        left: Dimensions.width12,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(20)),
                                              color:
                                                  Colors.white.withOpacity(.5)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 4,
                                                bottom: 4,
                                                right: 8,
                                                left: 8),
                                            child: Text(
                                              saga,
                                              style: TextStyle(
                                                  fontSize: Dimensions.font12,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                      /* ====== Id ===== */
                                      DetailDataPersonage(
                                          textinfo: id.toString()),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => PersonagesDetails(
                                      personageDetail: dbzData[index],
                                      color: getColor(species),
                                      indexTag: index,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              : SinConexion(),
        ],
      ),
    );
  }

  /* ================== Get - API ==================== */
  void fetchDadronBallData() async {
    var url = Uri.https(
        "raw.githubusercontent.com",
        "/IngNex/dragonball-api-sagas/master/dragonballz.json",
        {'q': '{http}'});
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var decodedJsonData = jsonDecode(response.body);
      dbzData = decodedJsonData['personages'];
      /*int i = 0;
      while (i < 10) {
        print('${dbzData[i]['name']}');
        i++;
      }*/
      setState(() {});
    }
  }

  /* ============== Obtener Color de species ================ */
  Color getColor(species) {
    Color colorImg = Colors.white;
    if (species == 'Sayajin') {
      colorImg = MaterialColors.orange;
    }
    if (species == 'Humano') {
      colorImg = MaterialColors.blueGreyLighten1;
    }
    if (species == 'Hibrido') {
      colorImg = MaterialColors.blueAccent3;
    }
    if (species == 'Alien') {
      colorImg = MaterialColors.teal;
    }
    if (species == 'Nameku' || species == 'Saibamen') {
      colorImg = MaterialColors.green;
    }
    if (species == 'Freeza') {
      colorImg = MaterialColors.deepPurpleAccent3;
    }
    if (species == 'Androide') {
      colorImg = MaterialColors.cyan;
    }
    if (species == 'Bioandroid') {
      colorImg = MaterialColors.redAccent4;
    }
    if (species == 'Kioshin') {
      colorImg = MaterialColors.lightBlueLighten1;
    }
    if (species == 'Demonio') {
      colorImg = MaterialColors.pinkAccent3;
    }
    if (species == 'Fusion') {
      colorImg = MaterialColors.indigoAccent4;
    }
    if (species == 'Fantasma') {
      colorImg = MaterialColors.lightBlueLighten3;
    }

    return colorImg;
  }

  /* ============== Obtener Color de species ================ */
  String getImage(species) {
    String imgSpecies = 'assets/images/esferas_dark.png';

    if (species == 'Humano' ||
        species == 'Hibrido' ||
        species == 'Sayajin' ||
        species == 'Fusion' ||
        species == 'Nameku' ||
        species == 'Kioshin') {
      imgSpecies = 'assets/images/esferas.png';
    }
    return imgSpecies;
  }
}

/*
 String getImage(species) {
    String imgSpecies = 'assets/images/nave_namek.png';

    if (species == 'Humano' || species == 'Hibrido') {
      imgSpecies = 'assets/images/nave.png';
    }
    if (species == 'Sayajin' || species == 'Saibamen') {
      imgSpecies = 'assets/images/nave_saiyajin.png';
    }
    if (species == 'Freeza' || species == 'Alien') {
      imgSpecies = 'assets/images/navespc_frizer.png';
    }

    return imgSpecies;
  }
*/
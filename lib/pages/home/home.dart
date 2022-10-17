import 'dart:convert';

import 'package:flutter_dragonball/color/MaterialColor.dart';
import 'package:flutter_dragonball/pages/home/components/IdText.dart';
import 'package:flutter_dragonball/pages/home/components/SinConexion.dart';
import 'package:flutter_dragonball/pages/home/components/imgRadar.dart';
import 'package:flutter_dragonball/pages/home/components/imgTitleLogo.dart';
import 'package:flutter_dragonball/pages/personage/personages_details.dart';
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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

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
                  top: 150,
                  bottom: 0,
                  width: width,
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
                                        bottom: -10,
                                        right: -20,
                                        child: Image.asset(
                                          getImage(species),
                                          height: 120,
                                          color: Colors.white.withOpacity(.4),
                                          colorBlendMode: BlendMode.modulate,
                                        ),
                                      ),
                                      /* ====== IMG PERSONAGES ====== */
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          width: 135,
                                          height: 135,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: ClipOval(
                                            child: img.toString().length == null
                                                ? SinConexion()
                                                : CachedNetworkImage(
                                                    imageUrl: img,
                                                    fit: BoxFit.cover,
                                                  ),
                                          ),
                                        ),
                                      ),
                                      /* ====== Name ===== */
                                      Positioned(
                                        top: 10,
                                        right: 12,
                                        child: Text(
                                          name.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                      /* ====== Spaces ===== */
                                      Positioned(
                                        top: 40,
                                        left: 12,
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
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        bottom: 35,
                                        left: 18,
                                        child: Text(
                                          "Saga:",
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 10,
                                        left: 12,
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
                                                  fontSize: 12,
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

    return colorImg;
  }

  /* ============== Obtener Color de species ================ */
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
}

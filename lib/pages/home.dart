import 'dart:convert';
import 'dart:ui';

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
          Positioned(
            top: 30,
            left: 30,
            child: Image.asset(
              'assets/images/logo.png',
              width: 250,
            ),
          ),
          Positioned(
            child: Center(
              child: Image.asset(
                'assets/images/esferasdragon.png',
                width: 400,
              ),
            ),
          ),
          Positioned(
              top: 150,
              bottom: 0,
              width: width,
              child: Column(
                children: [
                  dbzData != null
                      ? Expanded(
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
                                      color: Color.fromARGB(255, 231, 110, 3),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Stack(
                                      children: [
                                        /* ====== Img Fondo ===== */
                                        Positioned(
                                          bottom: -20,
                                          right: -35,
                                          child: Image.asset(
                                            species == 'Humano'
                                                ? 'assets/images/nave.png'
                                                : species == 'Sayajin'
                                                    ? 'assets/images/nave_saiyajin.png'
                                                    : 'assets/images/navespc_frizer.png',
                                            height: 150,
                                            color: Colors.white.withOpacity(.4),
                                            colorBlendMode: BlendMode.modulate,
                                          ),
                                        ),
                                        /* ====== IMG PERSONAGES ====== */
                                        imgPersonages(img),
                                        /* ====== Name ===== */
                                        namePersonages(name),
                                        /* ====== Spaces ===== */
                                        Positioned(
                                          top: 40,
                                          left: 12,
                                          child: moreDataPersonages(species,
                                              Colors.black, Colors.white),
                                        ),
                                        const Positioned(
                                          bottom: 40,
                                          left: 12,
                                          child: Text("Saga:"),
                                        ),
                                        Positioned(
                                          bottom: 10,
                                          left: 12,
                                          child: moreDataPersonages(
                                              saga, Colors.white, Colors.black),
                                        ),
                                        /* ====== Id ===== */
                                        idPersonages(id),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        )
                ],
              ))
        ],
      ),
    );
  }

  Container moreDataPersonages(text, colorText, colorDecor) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: colorDecor.withOpacity(.5)),
      child: Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 4, right: 8, left: 8),
        child: Text(
          text,
          style: TextStyle(fontSize: 12, color: colorText),
        ),
      ),
    );
  }

  Positioned idPersonages(id) {
    return Positioned(
      top: 10,
      left: 12,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.red),
        child: Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 4, right: 8, left: 8),
          child: Text(
            id.toString(),
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Positioned namePersonages(name) {
    return Positioned(
      top: 10,
      right: 12,
      child: Text(
        name.toString(),
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  Positioned imgPersonages(img) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        width: 135,
        height: 135,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: img,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

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
}

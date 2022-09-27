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
                                      crossAxisCount: 2, childAspectRatio: 1.4),
                              itemCount: dbzData.length,
                              itemBuilder: (context, index) {
                                var id = dbzData[index]['id'];
                                var img = dbzData[index]['img'];
                                var name = dbzData[index]['name'];
                                var species = dbzData[index]['species'];
                                return InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            child: Container(
                                              width: 110,
                                              height: 110,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                /*border: Border.all(
                                                    color: Colors.white,
                                                    width: 2)*/
                                              ),
                                              child: ClipOval(
                                                child: CachedNetworkImage(
                                                  imageUrl: img,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 8,
                                            left: 15,
                                            child: Text(
                                              name.toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 35,
                                            left: 15,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                  color: Colors.white),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4,
                                                    bottom: 4,
                                                    right: 8,
                                                    left: 8),
                                                child: Text(
                                                  species,
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 20,
                                            left: 15,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                50)),
                                                    color: Colors.red),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 4,
                                                          bottom: 4,
                                                          right: 8,
                                                          left: 8),
                                                  child: Text(
                                                    id.toString(),
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white),
                                                  ),
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
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

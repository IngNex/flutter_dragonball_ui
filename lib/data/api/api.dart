import 'dart:convert';

import 'package:flutter_dragonball/domain/models/personage/personage_modal.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<List<Personage>> getPersonage(url) async {
    final api = Uri.parse(url);
    var response = await http.get(api);
    var responseData = json.decode(response.body);
    List<Personage> personageData = [];
    for (var index in responseData['personages']) {
      Personage jsonPersonage = Personage(
          id: index['id'],
          name: index['name'],
          img: index['img'],
          species: index['species'],
          gender: index['gender'],
          planet: index['planet'],
          saga: index['saga'],
          height: index['height'],
          weight: index['weight'],
          transformation: index['transformation'],
          state: index['state'],
          power: index['power']);
      personageData.add(jsonPersonage);
    }
    return personageData;
  }
}

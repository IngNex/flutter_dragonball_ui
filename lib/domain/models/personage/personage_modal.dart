// ignore_for_file: public_member_api_docs, sort_constructors_first
class Personage {
  final String id;
  final String name;
  final String img;
  final String species;
  final String gender;
  final String planet;
  final String saga;
  final String height;
  final String weight;
  final String transformation;
  final String state;
  final String power;
  Personage({
    required this.id,
    required this.name,
    required this.img,
    required this.species,
    required this.gender,
    required this.planet,
    required this.saga,
    required this.height,
    required this.weight,
    required this.transformation,
    required this.state,
    required this.power,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['img'] = img;
    map['species'] = species;
    map['gender'] = gender;
    map['planet'] = planet;
    map['saga'] = saga;
    map['height'] = height;
    map['transformation'] = transformation;
    map['state'] = state;
    map['power'] = power;
    return map;
  }
}

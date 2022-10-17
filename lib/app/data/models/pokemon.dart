import 'stats.dart';

class Pokemon {
  int? position;
  String? name;
  String? image;
  String? primaryType;
  String? secondaryType;
  int? baseExperience;
  int? height;
  int? weight;
  int? generation;
  List<Stats>? stats;

  Pokemon({
    this.position,
    this.name,
    this.image,
    this.primaryType,
    this.secondaryType,
    this.baseExperience,
    this.height,
    this.weight,
    this.generation,
    this.stats,
  });

  void setGeneration() {
    if (position! <= 151) {
      generation = 1;
    } else if (position! <= 251) {
      generation = 2;
    } else if (position! <= 385) {
      generation = 3;
    } else if (position! <= 492) {
      generation = 4;
    } else if (position! <= 648) {
      generation = 5;
    } else if (position! <= 720) {
      generation = 6;
    } else if (position! <= 808) {
      generation = 7;
    } else {
      generation = 8;
    }
  }

  Pokemon.fromMapApi(dynamic map) {
    position = map['id'];
    name = map['name'];
    image = map['sprites']['other']['dream_world']['front_default'];
    primaryType = map['types'][0]['type']['name'];
    secondaryType =
        map['types'].length > 1 ? map['types'][1]['type']['name'] : null;
    baseExperience = map['base_experience'];
    height = map['height'];
    weight = map['weight'];
    setGeneration();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['position'] = position;
    data['name'] = name;
    data['image'] = image;
    data['primaryType'] = primaryType;
    data['secondaryType'] = secondaryType;
    data['base_experience'] = baseExperience;
    data['height'] = height;
    data['weight'] = weight;
    data['generation'] = generation;
    data['stats'] =
        stats != null ? stats!.map((v) => v.toJson()).toList() : null;
    return data;
  }
}

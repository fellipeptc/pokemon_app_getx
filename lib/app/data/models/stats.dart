class Stats {
  int? baseStat;
  String? name;

  Stats({this.baseStat, this.name});

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_stat'] = baseStat;
    data['name'] = name;
    return data;
  }
}
class Reciters {
  Reciters({
      this.id, 
      this.name, 
      this.server, 
      this.rewaya, 
      this.count, 
      this.letter, 
      this.suras,});

  Reciters.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    server = json['Server'];
    rewaya = json['rewaya'];
    count = json['count'];
    letter = json['letter'];
    suras = json['suras'];
  }
  String? id;
  String? name;
  String? server;
  String? rewaya;
  String? count;
  String? letter;
  String? suras;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['Server'] = server;
    map['rewaya'] = rewaya;
    map['count'] = count;
    map['letter'] = letter;
    map['suras'] = suras;
    return map;
  }

}
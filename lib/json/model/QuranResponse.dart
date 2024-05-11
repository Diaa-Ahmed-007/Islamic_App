import 'Reciters.dart';

class QuranResponse {
  QuranResponse({
      this.reciters,});

  QuranResponse.fromJson(dynamic json) {
    if (json['reciters'] != null) {
      reciters = [];
      json['reciters'].forEach((v) {
        reciters?.add(Reciters.fromJson(v));
      });
    }
  }
  List<Reciters>? reciters;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (reciters != null) {
      map['reciters'] = reciters?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
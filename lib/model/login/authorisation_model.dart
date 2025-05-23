class Authorisation {
  Authorisation({
    required this.token,
    required this.type,
  });
  late final String token;
  late final String type;

  Authorisation.fromJson(Map<String, dynamic> json){
    token = json['token'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['type'] = type;
    return _data;
  }
}
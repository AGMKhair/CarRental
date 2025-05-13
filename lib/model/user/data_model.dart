import 'package:carrental/model/login/user_model.dart';

class Data {
  Data({
    required this.user,
  });
  late final User user;

  Data.fromJson(Map<String, dynamic> json){
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user.toJson();
    return _data;
  }
}
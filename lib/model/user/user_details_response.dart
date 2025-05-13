import 'package:carrental/model/user/data_model.dart';

class UserDetailsResponse {
  UserDetailsResponse({
    required this.success,
     this.data,
    required this.message,
  });
  late final bool success;
  late final Data? data;
  late final String message;

  UserDetailsResponse.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = Data.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data!.toJson();
    _data['message'] = message;
    return _data;
  }
}


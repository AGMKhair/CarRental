import 'package:tilmaame/model/login/authorisation_model.dart';
import 'package:tilmaame/model/login/user_model.dart';

class LoginResponse {
  LoginResponse({
    required this.status,
    this.user,
    required this.authorisation,
  });
  late final String status;
  late final User? user;
  late final Authorisation? authorisation;
  late final String? message;

  LoginResponse.fromJson(Map<String, dynamic> json){
    message = json['message'];
    status = json['status'];
    // Check if 'user' exists before parsing
    user = json['user'] != null ? User.fromJson(json['user']) : null;

    // Check if 'authorisation' exists before parsing
    authorisation = json['authorisation'] != null
        ? Authorisation.fromJson(json['authorisation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['user'] = user!.toJson();
    _data['authorisation'] = authorisation!.toJson();
    return _data;
  }
}


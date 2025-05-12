class CategoriesResponse {
  CategoriesResponse({
    required this.success,
    required this.data,
    required this.message,
  });
  late final bool success;
  late final List<Data> data;
  late final String message;

  CategoriesResponse.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.slug,
    required this.icon,
    this.details,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String slug;
  late final String icon;
  late final Null details;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
    details = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['icon'] = icon;
    _data['details'] = details;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
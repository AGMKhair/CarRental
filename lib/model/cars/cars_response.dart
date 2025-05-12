class CarsResponse {
  CarsResponse({
    required this.success,
    required this.data,
    required this.message,
  });
  late final bool success;
  late final List<CarsData> data;
  late final String message;

  CarsResponse.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = List.from(json['data']).map((e)=>CarsData.fromJson(e)).toList();
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

class CarsData {
  CarsData({
    required this.id,
    required this.title,
    required this.slug,
    required this.categoryId,
    this.brand,
    required this.image,
    required this.price,
    required this.description,
    required this.features,
    required this.status,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
  });
  late final int id;
  late final String title;
  late final String slug;
  late final int categoryId;
  late final Null brand;
  late final String image;
  late final String price;
  late final String description;
  late final String features;
  late final int status;
  late final Null deletedAt;
  late final String createdAt;
  late final String updatedAt;
  late final Category category;

  CarsData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    categoryId = json['category_id'];
    brand = null;
    image = json['image'];
    price = json['price'];
    description = json['description'];
    features = json['features'];
    status = json['status'];
    deletedAt = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = Category.fromJson(json['category']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['slug'] = slug;
    _data['category_id'] = categoryId;
    _data['brand'] = brand;
    _data['image'] = image;
    _data['price'] = price;
    _data['description'] = description;
    _data['features'] = features;
    _data['status'] = status;
    _data['deleted_at'] = deletedAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['category'] = category.toJson();
    return _data;
  }
}

class Category {
  Category({
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

  Category.fromJson(Map<String, dynamic> json){
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
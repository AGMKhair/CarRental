class User {
  User({
    required this.id,
    required this.name,
    required this.slug,
    required this.type,
    required this.email,
    this.emailVerifiedAt,
    this.image,
    this.designation,
    required this.mobile,
    this.address,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String slug;
  late final String type;
  late final String email;
  late final dynamic emailVerifiedAt;
  late final dynamic image;
  late final dynamic designation;
  late final String mobile;
  late final dynamic address;
  late final int status;
  late final String createdAt;
  late final String updatedAt;

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    type = json['type'];
    email = json['email'];
    emailVerifiedAt = null;
    image = null;
    designation = null;
    mobile = json['mobile'];
    address = null;
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['type'] = type;
    _data['email'] = email;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['image'] = image;
    _data['designation'] = designation;
    _data['mobile'] = mobile;
    _data['address'] = address;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

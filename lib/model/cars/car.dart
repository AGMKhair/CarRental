import 'package:cloud_firestore/cloud_firestore.dart';

class Car {
  final String id;
  final String title;
  final String slug;
  final String categoryId;
  final String? brand;
  final String image;
  final String price;
  final String description;
  final String features;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Car({
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
    required this.createdAt,
    required this.updatedAt,
  });

  factory Car.fromFirestore(Map<String, dynamic> json, String id) {
    return Car(
      id: id,
      title: json['title'],
      slug: json['slug'],
      categoryId: json['category_id'],
      brand: json['brand'],
      image: json['image'],
      price: json['price'],
      description: json['description'],
      features: json['features'],
      status: json['status'],
      createdAt: (json['created_at'] as Timestamp).toDate(),
      updatedAt: (json['updated_at'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'slug': slug,
      'category_id': categoryId,
      'brand': brand,
      'image': image,
      'price': price,
      'description': description,
      'features': features,
      'status': status,
      'created_at': Timestamp.fromDate(createdAt),
      'updated_at': Timestamp.fromDate(updatedAt),
    };
  }
}

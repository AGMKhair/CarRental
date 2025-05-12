class BookingCarsResponse {
  bool? success;
  List<BookingCarsData>? data;
  String? message;

  BookingCarsResponse({this.success, this.data, this.message});

  BookingCarsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <BookingCarsData>[];
      json['data'].forEach((v) {
        data!.add(new BookingCarsData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class BookingCarsData {
  int? id;
  String? orderNumber;
  int? userId;
  int? carId;
  String? phone;
  String? amount;
  String? status;
  String? startDate;
  String? endDate;
  String? note;
  String? createdAt;
  String? updatedAt;
  BookingCars? car;

  BookingCarsData(
      {this.id,
        this.orderNumber,
        this.userId,
        this.carId,
        this.phone,
        this.amount,
        this.status,
        this.startDate,
        this.endDate,
        this.note,
        this.createdAt,
        this.updatedAt,
        this.car});

  BookingCarsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNumber = json['order_number'];
    userId = json['user_id'];
    carId = json['car_id'];
    phone = json['phone'];
    amount = json['amount'];
    status = json['status'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    car = json['car'] != null ? new BookingCars.fromJson(json['car']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_number'] = this.orderNumber;
    data['user_id'] = this.userId;
    data['car_id'] = this.carId;
    data['phone'] = this.phone;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['note'] = this.note;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.car != null) {
      data['car'] = this.car!.toJson();
    }
    return data;
  }
}

class BookingCars {
  int? id;
  String? title;

  BookingCars({this.id, this.title});

  BookingCars.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
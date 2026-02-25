class OrdersResponse {
  final bool? status;
  final List<Order>? scheduledOrders;
  final List<Order>? otherOrders;

  OrdersResponse({this.status, this.scheduledOrders, this.otherOrders});

  factory OrdersResponse.fromJson(Map<String, dynamic> json) {
    return OrdersResponse(
      status: json['status'],
      scheduledOrders: (json['scheduled_orders'] as List?)
          ?.map((e) => Order.fromJson(e))
          .toList(),
      otherOrders: (json['other_orders'] as List?)
          ?.map((e) => Order.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "scheduled_orders": scheduledOrders?.map((e) => e.toJson()).toList(),
    "other_orders": otherOrders?.map((e) => e.toJson()).toList(),
  };
}

class Order {
  final int? id;
  final String? orderId;
  final Address? address;
  final Worker? worker;
  final String? categoryName;
  final List<ServiceItem>? service;
  final bool? isImmediate;
  final bool? isCancellable;
  final String? scheduledDate;
  final String? scheduledTime;
  final String? orderedOn;
  final String? status;
  final String? cancellationReason;
  final int? rating;
  final String? review;
  final String? notes;
  final String? workImage;
  final String? completionImage;
  final num? serviceCharge;
  final num? deliveryCharge;
  final num? gstCharge;
  final num? totalAmount;

  Order({
    this.id,
    this.orderId,
    this.address,
    this.worker,
    this.categoryName,
    this.service,
    this.isImmediate,
    this.isCancellable,
    this.scheduledDate,
    this.scheduledTime,
    this.orderedOn,
    this.status,
    this.cancellationReason,
    this.rating,
    this.review,
    this.notes,
    this.workImage,
    this.completionImage,
    this.serviceCharge,
    this.deliveryCharge,
    this.gstCharge,
    this.totalAmount,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      orderId: json['order_id'],
      address: json['address'] != null
          ? Address.fromJson(json['address'])
          : null,
      worker: json['worker'] != null ? Worker.fromJson(json['worker']) : null,
      categoryName: json['category_name'],
      service: (json['service'] as List?)
          ?.map((e) => ServiceItem.fromJson(e))
          .toList(),
      isImmediate: json['is_immediate'],
      isCancellable: json['is_cancellable'],
      scheduledDate: json['scheduled_date'],
      scheduledTime: json['scheduled_time'],
      orderedOn: json['ordered_on'],
      status: json['status'],
      cancellationReason: json['cancellation_reason'],
      rating: json['rating'],
      review: json['review'],
      notes: json['notes'],
      workImage: json['work_image'],
      completionImage: json['completion_image'],
      serviceCharge: json['service_charge'],
      deliveryCharge: json['delivery_charge'],
      gstCharge: json['GST_charge'],
      totalAmount: json['total_amount'],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "address": address?.toJson(),
    "worker": worker?.toJson(),
    "category_name": categoryName,
    "service": service?.map((e) => e.toJson()).toList(),
    "is_immediate": isImmediate,
    "is_cancellable": isCancellable,
    "scheduled_date": scheduledDate,
    "scheduled_time": scheduledTime,
    "ordered_on": orderedOn,
    "status": status,
    "cancellation_reason": cancellationReason,
    "rating": rating,
    "review": review,
    "notes": notes,
    "work_image": workImage,
    "completion_image": completionImage,
    "service_charge": serviceCharge,
    "delivery_charge": deliveryCharge,
    "GST_charge": gstCharge,
    "total_amount": totalAmount,
  };
}

class Address {
  final String? addressLine1;
  final String? landmark;

  Address({this.addressLine1, this.landmark});

  factory Address.fromJson(Map<String, dynamic> json) =>
      Address(addressLine1: json['address_line1'], landmark: json['landmark']);

  Map<String, dynamic> toJson() => {
    "address_line1": addressLine1,
    "landmark": landmark,
  };
}

class Worker {
  final String? firstName;
  final String? lastName;
  final String? profileImage;
  final int? totalExperiance;

  Worker({
    this.firstName,
    this.lastName,
    this.profileImage,
    this.totalExperiance,
  });

  factory Worker.fromJson(Map<String, dynamic> json) => Worker(
    firstName: json['first_name'],
    lastName: json['last_name'],
    profileImage: json['profile_image'],
    totalExperiance: json['total_experiance'],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "profile_image": profileImage,
    "total_experiance": totalExperiance,
  };
}

class ServiceItem {
  final Service? service;
  final int? quantity;
  final num? rate;

  ServiceItem({this.service, this.quantity, this.rate});

  factory ServiceItem.fromJson(Map<String, dynamic> json) => ServiceItem(
    service: json['service'] != null ? Service.fromJson(json['service']) : null,
    quantity: json['quantity'],
    rate: json['rate'],
  );

  Map<String, dynamic> toJson() => {
    "service": service?.toJson(),
    "quantity": quantity,
    "rate": rate,
  };
}

class Service {
  final String? name;

  Service({this.name});

  factory Service.fromJson(Map<String, dynamic> json) =>
      Service(name: json['name']);

  Map<String, dynamic> toJson() => {"name": name};
}

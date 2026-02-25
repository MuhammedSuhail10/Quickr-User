class ScheduledOrderResponse {
  final bool? status;
  final List<Order>? orders;

  ScheduledOrderResponse({this.status, this.orders});

  factory ScheduledOrderResponse.fromJson(Map<String, dynamic> json) {
    return ScheduledOrderResponse(
      status: json['status'],
      orders: (json['orders'] as List?)?.map((e) => Order.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'orders': orders?.map((e) => e.toJson()).toList(),
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
  final int? serviceCharge;
  final int? deliveryCharge;
  final int? gstCharge;
  final int? totalAmount;

  Order({
    this.id,
    this.orderId,
    this.address,
    this.worker,
    this.categoryName,
    this.service,
    this.isImmediate,
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
      id: (json['id'] as num?)?.toInt(),
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
      scheduledDate: json['scheduled_date'],
      scheduledTime: json['scheduled_time'],
      orderedOn: json['ordered_on'],
      status: json['status'],
      cancellationReason: json['cancellation_reason'],
      rating: (json['rating'] as num?)?.toInt(),
      review: json['review'],
      notes: json['notes'],
      workImage: json['work_image'],
      completionImage: json['completion_image'],
      serviceCharge: (json['service_charge'] as num?)?.toInt(),
      deliveryCharge: (json['delivery_charge'] as num?)?.toInt(),
      gstCharge: (json['GST_charge'] as num?)?.toInt(),
      totalAmount: (json['total_amount'] as num?)?.toInt(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'order_id': orderId,
    'address': address?.toJson(),
    'worker': worker?.toJson(),
    'category_name': categoryName,
    'service': service?.map((e) => e.toJson()).toList(),
    'is_immediate': isImmediate,
    'scheduled_date': scheduledDate,
    'scheduled_time': scheduledTime,
    'ordered_on': orderedOn,
    'status': status,
    'cancellation_reason': cancellationReason,
    'rating': rating,
    'review': review,
    'notes': notes,
    'work_image': workImage,
    'completion_image': completionImage,
    'service_charge': serviceCharge,
    'delivery_charge': deliveryCharge,
    'GST_charge': gstCharge,
    'total_amount': totalAmount,
  };
}

class Address {
  final String? addressLine1;
  final String? landmark;

  Address({this.addressLine1, this.landmark});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      addressLine1: json['address_line1'],
      landmark: json['landmark'],
    );
  }

  Map<String, dynamic> toJson() => {
    'address_line1': addressLine1,
    'landmark': landmark,
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

  factory Worker.fromJson(Map<String, dynamic> json) {
    return Worker(
      firstName: json['first_name'],
      lastName: json['last_name'],
      profileImage: json['profile_image'],
      totalExperiance: (json['total_experiance'] as num?)?.toInt(),
    );
  }

  Map<String, dynamic> toJson() => {
    'first_name': firstName,
    'last_name': lastName,
    'profile_image': profileImage,
    'total_experiance': totalExperiance,
  };
}

class ServiceItem {
  final Service? service;
  final int? quantity;
  final int? rate;

  ServiceItem({this.service, this.quantity, this.rate});

  factory ServiceItem.fromJson(Map<String, dynamic> json) {
    return ServiceItem(
      service: json['service'] != null
          ? Service.fromJson(json['service'])
          : null,
      quantity: (json['quantity'] as num?)?.toInt(),
      rate: (json['rate'] as num?)?.toInt(),
    );
  }

  Map<String, dynamic> toJson() => {
    'service': service?.toJson(),
    'quantity': quantity,
    'rate': rate,
  };
}

class Service {
  final String? name;

  Service({this.name});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(name: json['name']);
  }

  Map<String, dynamic> toJson() => {'name': name};
}

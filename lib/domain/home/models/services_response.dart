class ServiceResponse {
  final bool? status;
  final List<ServiceCategory>? data;

  ServiceResponse({this.status, this.data});

  factory ServiceResponse.fromJson(Map<String, dynamic> json) {
    return ServiceResponse(
      status: json['status'],
      data: json['data'] != null
          ? List<ServiceCategory>.from(
              json['data'].map((x) => ServiceCategory.fromJson(x)),
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'data': data?.map((x) => x.toJson()).toList()};
  }
}

class ServiceCategory {
  final int? subCategoryId;
  final String? subCategoryName;
  final String? subCategoryImage;
  final List<Service>? services;

  ServiceCategory({
    this.subCategoryId,
    this.subCategoryName,
    this.subCategoryImage,
    this.services,
  });

  factory ServiceCategory.fromJson(Map<String, dynamic> json) {
    return ServiceCategory(
      subCategoryId: json['sub_category__id'],
      subCategoryName: json['sub_category__name'],
      subCategoryImage: json['sub_category__image'],
      services: json['services'] != null
          ? List<Service>.from(json['services'].map((x) => Service.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sub_category__id': subCategoryId,
      'sub_category__name': subCategoryName,
      'sub_category__image': subCategoryImage,
      'services': services?.map((x) => x.toJson()).toList(),
    };
  }
}

class Service {
  final int? id;
  final String? name;
  final String? image;
  int quantity;

  Service({this.id, this.name, this.image, this.quantity = 0});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      quantity: 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'image': image, 'quantity': quantity};
  }
}

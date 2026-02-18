class HomeResponse {
  final bool? status;
  final Services? services;
  final List<TopService>? topServices;

  HomeResponse({
    this.status,
    this.services,
    this.topServices,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) {
    return HomeResponse(
      status: json['status'],
      services: json['services'] != null
          ? Services.fromJson(json['services'])
          : null,
      topServices: json['top_services'] != null
          ? List<TopService>.from(
              json['top_services'].map((x) => TopService.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'services': services?.toJson(),
      'top_services': topServices?.map((e) => e.toJson()).toList(),
    };
  }
}

class Services {
  final bool? status;
  final List<Category>? categories;
  final int? lastId;

  Services({
    this.status,
    this.categories,
    this.lastId,
  });

  factory Services.fromJson(Map<String, dynamic> json) {
    return Services(
      status: json['status'],
      categories: json['categories'] != null
          ? List<Category>.from(
              json['categories'].map((x) => Category.fromJson(x)))
          : null,
      lastId: json['last_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'categories': categories?.map((e) => e.toJson()).toList(),
      'last_id': lastId,
    };
  }
}

class Category {
  final int? id;
  final String? name;
  final String? image;

  Category({
    this.id,
    this.name,
    this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}

class TopService {
  final int? id;
  final String? name;
  final String? image;

  TopService({
    this.id,
    this.name,
    this.image,
  });

  factory TopService.fromJson(Map<String, dynamic> json) {
    return TopService(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}

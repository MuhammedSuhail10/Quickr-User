class AllCategoriesResponse {
  final bool status;
  final List<Category> categories;
  final int lastId;

  AllCategoriesResponse({
    required this.status,
    required this.categories,
    required this.lastId,
  });

  factory AllCategoriesResponse.fromJson(Map<String, dynamic> json) {
    return AllCategoriesResponse(
      status: json['status'] ?? false,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e))
              .toList() ??
          [],
      lastId: json['last_id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'categories': categories.map((e) => e.toJson()).toList(),
      'last_id': lastId,
    };
  }
}

class Category {
  final int id;
  final String name;
  final String image;

  Category({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
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

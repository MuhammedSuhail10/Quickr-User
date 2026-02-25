class WorkerDetailsResponse {
  final bool? status;
  final String? firstName;
  final String? lastName;
  final int? age;
  final int? totalExperiance;
  final int? gender;
  final List<String>? images;

  WorkerDetailsResponse({
    this.status,
    this.firstName,
    this.lastName,
    this.age,
    this.totalExperiance,
    this.gender,
    this.images,
  });

  factory WorkerDetailsResponse.fromJson(Map<String, dynamic> json) {
    return WorkerDetailsResponse(
      status: json['status'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      age: json['age'],
      totalExperiance: json['total_experiance'],
      gender: json['gender'],
      images: json['images'] != null
          ? List<String>.from(json['images'])
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'first_name': firstName,
      'last_name': lastName,
      'age': age,
      'total_experiance': totalExperiance,
      'gender': gender,
      'images': images,
    };
  }
}
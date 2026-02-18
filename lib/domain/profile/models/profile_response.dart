class ProfileResponse {
  final bool? status;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? profileImage;
  final bool? emailVerified;

  ProfileResponse({
    this.status,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.profileImage,
    this.emailVerified,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      status: json['status'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneNumber: json['phone_number'],
      profileImage: json['profile_image'],
      emailVerified: json['email_verified'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'profile_image': profileImage,
      'email_verified': emailVerified,
    };
  }
}

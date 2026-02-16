class VerifyResponse {
  final bool status;
  final String? message;
  final String access;
  final String refresh;
  final bool newUser;

  VerifyResponse({
    required this.status,
    this.message,
    required this.access,
    required this.refresh,
    required this.newUser,
  });

  factory VerifyResponse.fromJson(Map<String, dynamic> json) {
    return VerifyResponse(
      status: json['status'] as bool,
      message: json['message'] as String? ?? '',
      access: json['access'] as String,
      refresh: json['refresh'] as String,
      newUser: json['new_user'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'access': access,
      'refresh': refresh,
      'new_user': newUser,
    };
  }
}

class AuthModel {
  String? accessToken;

  AuthModel({this.accessToken});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      accessToken: json['token'] as String?,
    );
  }
}
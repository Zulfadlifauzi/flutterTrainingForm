class LoginResponseModel {
  String? token;
  String? error;
  LoginResponseModel({this.error, this.token});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['token']??'',
      error: json['error']??'',
    );
  }
}

class LoginRequestModel {
  String? email;
  String? name;
  String? password;

  LoginRequestModel({this.email, this.name, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email,
      'name': name,
      'password': password,
    };
    return map;
  }
}

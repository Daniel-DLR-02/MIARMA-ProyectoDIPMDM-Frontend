class LoginResponse {
  LoginResponse({
    required this.email,
    required this.nick,
    required this.avatar,
    required this.role,
    required this.token,
  });
  late final String email;
  late final String nick;
  late final String avatar;
  late final String role;
  late final String token;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    nick = json['nick'];
    avatar = json['avatar'];
    role = json['role'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['nick'] = nick;
    _data['avatar'] = avatar;
    _data['role'] = role;
    _data['token'] = token;
    return _data;
  }
}

class RegisterDto {
  RegisterDto({
    required this.nombre,
    required this.nick,
    required this.email,
    required this.password,
    required this.fechaNacimiento,
    required this.publico,
  });
  late final String nombre;
  late final String nick;
  late final String email;
  late final String password;
  late final String fechaNacimiento;
  late final bool publico;

  RegisterDto.fromJson(Map<String, dynamic> json) {
    nombre = json['nombre'];
    nick = json['nick'];
    email = json['email'];
    password = json['password'];
    fechaNacimiento = json['fechaNacimiento'];
    publico = json['publico'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['nombre'] = nombre;
    _data['nick'] = nick;
    _data['email'] = email;
    _data['password'] = password;
    _data['fechaNacimiento'] = fechaNacimiento;
    _data['publico'] = publico;
    return _data;
  }
}

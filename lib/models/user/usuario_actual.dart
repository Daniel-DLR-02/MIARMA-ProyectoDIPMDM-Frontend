class UsuarioActualResponse {
  UsuarioActualResponse({
    required this.nick,
    required this.nombre,
    required this.fechaDeNacimiento,
    required this.numeroSeguidores,
    required this.numeroSeguidos,
    required this.numeroPublicaciones,
    required this.email,
    required this.avatar,
    required this.perfilPublico,
  });
  late final String nick;
  late final String nombre;
  late final String fechaDeNacimiento;
  late final int numeroSeguidores;
  late final int numeroSeguidos;
  late final int numeroPublicaciones;
  late final String email;
  late final String avatar;
  late final bool perfilPublico;

  UsuarioActualResponse.fromJson(Map<String, dynamic> json) {
    nick = json['nick'];
    nombre = json['nombre'];
    fechaDeNacimiento = json['fechaDeNacimiento'];
    numeroSeguidores = json['numeroSeguidores'];
    numeroSeguidos = json['numeroSeguidos'];
    numeroPublicaciones = json['numeroPublicaciones'];
    email = json['email'];
    avatar = json['avatar'];
    perfilPublico = json['perfilPublico'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['nick'] = nick;
    _data['nombre'] = nombre;
    _data['fechaDeNacimiento'] = fechaDeNacimiento;
    _data['numeroSeguidores'] = numeroSeguidores;
    _data['numeroSeguidos'] = numeroSeguidos;
    _data['numeroPublicaciones'] = numeroPublicaciones;
    _data['email'] = email;
    _data['avatar'] = avatar;
    _data['perfilPublico'] = perfilPublico;
    return _data;
  }
}

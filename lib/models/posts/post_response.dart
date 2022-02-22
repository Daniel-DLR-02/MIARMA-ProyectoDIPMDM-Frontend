class Post {
  int? id;
  String? titulo;
  Usuario? usuario;
  String? texto;
  String? ficheroAdjunto;
  String? ficheroAdjuntoResized;
  bool? publica;

  Post({
    this.id,
    this.titulo,
    this.usuario,
    this.texto,
    this.ficheroAdjunto,
    this.ficheroAdjuntoResized,
    this.publica,
  });

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    titulo = json['titulo'] as String?;
    usuario = (json['usuario'] as Map<String, dynamic>?) != null
        ? Usuario.fromJson(json['usuario'] as Map<String, dynamic>)
        : null;
    texto = json['texto'] as String?;
    ficheroAdjunto = json['ficheroAdjunto'] as String?;
    ficheroAdjuntoResized = json['ficheroAdjuntoResized'] as String?;
    publica = json['publica'] as bool?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['titulo'] = titulo;
    json['usuario'] = usuario?.toJson();
    json['texto'] = texto;
    json['ficheroAdjunto'] = ficheroAdjunto;
    json['ficheroAdjuntoResized'] = ficheroAdjuntoResized;
    json['publica'] = publica;
    return json;
  }
}

class Usuario {
  String? nick;
  String? email;
  String? avatar;
  bool? perfilPublico;

  Usuario({
    this.nick,
    this.email,
    this.avatar,
    this.perfilPublico,
  });

  Usuario.fromJson(Map<String, dynamic> json) {
    nick = json['nick'] as String?;
    email = json['email'] as String?;
    avatar = json['avatar'] as String?;
    perfilPublico = json['perfilPublico'] as bool?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['nick'] = nick;
    json['email'] = email;
    json['avatar'] = avatar;
    json['perfilPublico'] = perfilPublico;
    return json;
  }
}

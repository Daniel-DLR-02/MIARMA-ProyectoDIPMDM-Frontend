class PostDto {
  PostDto({
    required this.titulo,
    required this.texto,
    required this.publica,
  });
  late final String titulo;
  late final String texto;
  late final bool publica;

  PostDto.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    texto = json['texto'];
    publica = json['publica'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['titulo'] = titulo;
    _data['texto'] = texto;
    _data['publica'] = publica;
    return _data;
  }
}

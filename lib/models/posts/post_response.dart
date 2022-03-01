class PostsResponse {
  PostsResponse({
    required this.content,
    required this.pageable,
    required this.last,
    required this.totalPages,
    required this.totalElements,
    required this.size,
    required this.number,
    required this.sort,
    required this.first,
    required this.numberOfElements,
    required this.empty,
  });
  late final List<Post> content;
  late final Pageable pageable;
  late final bool last;
  late final int totalPages;
  late final int totalElements;
  late final int size;
  late final int number;
  late final Sort sort;
  late final bool first;
  late final int numberOfElements;
  late final bool empty;

  PostsResponse.fromJson(Map<String, dynamic> json) {
    content = List.from(json['content']).map((e) => Post.fromJson(e)).toList();
    pageable = Pageable.fromJson(json['pageable']);
    last = json['last'];
    totalPages = json['totalPages'];
    totalElements = json['totalElements'];
    size = json['size'];
    number = json['number'];
    sort = Sort.fromJson(json['sort']);
    first = json['first'];
    numberOfElements = json['numberOfElements'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['content'] = content.map((e) => e.toJson()).toList();
    _data['pageable'] = pageable.toJson();
    _data['last'] = last;
    _data['totalPages'] = totalPages;
    _data['totalElements'] = totalElements;
    _data['size'] = size;
    _data['number'] = number;
    _data['sort'] = sort.toJson();
    _data['first'] = first;
    _data['numberOfElements'] = numberOfElements;
    _data['empty'] = empty;
    return _data;
  }
}

class Post {
  Post({
    required this.id,
    required this.titulo,
    required this.usuario,
    required this.texto,
    required this.ficheroAdjunto,
    required this.ficheroAdjuntoResized,
    required this.publica,
  });
  late final int id;
  late final String titulo;
  late final UsuarioDTO usuario;
  late final String texto;
  late final String ficheroAdjunto;
  late final String ficheroAdjuntoResized;
  late final bool publica;

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    usuario = UsuarioDTO.fromJson(json['usuario']);
    texto = json['texto'];
    ficheroAdjunto = json['ficheroAdjunto'];
    ficheroAdjuntoResized = json['ficheroAdjuntoResized'];
    publica = json['publica'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['titulo'] = titulo;
    _data['usuario'] = usuario.toJson();
    _data['texto'] = texto;
    _data['ficheroAdjunto'] = ficheroAdjunto;
    _data['ficheroAdjuntoResized'] = ficheroAdjuntoResized;
    _data['publica'] = publica;
    return _data;
  }
}

class UsuarioDTO {
  UsuarioDTO({
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

  UsuarioDTO.fromJson(Map<String, dynamic> json) {
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

class Pageable {
  Pageable({
    required this.sort,
    required this.offset,
    required this.pageSize,
    required this.pageNumber,
    required this.unpaged,
    required this.paged,
  });
  late final Sort sort;
  late final int offset;
  late final int pageSize;
  late final int pageNumber;
  late final bool unpaged;
  late final bool paged;

  Pageable.fromJson(Map<String, dynamic> json) {
    sort = Sort.fromJson(json['sort']);
    offset = json['offset'];
    pageSize = json['pageSize'];
    pageNumber = json['pageNumber'];
    unpaged = json['unpaged'];
    paged = json['paged'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sort'] = sort.toJson();
    _data['offset'] = offset;
    _data['pageSize'] = pageSize;
    _data['pageNumber'] = pageNumber;
    _data['unpaged'] = unpaged;
    _data['paged'] = paged;
    return _data;
  }
}

class Sort {
  Sort({
    required this.empty,
    required this.sorted,
    required this.unsorted,
  });
  late final bool empty;
  late final bool sorted;
  late final bool unsorted;

  Sort.fromJson(Map<String, dynamic> json) {
    empty = json['empty'];
    sorted = json['sorted'];
    unsorted = json['unsorted'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['empty'] = empty;
    _data['sorted'] = sorted;
    _data['unsorted'] = unsorted;
    return _data;
  }
}

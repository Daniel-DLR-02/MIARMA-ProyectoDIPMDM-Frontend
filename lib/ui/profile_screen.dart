import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miarma_app/bloc/user/user_bloc.dart';
import 'package:miarma_app/ui/menu_screen.dart';
import 'package:miarma_app/ui/post_form.dart';
import 'package:miarma_app/ui/widgets/error_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/auth/register/register_bloc.dart';
import '../bloc/posts/posts_bloc.dart';
import '../models/posts/post_response.dart';
import '../models/user/usuario_actual.dart';
import '../repository/constants.dart';
import '../repository/preferences_utils.dart';
import '../repository/user/user_repository.dart';
import '../repository/user/user_repository_impl.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserRepository userRepository;
  late String token;

  @override
  void initState() {
    super.initState();
    PreferenceUtils.init();
    userRepository = UserRepositoryImpl();
    token = PreferenceUtils.getString("token")!;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return UserBloc(userRepository)..add(const FetchUser());
        },
        child: _createBody(context));
  }

  _createBody(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserFetchError) {
          return ErrorPage(
            message: state.message,
            retry: () {
              context.watch<UserBloc>();
            },
          );
        } else if (state is UserFetched) {
          return _buildPage(context, state.user, state.posts);
        } else {
          return const Text('Not support');
        }
      },
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _buildPage(
      BuildContext context, UsuarioActualResponse user, List<Post> posts) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 1.0),
                child: Icon(
                    user.perfilPublico
                        ? Icons.lock_open_outlined
                        : Icons.lock_outlined,
                    size: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  user.nick,
                  style: TextStyle(
                      color: Colors.black.withOpacity(.8),
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ),
            ]),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      imageUrl: user.avatar,
                      httpHeaders: {"Authorization": "Bearer " + token},
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 10),
                  child: SizedBox(
                    width: 70,
                    child: Column(
                      children: [
                        Text(
                          user.numeroPublicaciones.toString(),
                          style: TextStyle(
                              color: Colors.black.withOpacity(.8),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          'Publicaciones',
                          style: TextStyle(
                              color: Colors.black.withOpacity(.8),
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.normal,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 75,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0, left: 10),
                    child: Column(
                      children: [
                        Text(
                          user.numeroSeguidores.toString(),
                          style: TextStyle(
                              color: Colors.black.withOpacity(.8),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          'Seguidores',
                          style: TextStyle(
                            color: Colors.black.withOpacity(.8),
                            fontWeight: FontWeight.normal,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0, left: 10),
                    child: Column(
                      children: [
                        Text(
                          user.numeroSeguidos.toString(),
                          style: TextStyle(
                              color: Colors.black.withOpacity(.8),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          'Siguiendo',
                          style: TextStyle(
                              color: Colors.black.withOpacity(.8),
                              fontWeight: FontWeight.normal,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: deviceWidth,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.nombre,
                          style: TextStyle(
                            color: Colors.black.withOpacity(.8),
                            fontWeight: FontWeight.bold,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text("Email: " + user.email,
                            style: TextStyle(
                              color: Colors.black.withOpacity(.8),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                            "Fecha de nacimiento: " + user.fechaDeNacimiento,
                            style: TextStyle(
                              color: Colors.black.withOpacity(.8),
                            )),
                      ),
                    ]),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                alignment: Alignment.center,
                width: deviceWidth - 75,
                height: 35.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(
                    width: 2.0,
                    color: Colors.black,
                  ),
                ),
                child: const Text("Editar Perfil",
                    style: TextStyle(color: Colors.black)),
              ),
              const Icon(Icons.expand_more_outlined, color: Colors.black),
            ]),
            const SizedBox(height: 24.0),
            Divider(
              color: Colors.grey[800],
              thickness: 2.0,
            ),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(
                  width: 150.0,
                  child: Icon(Icons.grid_on_outlined, color: Colors.black),
                ),
              ],
            ),
            Flexible(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 1, horizontal: 1),
                        color: Colors.white,
                        child: CachedNetworkImage(
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          imageUrl: posts
                              .elementAt(index)
                              .ficheroAdjuntoResized
                              .toString()
                              .replaceFirst(
                                  "http://localhost:8080", Constants.baseUrl),
                          httpHeaders: {"Authorization": "Bearer " + token},
                        ));
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}

Widget showPosts(
  List<Post> posts,
) {
  return SizedBox(width: 600, child: Row());
}

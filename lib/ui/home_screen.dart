import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:miarma_app/ui/widgets/error_page.dart';
import 'package:miarma_app/ui/widgets/home_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/posts_bloc.dart';
import '../models/posts/post_response.dart';
import '../repository/PostRepository/post_repository.dart';
import '../repository/PostRepository/post_repository_impl.dart';
import '../repository/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PostRepository postRepository;

  @override
  void initState() {
    super.initState();
    postRepository = PostRepositoryImpl();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return PostsBloc(postRepository)..add(const FetchPost());
      },
      child: Scaffold(body: _createSeePosts(context)),
    );
  }
}

Widget _createSeePosts(BuildContext context) {
  return BlocBuilder<PostsBloc, PostsState>(
    builder: (context, state) {
      if (state is PostsInitial) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is PostFetchError) {
        return ErrorPage(
          message: state.message,
          retry: () {
            context.watch<PostsBloc>().add(const FetchPost());
          },
        );
      } else if (state is PostsFetched) {
        return _createPublicView(context, state.posts);
      } else {
        return const Text('Not support');
      }
    },
  );
}

Widget _createPublicView(BuildContext context, List<Post> posts) {
  final contentWidth = MediaQuery.of(context).size.width;
  final contentHeight = MediaQuery.of(context).size.height;
  return Scaffold(
    appBar: const HomeAppBar(),
    body: ListView(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                'Publicaciones',
                style: TextStyle(
                    color: Colors.black.withOpacity(.8),
                    fontWeight: FontWeight.w600,
                    fontSize: 19),
              ),
            ),
          ],
        ),
        SizedBox(
          height: contentHeight-170,
          width:contentWidth,
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return _createPublicViewItem(context, posts[index]);
            },
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) => VerticalDivider(
              color: Colors.transparent,
              width: contentWidth,
            ),
            itemCount: posts.length,
          ),
        ),
      ],
    ),
  );
}

Widget _createPublicViewItem(BuildContext context, Post post) {
  final contentWidth = MediaQuery.of(context).size.width;
  final contentHeight = MediaQuery.of(context).size.height;
  String imageUrl = post.ficheroAdjuntoResized.replaceAll("http://localhost:8080", Constants.baseUrl);
  String imageUrlAvatar = post.usuario.avatar.replaceAll("http://localhost:8080", Constants.baseUrl);

  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: CachedNetworkImage(
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            
                            imageUrl: imageUrlAvatar,
                            width: 30,
                            height:30,
                            fit: BoxFit.cover,
                          ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    post.usuario.nick,
                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize:15),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              )
            ]),
      ),
      SizedBox(
        width: contentWidth,
        height: contentWidth,
        child: ClipRRect(
          child: CachedNetworkImage(
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            imageUrl: imageUrl,
            width: contentWidth,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

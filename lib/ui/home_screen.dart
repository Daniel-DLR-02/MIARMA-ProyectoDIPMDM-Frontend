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

Widget post(String image, nick, avatar, double sizeImage) {
  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill, image: AssetImage(avatar))),
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    nick,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              )
            ]),
      ),
      SizedBox(
        width: sizeImage,
        height: sizeImage,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(16.0),
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
  double sizeImage = MediaQuery.of(context).size.width;
  return Scaffold(
    appBar: const HomeAppBar(),
    body: ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: Row(
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
        ),
        post('assets/images/landscape.jpg', "Test1", 'assets/images/avatar.jpg',
            sizeImage),
        post('assets/images/landscape2.jpg', "Test2",
            'assets/images/avatar.jpg', sizeImage),
        post('assets/images/landscape.jpg', "Test1", 'assets/images/avatar.jpg',
            sizeImage),
        post('assets/images/landscape2.jpg', "Test2",
            'assets/images/avatar.jpg', sizeImage),
        post('assets/images/landscape.jpg', "Test1", 'assets/images/avatar.jpg',
            sizeImage),
        post('assets/images/landscape2.jpg', "Test2",
            'assets/images/avatar.jpg', sizeImage),
      ],
    ),
  );
}

Widget _createPublicViewItem(BuildContext context, Post post) {
  final width = MediaQuery.of(context).size.width / 2.6;
  return Container(
    width: width,
    height: double.infinity,
    padding: const EdgeInsets.only(bottom: 20.0),
    child: Card(
      elevation: 10.0,
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: SizedBox(
        width: width,
        height: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: CachedNetworkImage(
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            imageUrl: post.ficheroAdjuntoResized,
            width: width,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}

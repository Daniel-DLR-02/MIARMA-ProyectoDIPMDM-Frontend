import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:miarma_app/widgets/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
          post('assets/images/landscape.jpg', "Test1",
              'assets/images/avatar.jpg', sizeImage),
          post('assets/images/landscape2.jpg', "Test2",
              'assets/images/avatar.jpg', sizeImage),
          post('assets/images/landscape.jpg', "Test1",
              'assets/images/avatar.jpg', sizeImage),
          post('assets/images/landscape2.jpg', "Test2",
              'assets/images/avatar.jpg', sizeImage),
          post('assets/images/landscape.jpg', "Test1",
              'assets/images/avatar.jpg', sizeImage),
          post('assets/images/landscape2.jpg', "Test2",
              'assets/images/avatar.jpg', sizeImage),
        ],
      ),
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

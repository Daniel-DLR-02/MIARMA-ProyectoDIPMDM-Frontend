import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getSearch(),
    );
  }

 Widget getSearch() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        SafeArea(
          child: Row(
            children: <Widget>[
              const SizedBox(
                width: 15,
              ),
              Container(
                width: size.width - 30,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black.withOpacity(0.3),
                      )),
                  style: TextStyle(color: Colors.black.withOpacity(0.3)),
                  cursorColor: Colors.black.withOpacity(0.3),
                ),
              ),
              const SizedBox(
                width: 15,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    ));
  }
}


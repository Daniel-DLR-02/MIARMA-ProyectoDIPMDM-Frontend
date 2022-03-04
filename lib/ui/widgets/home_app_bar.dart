import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../post_form.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left: 17.0),
          child: Text(
            'Miarmapp',
            style: GoogleFonts.oleoScript(
              color: Colors.black,
              textStyle: Theme.of(context).textTheme.headline4,
              fontSize: 33,
              fontWeight: FontWeight.w100,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PostForm()),
                      );
                    },
                    icon: const Icon(Icons.add_box_outlined,
                        color: Colors.black, size: 28.0)),
              ),
            ],
          ),
        )
      ]),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

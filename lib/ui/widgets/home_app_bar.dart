import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(Icons.add_box_outlined, size: 30),
                ),
              ],
            ))
      ]),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

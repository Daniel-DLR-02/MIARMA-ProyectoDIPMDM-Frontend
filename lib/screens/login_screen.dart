import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(constraints: BoxConstraints(
            minHeight:MediaQuery.of(context).size.height - 90,
          ),
          child:Center(
            child: Column(
              mainAxisAlignment : MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Miarmapp',
                  style: GoogleFonts.oleoScript(
                    color: Colors.black,
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 40,
                    fontWeight: FontWeight.w100,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                const Divider(
                  height: 20,
                  thickness: .1,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RichText(
                        text: const TextSpan(
                            text: 'Recovery Password \n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.grey,
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: 50,
                    width:deviceWidth,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextButton(
                      child: const Text('Log In',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255))),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                    )),
                Row(
                  children: <Widget>[
                    const Text('Not a member?'),
                    TextButton(
                      child: const Text(
                        'Register now',
                        style: TextStyle(fontSize: 12),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            ),
          ))
        )
      )
    );
  }
}

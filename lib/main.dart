import 'package:flutter/material.dart';
import 'package:miarma_app/screens/login_screen.dart';
import 'package:miarma_app/screens/menu_screen.dart';
import 'package:miarma_app/screens/profile_screen.dart';
import 'package:miarma_app/screens/register_screen.dart';
import 'package:miarma_app/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miarma',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => const MenuScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/search': (context) => const SearchScreen()
      },
    );
  }
}

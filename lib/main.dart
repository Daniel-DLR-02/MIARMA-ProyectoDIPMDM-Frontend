import 'package:flutter/material.dart';
import 'package:miarma_app/repository/preferences_utils.dart';
import 'package:miarma_app/ui/login_screen.dart';
import 'package:miarma_app/ui/menu_screen.dart';
import 'package:miarma_app/ui/profile_screen.dart';
import 'package:miarma_app/ui/register_screen.dart';
import 'package:miarma_app/ui/search_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PreferenceUtils.init();
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

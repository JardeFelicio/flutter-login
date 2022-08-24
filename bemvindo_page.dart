import 'package:complete_app/home_page.dart';
import 'package:complete_app/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BemVindoPage extends StatefulWidget {
  const BemVindoPage({Key? key}) : super(key: key);

  @override
  State<BemVindoPage> createState() => _BemVindoPageState();
}

class _BemVindoPageState extends State<BemVindoPage> {
  @override
  initState() {
    super.initState();
    verificaUsuario().then((temUsuario) => {
          if (temUsuario)
            {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              )
            }
          else
            {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              )
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Bem Vindo'),
      ),
    );
  }

  Future<bool> verificaUsuario() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('Token');
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }
}

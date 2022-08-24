import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                    label: Text('e-mail'), hintText: 'nome@email.com'),
                validator: (email) {
                  if (email == null || email.isEmpty) {
                    return 'digite seu e-mail';
                  }
                  return null;
                },
              ),
              TextFormField(
                  controller: _senhaController,
                  decoration:
                      const InputDecoration(label: Text('Senha'), hintText: ''),
                  validator: (senha) {
                    if (senha == null || senha.isEmpty) {
                      return 'digite sua senha';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  child: const Text('Entrar'))
            ],
          ),
        ),
      )),
    );
  }

  logar() async {
    var url = Uri.parse('https//emanuelseverino.com.br/login');
    var response = await http.post(
      url,
      body: {
        'username': _emailController.text,
        'senha': _senhaController.text,
      },
    );
    // ignore: avoid_print
    print(response.statusCode);
    // ignore: avoid_print
    print(response.body);
  }
}

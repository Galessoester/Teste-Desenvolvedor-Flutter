import 'package:flutter/material.dart';
import 'package:teste_desenvolvedor_flutter/models/politica_de_privacidade.dart';
import 'package:teste_desenvolvedor_flutter/models/white_card.dart';
import 'package:teste_desenvolvedor_flutter/pages/info_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final senhaController = TextEditingController();
  final loginController = TextEditingController();

  bool isLoading = false;
  String? errorMessage;
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1b4d65),
              Color(0xFF29978f),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _buildLogin(),
                        const SizedBox(height: 10),
                        _buildSenha(),
                        const SizedBox(height: 40),
                        _buildBotao(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                  const PoliticaPrivacidade(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildLogin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Usuário',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        WhiteCard(
          child: TextFormField(
            controller: loginController,
            validator: (usuario) {
              if (usuario == null || usuario.isEmpty) {
                return "Por favor, digite o nome do usuário.";
              }
              if (usuario.length > 20) {
                return "O nome do usuário deve ter menos de 20 caracteres.";
              }
              if (usuario.endsWith(' ')) {
                return "O nome do usuário não pode terminar com espaços em branco.";
              }
              return null;
            },
            onChanged: (value) {},
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.person,
                color: Color(0xFF212835),
              ),
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }

  Column _buildSenha() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Senha',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        WhiteCard(
          child: TextFormField(
            controller: senhaController,
            validator: (senha) {
              if (senha == null || senha.isEmpty) {
                return "Por favor, digite sua senha.";
              }
              if (senha.length < 2 || senha.length > 20) {
                return "A senha deve ter mais de 2 e menos de 20 caracteres.";
              }
              if (!isPasswordValid(senha)) {
                return "A senha não deve conter caracteres especiais.";
              }
              if (senha.endsWith(' ')) {
                return "A senha não pode terminar com espaços em branco.";
              }
              return null;
            },
            obscureText: obscureText,
            onChanged: (value) {},
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: obscureText
                    ? const Icon(Icons.visibility_outlined)
                    : const Icon(Icons.visibility_off_outlined),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              ),
              prefixIcon: const Icon(
                Icons.lock,
                color: Color(0xFF212835),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  bool isPasswordValid(String password) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9 ]+$');
    return regex.hasMatch(password);
  }

  SizedBox _buildBotao() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: MaterialButton(
        padding: const EdgeInsets.all(20),
        color: const Color(0xFF40b167),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Align(
          child: isLoading
              ? const CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  strokeWidth: 2,
                )
              : const Text(
                  'Entrar',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
        ),
        onPressed: () async {
          final isValid = _formKey.currentState!.validate();
          if (isValid) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const InfoPage(),
              ),
            );
          }
        },
      ),
    );
  }
}

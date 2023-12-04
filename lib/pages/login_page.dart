import 'package:flutter/material.dart';
import 'package:teste_desenvolvedor_flutter/pages/info_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  String? errorMessage;

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
                  _buildLogin(),
                  const SizedBox(height: 10),
                  _buildSenha(),
                  const SizedBox(height: 10),
                  _buildBotao(),
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
            'Usuário', // Seu rótulo
            style: TextStyle(
              color: Colors.white, // Cor do rótulo
              fontSize: 18, // Tamanho do rótulo
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                spreadRadius: 2,
                blurRadius: 7,
              ),
            ],
          ),
          child: TextField(
            onChanged: (value) {},
            style: const TextStyle(color: Colors.white),
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
            'Senha', // Seu rótulo
            style: TextStyle(
              color: Colors.white, // Cor do rótulo
              fontSize: 18, // Tamanho do rótulo
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                spreadRadius: 2,
                blurRadius: 7,
              ),
            ],
          ),
          child: TextField(
            onChanged: (value) {},
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xFF212835),
              ),
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }

  MaterialButton _buildBotao() {
    return MaterialButton(
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
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => InfoPage(),
          ),
        );
        //}
      },
    );
  }
}

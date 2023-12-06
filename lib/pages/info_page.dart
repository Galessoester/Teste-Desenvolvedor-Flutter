import 'package:flutter/material.dart';
import 'package:teste_desenvolvedor_flutter/models/politica_de_privacidade.dart';
import 'package:teste_desenvolvedor_flutter/models/white_card.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
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
                  WhiteCard(child: _buildCard()),
                  WhiteCard(child: _buildTexto()),
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

  Card _buildCard() {
    return Card(
        //child: ListView(),
        );
  }

  TextFormField _buildTexto() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Digite seu Texto',
        border: InputBorder.none,
      ),
    );
  }
}

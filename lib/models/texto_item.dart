import 'package:flutter/material.dart';

class TextoItem extends StatelessWidget {
  final String texto;

  const TextoItem({super.key, required this.texto});

  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: ListTile(
        trailing: Row(
          mainAxisSize:
              MainAxisSize.min, // Ajusta o tamanho principal para o mínimo
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.cancel,
                color: Colors.red,
              ),
              onPressed: () {},
            ),
          ],
        ),
        title: Text(
          texto,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 17.0,
          ),
        ),
      ),
    );
  }
}

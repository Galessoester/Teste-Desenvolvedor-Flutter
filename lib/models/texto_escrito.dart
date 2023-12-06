import 'package:flutter/material.dart';

class TextoEscrito {
  final String texto;

  const TextoEscrito({required this.texto});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: ListTile(
        leading: const Icon(
          Icons.delete,
          color: Colors.red,
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

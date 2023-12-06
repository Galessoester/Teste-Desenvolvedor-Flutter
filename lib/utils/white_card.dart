import 'package:flutter/material.dart';

class WhiteCard extends StatelessWidget {
  final Widget? child;
  // final IconData icon;

  const WhiteCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            spreadRadius: 2,
            blurRadius: 7,
          ),
        ],
      ),
      child: child,
    );
  }
}

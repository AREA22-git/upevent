import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  final String textData;
  const TextSection({super.key, required this.textData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Text(
        textData.toUpperCase(),
        style: const TextStyle(
            fontSize: 20, color: Colors.white54, fontWeight: FontWeight.w800),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Forecast extends StatelessWidget {
  final IconData iconData;
  final String label;
  final String valul;
  const Forecast({
    super.key,
    required this.iconData,
    required this.label,
    required this.valul,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 5,
            ),
            Icon(iconData),
            const SizedBox(
              height: 8,
            ),
            Text(valul),
          ],
        ),
      ),
    );
  }
}

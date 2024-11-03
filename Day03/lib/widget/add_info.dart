import 'package:flutter/material.dart';

class AddInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const AddInfo(
      {super.key,
      required this.icon,
      required this.label,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Icon(
            icon,
            size: 40,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(value),
        ],
      ),
    );
  }
}

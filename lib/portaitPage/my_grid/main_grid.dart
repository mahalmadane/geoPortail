import 'package:flutter/material.dart';

class MyHomeGrid extends StatelessWidget {
  const MyHomeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}

class GridW extends StatelessWidget {
  final IconData ic;
  final String name;
  const GridW({super.key, required this.ic, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.teal.shade100,
      ),

      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(ic, size: 30, color: Colors.teal),
            Text(
              name,
              style: const TextStyle(color: Colors.black, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Plus extends StatelessWidget {
  const Plus({super.key});

  void alert(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(title: Text("Plus"), content: Text("Plus")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          alert(context);
        },
        label: Text("Plus"),
        icon: Icon(Icons.add),
      ),
    );
  }
}

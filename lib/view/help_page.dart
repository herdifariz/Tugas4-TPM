import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Text("Login terlebih dahulu untuk mengakses menu"),
            ],
          ),
        ),
      ),
    );
  }
}

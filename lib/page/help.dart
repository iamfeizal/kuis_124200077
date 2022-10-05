import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About',
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "\nNama: Imam Agus Faisal\nNIM: 124200077\nPlug: SI-C",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ]),
    );
  }
}

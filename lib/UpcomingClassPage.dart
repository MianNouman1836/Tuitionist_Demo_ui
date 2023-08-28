import 'package:flutter/material.dart';

class UpcomingClassPage extends StatefulWidget {
  const UpcomingClassPage({super.key});

  @override
  State<UpcomingClassPage> createState() => _UpcomingClassPageState();
}

class _UpcomingClassPageState extends State<UpcomingClassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Text(
            "Up Coming Class Page",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

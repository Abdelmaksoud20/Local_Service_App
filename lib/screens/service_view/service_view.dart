import 'package:flutter/material.dart';

class ServiceView extends StatelessWidget {
  const ServiceView({super.key, required this.title, required this.body});
  final String title;
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: body,
      ),
    );
  }
}

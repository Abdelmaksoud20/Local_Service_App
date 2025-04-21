import 'package:flutter/material.dart';
import 'package:graduation_project/screens/get_start_view/get_start_view.dart';
import 'package:graduation_project/screens/register_view/service_provider/service_provider_home.dart';

void main() {
  runApp(
    LocalServicesApp(),);
}

class LocalServicesApp extends StatelessWidget {
  const LocalServicesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: ServiceProviderHome());
  }
}

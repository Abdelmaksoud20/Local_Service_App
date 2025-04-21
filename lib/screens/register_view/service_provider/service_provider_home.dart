import 'package:flutter/material.dart';
import 'package:graduation_project/screens/register_view/service_provider/widgets_service_provider_home/service_provider_body.dart';
import 'package:graduation_project/screens/register_view/service_provider/widgets_service_provider_home/service_provider_home_app_bar.dart';
class ServiceProviderHome extends StatelessWidget {
  const ServiceProviderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Column(
            children: [
              ServiceProviderHomeAppBar(),
              SizedBox(height: 50),
              ServiceProviderHomeBody(),
            ],
          ),
        ),
      ),
    );
  }
}



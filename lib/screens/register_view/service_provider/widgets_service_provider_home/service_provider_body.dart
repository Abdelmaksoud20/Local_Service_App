import 'package:flutter/material.dart';
import 'package:graduation_project/screens/register_view/service_provider/widgets_service_provider_home/widgets_request/custom_request_info.dart';

class ServiceProviderHomeBody extends StatelessWidget {
  const ServiceProviderHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return CustomRequestInfo();
        },
      ),
    );
  }
}
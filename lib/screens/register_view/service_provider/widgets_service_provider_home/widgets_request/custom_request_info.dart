import 'package:flutter/material.dart';
import 'package:graduation_project/screens/register_view/service_provider/widgets_service_provider_home/widgets_request/request_client_name_and_location.dart';
import 'package:graduation_project/screens/register_view/service_provider/widgets_service_provider_home/widgets_request/request_service_name_and_price.dart';

class CustomRequestInfo extends StatelessWidget {
  const CustomRequestInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RequestServiceNameAndPrice(),
          RequestClientNameAndLocation(),
          Divider(height: 40, color: Colors.grey, thickness: 2),
        ],
      ),
    );
  }
}

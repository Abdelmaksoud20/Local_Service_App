import 'package:flutter/material.dart';
import 'package:graduation_project/screens/register_view/service_provider/widgets_service_provider_home/service_provider_home_app_bar.dart';
import 'package:graduation_project/screens/register_view/service_provider/widgets_service_provider_home/widgets_request/custom_request_info.dart';

class ServiceProviderHomeBody extends StatelessWidget {
  const ServiceProviderHomeBody({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 30, bottom: 15, left: 7, right: 7),
          color: Colors.grey.shade200,
          child: ServiceProviderHomeAppBar(name: name),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return CustomRequestInfo();
            },
          ),
        ),
      ],
    );
  }
}

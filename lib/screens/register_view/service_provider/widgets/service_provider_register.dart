import 'package:flutter/material.dart';
import 'package:graduation_project/screens/register_view/service_provider/widgets/service_provider_form.dart';
import 'package:graduation_project/shared_widget.dart/custom_app_body.dart';

class ServiceProviderComponent extends StatelessWidget {
  const ServiceProviderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBody(
      child: SingleChildScrollView(
        child: Column(children: [SizedBox(height: 25), ServiceProviderForm()]),
      ),
    );
  }
}

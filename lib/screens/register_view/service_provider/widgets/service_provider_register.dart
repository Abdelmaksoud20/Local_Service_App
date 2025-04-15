import 'package:flutter/material.dart';
import 'package:graduation_project/screens/register_view/service_provider/widgets/service_provider_form.dart';

class ServiceProviderRegister extends StatelessWidget {
  const ServiceProviderRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 25),
          ServiceProviderForm(),
        ],
      ),
    );
  }
}

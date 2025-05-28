import 'package:flutter/material.dart';
import 'package:graduation_project/screens/register_view/service_provider/widgets/service_provider_register.dart';
import 'package:graduation_project/shared_widget.dart/custom_app_title.dart';

class ServiceProviderPageRegister extends StatelessWidget {
  const ServiceProviderPageRegister({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(), // update
          child: Stack(
            children: [
              CustomAppTitle(title: "Let's Create Creative Work"),
              ServiceProviderComponent(),
            ],
          ),
        ),
      ),
    );
  }
}

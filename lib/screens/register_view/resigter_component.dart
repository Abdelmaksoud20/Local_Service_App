import 'package:flutter/material.dart';
import 'package:graduation_project/screens/register_view/client/client_register.dart';
import 'package:graduation_project/screens/register_view/service_provider/widgets/service_provider_page_register.dart';
import 'package:graduation_project/shared_widget.dart/primary_button.dart';

class RegisterComponent extends StatelessWidget {
  const RegisterComponent({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 120),
        PrimaryButton(
          title: 'Client',
          radius: 40,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => ClientRegister(),
            ));
          },
        ),
        SizedBox(height: 27),
        PrimaryButton(
          title: 'Service Provider',
          radius: 40,
            onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => ServiceProviderPageRegister(),
            ));
          },
        
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:graduation_project/screens/register_view/client/client_form.dart';
import 'package:graduation_project/shared_widget.dart/primary_button.dart';
class ClientRegister extends StatelessWidget {
  const ClientRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        ClientForm(),
        SizedBox(height: 20),
        PrimaryButton(title: 'Register', radius: 15,onPressed: (){
          //!HomePageClient
        },),
        SizedBox(height: 10),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:graduation_project/screens/register_view/client/client_form.dart';

class ClientRegister extends StatelessWidget {
  const ClientRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [SizedBox(height: 20), ClientForm()]);
  }
}

import 'package:flutter/material.dart';
import 'package:graduation_project/screens/register_view/client/client_register.dart';
import 'package:graduation_project/screens/register_view/select_client_or_provider.dart';
import 'package:graduation_project/screens/register_view/service_provider/widgets/service_provider_register.dart';

class RegisterComponent extends StatefulWidget {
  const RegisterComponent({super.key, required this.onSwitch});
final Function(String) onSwitch;
  @override
  State<RegisterComponent> createState() => _RegisterComponentState();
}

class _RegisterComponentState extends State<RegisterComponent> {
  String? selected;
  bool ischeck = true;
  void chekclientOrserviceProider(bool check, String select) {
    setState(() {
      ischeck = check;
      selected = select;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ischeck
        ? SelectClientOrServiceProvider(ischeck: chekclientOrserviceProider,onSwitch: widget.onSwitch,)
        : selected == 'client'
        ? ClientRegister()
        : ServiceProviderRegister();
  }
}

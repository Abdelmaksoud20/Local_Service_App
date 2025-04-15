import 'package:flutter/material.dart';
import 'package:graduation_project/shared_widget.dart/primary_button.dart';

class SelectClientOrServiceProvider extends StatefulWidget {
  const SelectClientOrServiceProvider({
    super.key,
    required this.ischeck,
    required this.onSwitch,
  });
  final Function(bool, String) ischeck;
  final Function(String) onSwitch;
  @override
  State<SelectClientOrServiceProvider> createState() =>
      _CheckClientOrServiceProviderState();
}

class _CheckClientOrServiceProviderState
    extends State<SelectClientOrServiceProvider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 120),
        PrimaryButton(
          title: 'Client',
          radius: 40,
          onPressed: () {
            widget.ischeck(false, 'client');
            widget.onSwitch('client');
            setState(() {});
          },
        ),
        SizedBox(height: 27),
        PrimaryButton(
          title: 'Service Provider',
          radius: 40,
          onPressed: () {
            widget.ischeck(false, 'serviceProvider');
            widget.onSwitch('serviceProvider');
            setState(() {});
          },
        ),
      ],
    );
  }
}

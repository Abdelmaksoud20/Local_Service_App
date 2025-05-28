import 'package:flutter/material.dart';
import 'package:graduation_project/screens/get_start_view/widgets/component_get_start_view.dart';
import 'package:graduation_project/shared_widget.dart/custom_app_title.dart';

class GetStartView extends StatelessWidget {
  const GetStartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            CustomAppTitle(title: 'Service At Your Fingertios'),
            ComponentGetStartView(),
          ],
        ),
      ),
    );
  }
}

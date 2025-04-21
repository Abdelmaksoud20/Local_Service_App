import 'package:flutter/material.dart';
import 'package:graduation_project/helper/colors_app.dart';
import 'package:graduation_project/screens/register_view/service_provider/widgets_service_provider_home/widgets_request/custom_request_button.dart';
import 'package:graduation_project/screens/register_view/service_provider/widgets_service_provider_home/widgets_request/custom_request_client_name_location.dart';

class RequestClientNameAndLocation extends StatelessWidget {
  const RequestClientNameAndLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        spacing: 7,
        children: [
          SizedBox(height: 5),
          CustomRequestClientNameAndLoction(
            text: 'Client : ',
            title: 'Abdelmaksoud',
          ),
          CustomRequestClientNameAndLoction(
            text: 'Location : ',
            title: 'Al-Manakh District',
          ),
          SizedBox(height: 20),
          Row(
            spacing: 25,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomRequestButton(
                buttonTitle: 'Confirm',
                color: ColorsApp.requestServiceProviderColor,
              ),
              CustomRequestButton(buttonTitle: 'Cancel', color: Colors.red),
            ],
          ),
        ],
      ),
    );
  }
}
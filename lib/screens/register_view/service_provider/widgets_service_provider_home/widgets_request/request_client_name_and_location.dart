import 'package:flutter/material.dart';
import 'package:graduation_project/helper/colors_app.dart';
import 'package:graduation_project/screens/register_view/service_provider/widgets_service_provider_home/widgets_request/custom_request_button.dart';
import 'package:graduation_project/screens/register_view/service_provider/widgets_service_provider_home/widgets_request/custom_request_client_name_location.dart';

class RequestClientNameAndLocation extends StatelessWidget {
  const RequestClientNameAndLocation({super.key, this.nameClient, this.area});

  final String? nameClient ;
  final String? area ;
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
            title: nameClient ?? "unKnown client",
          ),
          CustomRequestClientNameAndLoction(
            text: 'Area : ',
            title: area ?? "uunKnown Area",
          ),
          SizedBox(height: 20),
          Row(
            spacing: 25,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomRequestButton(
                onTap: (){},
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
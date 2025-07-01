import 'package:flutter/material.dart';
import 'package:graduation_project/screens/register_view/service_provider/widgets_service_provider_home/widgets_request/request_client_name_and_location.dart';
import 'package:graduation_project/screens/register_view/service_provider/widgets_service_provider_home/widgets_request/request_service_name_and_price.dart';

import '../../../../../models/get_services_model/get_provider_dash_board.dart';

class CustomRequestInfo extends StatelessWidget {
  const CustomRequestInfo({super.key,  this.data, required this.onCancel, required this.onAccept,});
  final ServiceRequests? data ;
  final VoidCallback onCancel;
  final VoidCallback onAccept;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RequestServiceNameAndPrice( serviceName: data?.service, servicePrice: data?.price,),
          RequestClientNameAndLocation(nameClient: data?.name, area: data?.area, requestKey: data?.requestKey, onCancel: onCancel, onAccept: onAccept,  ),
          Divider(
            height: 40,
            color: Colors.grey,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}

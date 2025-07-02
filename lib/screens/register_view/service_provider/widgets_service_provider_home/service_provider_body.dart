import 'package:flutter/material.dart';
import 'package:graduation_project/screens/register_view/service_provider/widgets_service_provider_home/service_provider_home_app_bar.dart';
import 'package:graduation_project/screens/register_view/service_provider/widgets_service_provider_home/widgets_request/custom_request_info.dart';

import '../../../../models/get_services_model/get_provider_dash_board.dart';
import '../../../../services/api_service.dart';
import '../../../../services/get_provider_dashboard_service.dart';
import '../../../home_views/services_view_state.dart';

class ServiceProviderHomeBody extends StatefulWidget {
  const ServiceProviderHomeBody({super.key});

  @override
  State<ServiceProviderHomeBody> createState() =>
      _ServiceProviderHomeBodyState();
}

class _ServiceProviderHomeBodyState extends State<ServiceProviderHomeBody> {
  late GetProviderDashBoard getProviderDashBoard;
  bool isLoading = true;
  Future<void> getData() async {
    ProviderDashBoardService providerDashBoardService =
        ProviderDashBoardService();
    final data = await providerDashBoardService.getProviderDashboard();
    setState(() {
      getProviderDashBoard = data;
      isLoading = false;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, bottom: 15, left: 7, right: 7),
              color: Colors.grey.shade200,
              child: ServiceProviderHomeAppBar(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount:
                 getProviderDashBoard.data?.serviceRequests?.length ,
                //     getProviderDashBoard.data?.serviceRequests
                //         ?.where((request) => request.status == "pending")
                //         .length ??
                //     0,
                itemBuilder: (context, index) {
                  // if(getProviderDashBoard.data?.serviceRequests?[index].status == "accepted"){
                  //   return SizedBox();
                  // }else{
                //  final filteredRequests =
                  //     getProviderDashBoard.data?.serviceRequests
                  //         ?.where((request) => request.status == "pending")
                  //         .toList();
                  //
                  // // Debug print to verify the status
                  // print(
                  //   "${filteredRequests?[index].status}-------------------------++556777",
                  // );

                  //Return the widget for the filtered item
                  return CustomRequestInfo(
                    data: getProviderDashBoard.data?.serviceRequests?[index],
                    onCancel: () {
                      getProviderDashBoard.data?.serviceRequests?.removeAt(
                        index,
                      );
                    },
                    onAccept: () async{
                      final key =
                          getProviderDashBoard
                              .data
                              ?.serviceRequests?[index]
                              .requestKey;
                              print("$key -------//////////////==========--0");
                      ApiService().acceptRequest(key!);
                     Navigator.push(context, MaterialPageRoute(builder: (context) => ServicesProviderViewState(request: getProviderDashBoard.data?.serviceRequests?[index] ) ),);
                    },
                  );

                },
              ),
            ),
          ],
        );
  }
}

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/personal_info_model.dart';
import 'package:graduation_project/screens/home_views/personal_info_widgets/utils/cubit/get_info/personal_info_cubit.dart';
import 'package:graduation_project/screens/register_view/service_provider/widgets_service_provider_home/service_provider_body.dart';
import '../../../helper/colors_app.dart';
import '../../home_views/profile_view.dart';
import '../../home_views/services_view_state.dart';
import '../../home_views/widgets/home_drawer_nav.dart';

class ServiceProviderHome extends StatefulWidget {
  const ServiceProviderHome({super.key, this.id, this.data});
  final int? id;
  final PersonalInfoModel? data;
  @override
  State<ServiceProviderHome> createState() => _ServiceProviderHomeState();
}

class _ServiceProviderHomeState extends State<ServiceProviderHome> {
  late List<Widget> pages;
  bool provider = false;
  int pageNum = 0;
  @override
  void initState() {
    pages = [
      ServiceProviderHomeBody(),
      ServicesViewState(),
      ProfileView(id: widget.id!, check: provider,data: widget.data),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // log(widget.providerData!.name);
    return BlocProvider(
      create:
          (context) => PersonalInfoCubit()..personalInfoMethod(id: widget.id!),
      child: Scaffold(
        body: pages[pageNum],
        bottomNavigationBar: Container(
          clipBehavior: Clip.hardEdge,
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          child: CurvedNavigationBar(
            height: 60,
            maxWidth: MediaQuery.sizeOf(context).width * .9,
            animationDuration: Duration(milliseconds: 400),
            backgroundColor: Color(0xFF1B5E20),
            buttonBackgroundColor: Colors.white,
            color: ColorsApp.primarycolor,
            index: pageNum,
            onTap: (index) {
              setState(() {
                pageNum = index;
              });
            },
            items: [
              Icon(
                Icons.home,
                color: pageNum == 0 ? Colors.black : Colors.white,
              ),Icon(
                Icons.settings_applications_outlined,
                color: pageNum == 1 ? Colors.black : Colors.white,
              ),
              Icon(
                Icons.perm_identity_outlined,
                color: pageNum == 2 ? Colors.black : Colors.white,
              ),
            ],
          ),
        ),
        drawer: HomeDrawerNav(swichMode: "Client Mode"),
      ),
    );
  }
}

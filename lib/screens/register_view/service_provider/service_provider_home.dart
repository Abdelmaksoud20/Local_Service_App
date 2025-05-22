import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/screens/register_view/service_provider/widgets_service_provider_home/service_provider_body.dart';
import '../../../helper/colors_app.dart';
import '../../home_views/profile_view.dart';
import '../../home_views/widgets/home_drawer_nav.dart';
class ServiceProviderHome extends StatefulWidget {
  const ServiceProviderHome({super.key});

  @override
  State<ServiceProviderHome> createState() => _ServiceProviderHomeState();
}

class _ServiceProviderHomeState extends State<ServiceProviderHome> {

  List<Widget> pages = [
    ServiceProviderHomeBody(),
    ProfileView(),
  ];
  int pageNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageNum],
      bottomNavigationBar:Container(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: CurvedNavigationBar(
          height: 60,
          maxWidth: MediaQuery.sizeOf(context).width *.9,
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
            Icon(Icons.home , color: pageNum == 0 ? Colors.black :Colors.white,),
            Icon(Icons.perm_identity_outlined ,color: pageNum == 1 ? Colors.black :Colors.white,),

          ],
        ),
      ),
      drawer: HomeDrawerNav(swichMode: "Client Mode",),
    );
  }
}



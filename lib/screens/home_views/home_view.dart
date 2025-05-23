import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/models/personal_info_model.dart';
import 'package:graduation_project/screens/home_views/profile_view.dart';
import 'package:graduation_project/screens/home_views/services_view.dart';
import 'package:graduation_project/screens/home_views/widgets/home_drawer_nav.dart';
import '../../helper/colors_app.dart';
import 'home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, this.data});
  final PersonalInfoModel? data;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<Widget> pages;
  int pageNum = 0;
  @override
  void initState() {
    pages = [HomeViewBody(
      name: widget.data!.name,
    ), ServicesView(), ProfileView(
      data: widget.data,
      )];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // log('home view name => ${widget.data!.name}');
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: pages[pageNum],
      drawer: HomeDrawerNav(swichMode: "Provider Mode",name: widget.data!.name,),
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
            Icon(Icons.home, color: pageNum == 0 ? Colors.black : Colors.white),
            Icon(
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:graduation_project/screens/home_views/widgets/home_clipper.dart';
import 'package:graduation_project/screens/home_views/widgets/home_service_item.dart';
import 'package:graduation_project/screens/service_view/service_view.dart';
import 'package:graduation_project/screens/service_view/widgets/pages/air.dart';
import 'package:graduation_project/screens/service_view/widgets/pages/carpenter.dart';
import 'package:graduation_project/screens/service_view/widgets/pages/cleaning.dart';
import 'package:graduation_project/screens/service_view/widgets/pages/electrical.dart';
import 'package:graduation_project/screens/service_view/widgets/pages/painter.dart';
import 'package:graduation_project/screens/service_view/widgets/pages/plumber.dart';
import '../../helper/colors_app.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            ClipPath(
              clipper: HomeClip(),
              child: Container(
                // height: size.height * .3,
                height: size.height * .25,
                color: ColorsApp.primarycolor,
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(Icons.menu_rounded, color: Colors.white),
                      ),
                      Spacer(flex: 1),
                      Text(
                        "Al Slam Alycom Mahmoud",
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer(flex: 1),
                    ],
                  ),
                  SizedBox(
                    width: size.width * .83,
                    height: size.height * .05,
                    child: TextField(
                      textAlign: TextAlign.start,
                      cursorColor: ColorsApp.primarycolor,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: buildOutlineInputBorder(Colors.white),
                        focusedBorder: buildOutlineInputBorder(Colors.white),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.search,
                          color: ColorsApp.primarycolor,
                        ),
                        hintText: "what Service you looking for?",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: buildOutlineInputBorder(Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              Text(
                "We Create The Best Service For Your Help ",
                style: TextStyle(
                  fontSize: 22,
                  color: ColorsApp.primarycolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 7),
                decoration: BoxDecoration(
                  color: ColorsApp.primarycolor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Popular Service ",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Wrap(
                  spacing: 15,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServiceView(
                              title: 'Electrical',
                              body: ServiceBodyElectrical(),
                            ),
                          ),
                        );
                      },
                      child: HomeServiceItem(
                        context,
                        size: size,
                        name: "Electrical",
                        image:
                            "assets/images/electrical-electrician-working.json",
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServiceView(
                              title: 'Painter',
                              body: ServiceBodyPainter(),
                            ),
                          ),
                        );
                      },
                      child: HomeServiceItem(
                        context,
                        size: size,
                        name: "Painter",
                        image: "assets/images/color-painting-wall-service.json",
                      ),
                    ),
                    GestureDetector(
                          onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServiceView(
                              title: 'Cleaner',
                              body: ServiceBodyCleaning(),
                            ),
                          ),
                        );
                      },
                      child: HomeServiceItem(
                        context,
                        size: size,
                        name: "Cleaner",
                        image: "assets/images/Animation Cleaner.json",
                      ),
                    ),
                    GestureDetector(
                          onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServiceView(
                              title: 'Plumber',
                              body: ServiceBodyPlumber(),
                            ),
                          ),
                        );
                      },
                      child: HomeServiceItem(
                        context,
                        size: size,
                        name: "Plumber",
                        image: "assets/images/water-pipe-leakage-repair.json",
                      ),
                    ),
                    GestureDetector(
                          onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServiceView(
                              title: 'Carpenter',
                              body: ServiceBodyCarpenter(),
                            ),
                          ),
                        );
                      },
                      child: HomeServiceItem(
                        context,
                        size: size,
                        name: "Carpenter",
                        image: "assets/images/carpenter-worker.json",
                      ),
                    ),
                    GestureDetector(
                          onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServiceView(
                              title: 'AC technical',
                              body: ServiceBodyAir(),
                            ),
                          ),
                        );
                      },
                      child: HomeServiceItem(
                        context,
                        size: size,
                        name: "AC technical",
                        image: "assets/images/AC Installation.json",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  OutlineInputBorder buildOutlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(width: 0, color: color),
    );
  }
}

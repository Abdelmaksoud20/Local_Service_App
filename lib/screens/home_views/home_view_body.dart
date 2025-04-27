
import 'package:flutter/material.dart';
import 'package:graduation_project/screens/home_views/widgets/home_clipper.dart';
import 'package:graduation_project/screens/home_views/widgets/home_service_item.dart';
import 'package:graduation_project/screens/service_view/service_view.dart';
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
                        icon: Icon(
                          Icons.menu_rounded,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Text(
                        "Al Slam Alycom Mahmoud",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      )
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
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 7),
                decoration: BoxDecoration(
                  color: ColorsApp.primarycolor,
                  borderRadius: BorderRadius.circular(12)
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
                child: GestureDetector(
                  onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ServiceView()));},
                  child: Wrap(
                    spacing: 15,
                    children: [
                      HomeServiceItem(context , size: size, name: "Electrical", image: "assets/images/Animation Peinter.json", ),
                      HomeServiceItem(context , size: size, name:"Color man", image: "assets/images/Animation Peinter.json",),
                      HomeServiceItem(context , size: size, name: "Cleaner", image: "assets/images/Animation Cleaner.json", ),
                      HomeServiceItem(context , size: size, name: "Plumber", image: "assets/images/Animation Plumper.json", ),
                      HomeServiceItem(context , size: size, name: "Carpenter", image: "assets/images/Animation Carpenter.json", ),
                      HomeServiceItem(context , size: size, name: "AC technical", image: "assets/images/Peinter2.json", ),

                    ],
                  ),
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




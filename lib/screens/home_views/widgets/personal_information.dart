import 'package:flutter/material.dart';
import 'package:graduation_project/screens/home_views/widgets/profile_body.dart';
import 'package:graduation_project/screens/home_views/widgets/profile_information_title.dart';

import '../../../helper/colors_app.dart';
import '../../../shared_widget.dart/custom_drop_down_list.dart';

class PersonalInformation extends StatelessWidget {
  PersonalInformation({super.key});
  final TextEditingController firstEditingController = TextEditingController();
  final TextEditingController lastEditingController = TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController phoneEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            ProfileInformationTitle(size: size),
            Expanded(
              child: SingleChildScrollView(
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.all(20),
                  children: [
                    const SectionTitle(title: "Personal Information"),
                    const SizedBox(height: 15),
                    InformationItem(
                      textEditingController: firstEditingController,
                      text: "First Name:",
                      info: "Your First Name",
                    ),
                    const SizedBox(height: 25),
                    InformationItem(
                      textEditingController: lastEditingController,
                      text: "Last Name:",
                      info: "Your Last Name",
                    ),
                    const SizedBox(height: 25),
                    InformationItem(
                      textEditingController: emailEditingController,
                      text: "Email:",
                      info: "Your Email",
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        Text("Area:"),
                        const SizedBox(width: 15),
                        Flexible(
                          child: CustomDropdownList(
                            data: [
                              'Al Zohour District',
                              'Al-talatini District',
                              'Al Manakh District',
                              'South District',
                              'East Port Said District',
                              'Al-dowahi District',
                              'West District',
                            ],
                            hintText: 'Your Area',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    InformationItem(
                      textEditingController: phoneEditingController,
                      text: "Phone Number:",
                      info: "Your Phone",
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 3,
                            color: ColorsApp.primarycolor,
                          ),
                        ),
                        child: Text(
                          "Discard Change",
                          style: TextStyle(color: ColorsApp.primarycolor),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          horizontal: 17,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: ColorsApp.primarycolor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 3,
                            color: ColorsApp.primarycolor,
                          ),
                        ),
                        child: Text(
                          "Save Change",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

class InformationItem extends StatelessWidget {
  const InformationItem({
    super.key,
    required this.textEditingController,
    required this.text,
    required this.info,
  });

  final TextEditingController textEditingController;
  final String text;
  final String info;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: TextStyle(fontSize: 16)),
        const SizedBox(width: 6),
        Expanded(
          child: TextField(
            controller: textEditingController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              fillColor: const Color(0xffE8E6E6),
              filled: true,
              hintText: info,
            ),
            cursorColor: Colors.white,
          ),
        ),
      ],
    );
  }
}

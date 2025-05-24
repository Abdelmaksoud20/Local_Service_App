import 'package:flutter/material.dart';
import 'package:graduation_project/helper/colors_app.dart';

class PersonalInformationButtons extends StatelessWidget {
  const PersonalInformationButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
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
    );
  }
}
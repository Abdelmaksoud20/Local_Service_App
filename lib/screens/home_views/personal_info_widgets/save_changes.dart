import 'package:flutter/material.dart';
import 'package:graduation_project/helper/colors_app.dart';

class SaveChangesButton extends StatelessWidget {
  const SaveChangesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
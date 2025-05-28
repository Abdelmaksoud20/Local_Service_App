import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/helper/font_size.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poly(
        color: Color(0xff0D1B2A),
        fontSize: FontSizeApp.fontSize20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

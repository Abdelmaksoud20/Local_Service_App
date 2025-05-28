import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/helper/font_size.dart';

class CustomRequestClientNameAndLoction extends StatelessWidget {
  const CustomRequestClientNameAndLoction({
    super.key,
    required this.text,
    required this.title,
  });
  final String text;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: FontSizeApp.fontSize14,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: FontSizeApp.fontSize13,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

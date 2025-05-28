import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/helper/font_size.dart';

class RequestServiceNameAndPrice extends StatelessWidget {
  const RequestServiceNameAndPrice({super.key, this.serviceName, this.servicePrice});
   final String? serviceName;
   final String? servicePrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ServiceName
        Text(
          serviceName ?? "unKnown Service",
          style: GoogleFonts.poppins(
            fontSize: FontSizeApp.fontSize16,
            fontWeight: FontWeight.w700,
            color: Color(0xff10B981),
          ),
        ),
        Spacer(),
        // ServicePrice
        Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: Color(0xffD9D9D9),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            textAlign: TextAlign.center,
            servicePrice ?? "unKnown price",
            style: GoogleFonts.poppins(
              fontSize: FontSizeApp.fontSize18,
              fontWeight: FontWeight.w700,
              color: Color(0xff10B981),
            ),
          ),
        ),
        // Serviceprice
      ],
    );
  }
}

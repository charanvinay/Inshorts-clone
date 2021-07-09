import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BottonIcons extends StatelessWidget {
  final String svgSrc, text;
  const BottonIcons({
    Key? key,
    required this.svgSrc,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.network(
          svgSrc,
          width: 18,
          height: 18,
          color: Colors.blue,
        ),
        SizedBox(width: 10),
        Text(
          text,
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget {

  final Color? color;
  final int weight;
  final String text;
  final double size;
  final TextOverflow overflow;
  final int fontFamily;

  const BigText({Key? key, this.color=const Color(0xff00c2cb),required this.text,this.overflow=TextOverflow.ellipsis,this.size=20,required this.fontFamily,required this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      overflow: overflow,
      maxLines: 1,
      style: fontFamily==1?
      GoogleFonts.montserrat(
        fontWeight: weight==500? FontWeight.w500 : weight==600? FontWeight.w600 : FontWeight.w400,
        fontSize: size,
        color: color,
      ) :
      fontFamily==2?
      GoogleFonts.poppins(
        fontWeight: weight==500? FontWeight.w500 : weight==600? FontWeight.w600 : FontWeight.w400,
        fontSize: size,
        color: color,
      ) :
      GoogleFonts.roboto(
        fontWeight: weight==500? FontWeight.w500 : weight==600? FontWeight.w600 : FontWeight.w400,
        fontSize: size,
        color: color,
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final int weight;
  final int fontFamily;
  final double size;
  final double height;

  const SmallText({
    Key? key,
    required this.fontFamily,
    this.color = const Color(0xff5A5A5A),
    this.height=1.2,
    required this.weight,
    required this.text,this.size=12}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: fontFamily==1?
      GoogleFonts.montserrat(
      fontWeight: weight==500? FontWeight.w500 : weight==600? FontWeight.w600 : FontWeight.normal,
      fontSize: size,
      color: color,
    ) :
    fontFamily==2?
    GoogleFonts.poppins(

    fontWeight: weight==500? FontWeight.w500 : weight==600? FontWeight.w600 : FontWeight.normal,
    fontSize: size,
    color: color,
    ) :
    GoogleFonts.roboto(

    fontWeight: weight==500? FontWeight.w500 : weight==600? FontWeight.w600 : FontWeight.normal,
    fontSize: size,
    color: color,
    ));
  }
}

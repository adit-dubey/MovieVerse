// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class modified_text extends StatelessWidget {
  final String text;
  final double size;

  const modified_text({Key key, this.text, this.size}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.lobster(fontSize: size));
  }
}

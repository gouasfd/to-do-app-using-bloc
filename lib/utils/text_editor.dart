import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class textedit extends StatelessWidget {
  final texte;
  bool big;
  Color colore;
  bool middle;
  textedit({
    this.middle = false,
    required this.texte,
    this.big = false,
    this.colore = Colors.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(texte,
        style: GoogleFonts.lato(
          fontSize: big
              ? 35
              : middle
                  ? 25
                  : 20,
          fontWeight: big || middle ? FontWeight.bold : FontWeight.normal,
          color: colore,
        ));
  }
}

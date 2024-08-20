import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class NoWeatherView extends StatelessWidget {
  const NoWeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('lib/assets/Animation - 1723916744284.json',
              width: 400, height: 380),
          Text('No Weather Found!\n    Search Now 🧐',
              style: GoogleFonts.aBeeZee(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }
}

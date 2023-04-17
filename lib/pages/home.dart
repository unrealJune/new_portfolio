//HOME widget
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  //get context from main.dart
  final Color color;



  const Home({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    debugPrint("COLOR IS: " +  color.toString());
    return Theme(
      data: ThemeData(
        colorSchemeSeed: color,

      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //for some reason this lil guy is needed to expand column all the way
          Container(
            height: 0.1,
            color: Colors.transparent,),

          AnimatedTextKit(

            animatedTexts: [
              TypewriterAnimatedText(
                'June Philip',
                textStyle: GoogleFonts.jetBrainsMono(
                  textStyle: const TextStyle(
                      fontSize: 64.0,
                      fontWeight: FontWeight.w600
                  ),
                ),
                speed: const Duration(milliseconds: 150),
                textAlign: TextAlign.start,


              ),

            ],
            repeatForever: false,
            isRepeatingAnimation: false,
          ),

          const SizedBox(height: 20.0,),


        ],

      )
    );
  }
}
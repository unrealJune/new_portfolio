//HOME widget
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import '../supportingFiles/ShowUp.dart';

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //for some reason this lil guy is needed to expand column all the way
          Container(
            height: 0.1,
            color: Colors.transparent,),

          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                ShowUp(child: AnimatedTextKit(

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
                ), delay: 200)
              ],
            )
          ),

          const SizedBox(height: 20.0,),

          ShowUp(
            delay: 1000,
            child: Column(
              children: [
                Text("Hey! I'm a student studying at the University of Maryland, College Park, Graduating 2024.",
                  style: GoogleFonts.jetBrainsMono(fontSize: 20.0, fontWeight: FontWeight.w400),),
                Text("I'm studying computer science with a minor in cybersecurity! Here's my portfolio.",
                  style: GoogleFonts.jetBrainsMono(fontSize: 20.0, fontWeight: FontWeight.w400),),

              ],
            ),
          )
          //fade in text





        ],

      )
    );
  }
}
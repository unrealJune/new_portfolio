//HOME widget
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import '../supportingFiles/ShowUp.dart';

class Projects extends StatelessWidget {
  //get context from main.dart
  final Color color;



  const Projects({super.key, required this.color});

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
                          'Projects',
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

            Expanded(
              child: GridView(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,


                ),

                children: [
                  Container(
                    color: Colors.red,

                  ),
                  Container(
                    color: Colors.blue,
                  ),
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.yellow,
                  ),
                  Container(
                    color: Colors.purple,
                  ),
                  Container(
                    color: Colors.orange,
                  ),
                  Container(
                    color: Colors.pink,
                  ),
                  Container(
                    color: Colors.brown,
                  ),
                ],
              ),
            )


          ],

        )
    );
  }
}
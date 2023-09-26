//HOME widget
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import '../supportingFiles/ShowUp.dart';
import 'package:url_launcher/url_launcher.dart';
class Home extends StatelessWidget {
  //get context from main.dart
  final Color color;



  const Home({super.key, required this.color});

  @override
  Widget build(BuildContext context) {

    double titleSize = MediaQuery.of(context).size.width  > 600 ? 64 : 32;
    double subtitleSize = MediaQuery.of(context).size.width  > 600 ? 20 : 12;

    return Theme(
      data: ThemeData(
        colorSchemeSeed: color,

      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //for some reason this lil guy is needed to expand column all the way
          Container(
            height: 0.1,
            color: Colors.transparent,),

        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.75
          ,
          child:  Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Colors.white,
            child:  Stack(
              children: [
                //background image
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        image: const AssetImage('assets/images/build-min.gif'),
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),


               Center(
                 child:  Padding(
                   padding: const EdgeInsets.all(30.0),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       ShowUp(delay: 200, child: AnimatedTextKit(

                         animatedTexts: [
                           TypewriterAnimatedText(
                             'June Philip',
                             textStyle: GoogleFonts.jetBrainsMono(
                               color: Colors.white,
                               textStyle: TextStyle(
                                   fontSize: titleSize,
                                   fontWeight: FontWeight.w600
                               ),
                             ),
                             speed: const Duration(milliseconds: 150),
                             textAlign: TextAlign.center,


                           ),

                         ],
                         repeatForever: false,
                         isRepeatingAnimation: false,
                       )),

                       const SizedBox(height: 20.0,),

                       ShowUp(
                         delay: 1000,
                         child: Column(
                           children: [
                             Text("Hey! I'm a student studying at the University of Maryland, College Park, Graduating 2024.",
                               style: GoogleFonts.jetBrainsMono(color: Colors.white, fontSize: subtitleSize, fontWeight: FontWeight.w400), textAlign: TextAlign.center,),
                             Text("I'm studying computer science with a minor in cybersecurity! Here's my portfolio.",
                               style: GoogleFonts.jetBrainsMono(color: Colors.white, fontSize: subtitleSize, fontWeight: FontWeight.w400), textAlign: TextAlign.center,),

                           ],
                         ),
                       )
                       //fade in text
                     ],
                   ),
                 ),
               )

              ],
            ),
          ),
        ),
          Center(
            child:
            ShowUp(
              delay: 1500,
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  //resume button
                  FilledButton(onPressed: (){
                    _launchUrl(Uri.parse("https://docs.google.com/document/d/1n-n4R1PVXHiHazHO0s1skdxgtIKX8pxj/edit?rtpof=true&sd=true"));
                  }, child: const Text("Resume", style: TextStyle(color: Colors.white),),),
                  FilledButton(onPressed: (){
                    _launchUrl(Uri.parse("https://github.com/unrealJune"));
                  }, child: const Text("Github", style: TextStyle(color: Colors.white),),),
                  FilledButton(onPressed: (){
                    _launchUrl(Uri.parse("mailto:mail.junephilip@gmail.com"));
                  }, child: const Text("Email Me!", style: TextStyle(color: Colors.white),),),
                ],
              ),
            )
          ),





        ],

      )
    );
  }

  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
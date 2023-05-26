//HOME widget
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../supportingFiles/ShowUp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Projects extends StatelessWidget {
  //get context from main.dart
  final Color color;



  const Projects({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
          colorSchemeSeed: color,

        ),
        child: Scrollbar(
          child:  GridView(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,


            ),

            children: [
              ShowUp(
                delay: 150,
                child: Card(
                  color: Theme.of(context).colorScheme.surface,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Column(
                    children: [
                     Text("Projects", style: GoogleFonts.jetBrainsMono(
                       color: Theme.of(context).colorScheme.primary,
                       textStyle: const TextStyle(
                           fontSize: 50.0,
                           fontWeight: FontWeight.w600
                       ),

                  ),
                     ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Some of my projects, from internships to personal projects, they're all here. Click on any of them to learn more.", style: GoogleFonts.jetBrainsMono(
                          color: Theme.of(context).colorScheme.secondary,
                          textStyle: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400
                          ),
                        ),),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("S C R O L L > > >", style: GoogleFonts.jetBrainsMono(
                          color: Theme.of(context).colorScheme.secondary,
                          textStyle: const TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w800
                          ),

                        ),)
                      )
                    ],
                  )
                ),
              ),
              ShowUp(
                delay: 400,
                child: buildCard(context,
                  Image.asset("assets/images/portfolioicon.png", fit: BoxFit.cover,)
                  ,
                    "Portfolio", "2023 - College Park, MD", "The very page that you're on right now! This website is basically practice in implementing Material 3 design for websites, and creating responsive web apps with Flutter 3. It is also my first foray into web deployments, using Github Actions.", [


                 const FlutterLogo(style: FlutterLogoStyle.markOnly,),

                  SizedBox(width: 10,),
                  Icon(FontAwesomeIcons.github,
                    color: Theme.of(context).colorScheme.secondary,

                  ),
                      SizedBox(width: 10,),

                      Icon(FontAwesomeIcons.globe, color: Theme.of(context).colorScheme.secondary,)

                    ]
                ),
              ),
              ShowUp(
                delay: 600,
                child: buildCard(context,
                    Image.asset("assets/images/refinery.jpg", fit: BoxFit.cover,),

                    "Chevron SWE Intern", "Summer 2022 - Houston,TX", "Worked on an agile release train to complete assigned sprint backlogs for an Angular based application with a .NET backend. Notably, worked with an international team in Kazakhstan to localize live production applications to Kazakh and Russian, with i18n compliant code.", [
                      Icon(FontAwesomeIcons.angular,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(width: 10,),
                      Icon(FontAwesomeIcons.js,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(width: 10,),
                      Icon(FontAwesomeIcons.github,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(width: 10,),
                      Icon(FontAwesomeIcons.globe,
                        color: Theme.of(context).colorScheme.secondary,

                      )
                    ]
                ),
              ),
              ShowUp(
                delay: 800,
                child: buildCard(context,
                    Image.asset('assets/images/eva.png', fit: BoxFit.cover,)
                    ,
                    "Evangelion", "2018-22 - Mount Olive,NJ", "Developed turn-key cross platform application (iOS, Android, Web) designed to assist local communities in planning rideshares, organize cultural events, host materials, and communicate. Programmed using Dart and the Flutter framework and utilized Firestore backend. Uses Codemagic to handle CI/CD.", [
                      FlutterLogo(style: FlutterLogoStyle.markOnly,),
                      SizedBox(width: 10,),
                      Icon(FontAwesomeIcons.fireFlameCurved,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(width: 10,),
                      Icon(FontAwesomeIcons.android,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(width: 10,),
                      Icon(FontAwesomeIcons.apple,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ]
                ),
              ),
              ShowUp(
                delay: 1000,
                child: buildCard(context,
                    null
                    ,
                    "SAT Tutor", "2021-23 - Washington,DC", "Professionally taught small, skill level separated groups of high schoolers comprehensive strategies and required knowledge for use on the SAT and ACT. Responsible for communication to parents, students, and inter-departmental organizations.", [
                      FlutterLogo(style: FlutterLogoStyle.markOnly,),
                      SizedBox(width: 10,),
                      Icon(FontAwesomeIcons.graduationCap,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(width: 10,),
                      Icon(FontAwesomeIcons.person,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(width: 10,),
                      Icon(FontAwesomeIcons.calculator,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ]
                ),
              ),
              ShowUp(
                delay: 1200,
                child: buildCard(context,
                    Image.asset("assets/images/fire.webp", fit: BoxFit.cover,)

                    ,
                    "Molecular Research", "2021-23 - College Park, MD", "Worked with the UMD FIRE research program to conduct research into Aptamer selection for the creation of biomarkers for use in point-of-care diagnostics. Analyzed unknown proteins using BLAST and JMOL  to find their purpose and functionality. (ASSN: JZ984658, JZ984659).", [
                      Icon(FontAwesomeIcons.dna,

                        color: Theme.of(context).colorScheme.secondary,

                      ),
                      SizedBox(width: 10,),
                      Icon(FontAwesomeIcons.microscope,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(width: 10,),
                      Icon(FontAwesomeIcons.notesMedical,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ]
                ),
              ),
              ShowUp(
                delay: 1400,
                child:      Card(
                    color: Theme.of(context).colorScheme.surface,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: GestureDetector(
                      onTap: (){
                        //launchURL
                        launchUrlString("https://docs.google.com/document/d/1n-n4R1PVXHiHazHO0s1skdxgtIKX8pxj/edit");
                        
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("<< C L I C K >>", style: GoogleFonts.jetBrainsMono(
                                color: Theme.of(context).colorScheme.secondary,
                                textStyle: const TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w800
                                ),



                              ),
                                textAlign: TextAlign.center,
                              )
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("There's a lot more to see on my resume, take a look here!", style: GoogleFonts.jetBrainsMono(
                              color: Theme.of(context).colorScheme.secondary,
                              textStyle: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400
                              ),
                            ),),
                          ),

                        ],
                      ),
                      
                    )
                ),
              ),

            ],

          ),
        )
    );
  }

  Widget buildCard(BuildContext context, Widget? top, String title, String subtitle, String description, List<Widget> icons){
    Color random1 = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    Color random2 = Colors.primaries[Random().nextInt(Colors.primaries.length)];

    return GestureDetector(
      onTap: (){
        //show dialog
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,

                child: Column(

                  children: [
                    Container(

                        height: MediaQuery.of(context).size.height * 0.45,
                        decoration: top == null ? BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [random1, random2],
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                          ),
                        ) : null,
                        child: top == null ? null : SizedBox.expand(child: top,)

                    ),
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: GoogleFonts.jetBrainsMono(
                                color: Theme.of(context).colorScheme.primary,

                                textStyle: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                            //subtitle

                            //row of icons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  subtitle,
                                  style: GoogleFonts.jetBrainsMono(
                                    color: Theme.of(context).colorScheme.secondary,
                                    textStyle: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: icons,
                            ),
                            SizedBox(height: 20,),

                            Text(description, style: GoogleFonts.jetBrainsMono(
                              color: Theme.of(context).colorScheme.secondary,
                              textStyle: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400
                              ),
                            ),)

                          ],
                        )
                    ),
                  ],
                ),
              );
            });
      },
      child: Card(

        color: Theme.of(context).colorScheme.surfaceVariant,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(

          children: [
            Container(

                height: MediaQuery.of(context).size.height * 0.3,
                decoration: top == null ? BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [random1, random2],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ) : null,
                child: top == null ? null : SizedBox.expand(child: top,)

            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.jetBrainsMono(
                        color: Theme.of(context).colorScheme.primary,

                        textStyle: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    //subtitle

                    //row of icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          subtitle,
                          style: GoogleFonts.jetBrainsMono(
                            color: Theme.of(context).colorScheme.secondary,
                            textStyle: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: icons,
                    ),

                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
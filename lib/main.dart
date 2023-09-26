import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_portfolio/pages/projects.dart';
import '/pages/home.dart';
import 'package:url_launcher/url_launcher.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage("assets/images/build-min.gif"), context);
    precacheImage(const AssetImage("assets/images/c1.jpg"), context);
    precacheImage(const AssetImage("assets/images/eva.png"), context);
    precacheImage(const AssetImage("assets/images/fire.webp"), context);
    precacheImage(const AssetImage("assets/images/portfolioicon.png"), context);
    precacheImage(const AssetImage("assets/images/refinery.jpg"), context);


    return MaterialApp(

      title: 'June Philip',
      themeAnimationCurve: Curves.easeInOut,
      themeAnimationDuration: const Duration(milliseconds: 500),
      theme: ThemeData(
        useMaterial3: true,

      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'June Philip'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAligment = -1.0;
  List<Color> seeds = [
    const Color.fromRGBO(3, 128, 107, 1.0),
    const Color.fromRGBO(188, 0, 74, 1.0),
    const Color.fromRGBO(187, 104, 2, 1.0),
  ];
  bool dark = false;


  @override
  Widget build(BuildContext context) {

    List<Widget> _children = [
      Container(
          key: const ValueKey<int>(0),
          child: Home(color: seeds[_selectedIndex],)
      ),
      Container(
          key: const ValueKey<int>(1),
          child: Projects(color: seeds[_selectedIndex],)
      ),
      Container(
          key: const ValueKey<int>(2),
          child: Home(color: seeds[_selectedIndex],)
      ),
    ];


    return AnimatedTheme(
      data: ThemeData(
        colorSchemeSeed: seeds[_selectedIndex],
        brightness: dark ? Brightness.dark : Brightness.light,
      ),
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 150),

      child: Scaffold(
        body: SafeArea(
          //check if device is too small for rail and switch to bottom nav
          child: MediaQuery.of(context).size.width <  700 ?
          Column(
            children: [
              Expanded(
                child: _children[_selectedIndex],
              ),
              BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.code_rounded),
                    label: 'Projects',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.terminal, size: 15,),
                    label: 'CLI',
                  ),

                ],


                currentIndex: _selectedIndex,
                onTap: (int index) {
                  setState(()  {
                    int oldIndex = _selectedIndex;

                    _selectedIndex = index;
                    if(_selectedIndex == 2) {
                      const url = 'https://cli.junephilip.com/';
                      if ( true) {
                         launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                      _selectedIndex = oldIndex;
                    }

                  });
                },



              )
            ],
          ): Row(
            children: <Widget>[
              NavigationRail(
                selectedIndex: _selectedIndex,
                groupAlignment: groupAligment,
                onDestinationSelected: (int index) {
                  setState(() {
                    int oldIndex = _selectedIndex;
                    _selectedIndex = index;
                    if(_selectedIndex == 2) {
                      const url = 'https://cli.junephilip.com/';
                      if ( true) {
                         launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                      _selectedIndex = oldIndex;
                    }

                  });
                },
                trailing: IconButton(
                  //dark mode toggle
                  icon: Icon(!dark ? Icons.wb_sunny : Icons.nightlight_round),
                  onPressed: () {
                    setState(() {
                      dark = !dark;
                    });
                  },
                ),
                labelType: labelType,
                destinations: const <NavigationRailDestination>[
                  NavigationRailDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.code_outlined),
                    selectedIcon: Icon(Icons.code),
                    label: Text('Projects'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(FontAwesomeIcons.terminal, size: 15,),
                    selectedIcon: Icon(Icons.person),
                    label: Text('CLI'),
                  ),
                ],
              ),
              const VerticalDivider(thickness: 1, width: 0.5, color: Colors.grey,),
              // This is the main content.
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 650),
                  child: _children[_selectedIndex],
                ),
              )
            ],
          ),
        ),

      ),
    );
  }
}

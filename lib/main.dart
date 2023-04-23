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
    return MaterialApp(

      title: 'June Philip',
      theme: ThemeData(
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'June Philip'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
    Color.fromRGBO(3, 128, 107, 1.0),
    Color.fromRGBO(188, 0, 74, 1.0),
    Color.fromRGBO(187, 104, 2, 1.0),
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


    return Theme(
      data: ThemeData(
        colorSchemeSeed: seeds[_selectedIndex],
        brightness: dark ? Brightness.dark : Brightness.light,
      ),
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
                    label: 'Bash',
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
                    label: Text('Bash'),
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

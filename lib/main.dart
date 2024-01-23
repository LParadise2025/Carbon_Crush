import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stem_app/CarbonCounter.dart';
import 'package:stem_app/ThemeData.dart';
import 'package:stem_app/Home.dart';
import 'package:stem_app/logItems.dart';
import 'package:stem_app/Quests.dart';
import 'package:stem_app/resources.dart';
import 'package:stem_app/Stats.dart';
import 'package:stem_app/appState.dart';
// imports all other classes

// this is the main method, it is what is runs when the app is open
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const MyApp(),
      // runs the MyApp() widget
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carbon Crush',
      theme: ThemeClass.getThemeData(),
      // theme data keeps colors and styles consistent throughout the app 
      home: const MyHomePage(title: 'Carbon Crush'),
      debugShowCheckedModeBanner: false,
      // removed the debug banner
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;
  // title is what is displayed in the AppBar, for all classes this is "Carbon Crush"

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int myIndex = 0;
  // list of widgets for the bottom navigation bar 
  List<Widget> widgetList = [
    Home(),
    resources(),
    CarbonCounter(),
    LogItems(),
    Quests(),
    Stats(),
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    loadAppState();
  }

  @override
  void dispose() {
    saveAppState();
    super.dispose();
  }

// loads variables into the app from Shared Preferences 
  Future<void> loadAppState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int savedIndex = prefs.getInt('selectedIndex') ?? 0;
      Provider.of<AppState>(_scaffoldKey.currentContext!, listen: false).loadData();

    setState(() {
      myIndex = savedIndex;
    });
  }

  Future<void> saveAppState() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('selectedIndex', myIndex);
  // saves the index so that it will open to the same page when you reopen the app
  Provider.of<AppState>(_scaffoldKey.currentContext!, listen: false).saveData();
  Provider.of<AppState>(_scaffoldKey.currentContext!, listen: false).notifyListeners();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: IndexedStack(
        children: widgetList,
        index: myIndex,
      ),
      //creates the bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        backgroundColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 7, 93, 5),
        //switches the index to the one the user tapped
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        selectedLabelStyle: const TextStyle(fontSize: 10.0),
        items: 
        // sets the icons and text labels for the bottom navigation bar
        const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_center),
            label: 'Resources',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compost),
            label: 'Carbon Counter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.recycling),
            label: 'Log Items',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.workspace_premium),
            label: 'Quests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Stats',
          ),
        ],
      ),
    );
  }
}

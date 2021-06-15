import 'package:flutter/material.dart';
import 'package:flutter_module/pages/404.dart';
import 'package:flutter_module/pages/home/home_category.dart';
import 'package:flutter_module/pages/home/home_drawer.dart';
import 'package:flutter_module/pages/home/home_index.dart';
import 'package:flutter_module/pages/home/home_project.dart';
import 'package:flutter_module/router.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: AppRouter.routes,
      onGenerateRoute: AppRouter.generateRoute,
      onUnknownRoute: AppRouter.unknownRoute,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onItemsClick(int i) {
    setState(() {
      _currentIndex = i;
    });
  }

  final List<Widget> pages = [
    IndexPage(),
    ProjectPage(),
    CategoryPage(),
  ];

  final List<BottomNavigationBarItem> navigatorItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
    BottomNavigationBarItem(icon: Icon(Icons.work), label: "project"),
    BottomNavigationBarItem(icon: Icon(Icons.whatshot), label: "hot"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              AppRouter.open(context, AppRouter.search);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: HomeDrawerPage()
      ),
      body: pages[_currentIndex],
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {},
//        tooltip: 'back to top',
//        child: Icon(Icons.arrow_upward),
//      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        items: navigatorItems,
        selectedItemColor: Colors.red[400],
        onTap: _onItemsClick,
      ),
    );
  }
}

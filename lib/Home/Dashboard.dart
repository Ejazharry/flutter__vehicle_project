import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_auth_tutor/Home/create_data.dart';
import '../profileScreen.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    CreateData(),
    FirstScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.black,
            primaryColor: Colors.red,
            textTheme: Theme.of(context).textTheme.copyWith(
                caption: new TextStyle(
                    color: Colors
                        .yellow))), // sets the inactive color of the `BottomNavigationBar`
        child: SizedBox(
          height: 60,
          child: BottomNavigationBar(
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.blueGrey,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  title: Text('Home'),
                  // backgroundColor: Colors.green
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text('Profile'),
                ),
              ],
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              iconSize: 25,
              onTap: _onItemTapped,
              elevation: 1),
        ),
      ),
    );
  }
}

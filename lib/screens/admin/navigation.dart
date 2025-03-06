import 'package:diagnotech/screens/admin/date_picker1.dart';
import 'package:flutter/material.dart';
import 'date_picker2.dart';
import '../logout.dart';

class AdminNavigation extends StatefulWidget {
  const AdminNavigation({Key? key}) : super(key: key);

  @override
  State<AdminNavigation> createState() => _AdminNavigationState();
}

class _AdminNavigationState extends State<AdminNavigation> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    DatePicker1(),
    DatePicker2(),
    Logout()
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
    bottomNavigationBar: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.email_outlined, color: Color(0xFF452c63)),
            label: 'Emails',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy_outlined, color: Color(0xFF452c63)),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout_outlined, color: Color(0xFF452c63)),
            label: 'Logout',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF452c63),
        onTap: _onItemTapped,
      ),
    ),
  );
}

}

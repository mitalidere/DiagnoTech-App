import 'package:diagnotech/screens/user/reports.dart';
import 'package:diagnotech/screens/user/select_tests.dart';
import 'package:diagnotech/screens/user/appointments.dart';
import 'package:flutter/material.dart';
import '../logout.dart';

class UserNavigation extends StatefulWidget {
  const UserNavigation({Key? key}) : super(key: key);

  @override
  State<UserNavigation> createState() => _UserNavigationState();
}

class _UserNavigationState extends State<UserNavigation> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    SelectTests(),
    Appointments(),
    Reports(),
    Logout()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
// Widget build(BuildContext context) {
//   return Container(
//     decoration: BoxDecoration(
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.5),
//           spreadRadius: 5,
//           blurRadius: 7,
//           offset: Offset(0, 3), // changes position of shadow
//         ),
//       ],
//     ),
//     child: Scaffold(
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined, color: Colors.black),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.calendar_month_outlined, color: Colors.black),
//             label: 'Appointments',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.file_copy_outlined, color: Colors.black),
//             label: 'Reports',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.logout_outlined, color: Colors.black),
//             label: 'Logout',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.black,
//         onTap: _onItemTapped,
//       ),
//     ),
//   );
// }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
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
              icon: Icon(Icons.home_outlined, color: Color(0xFF452c63)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon:
                  Icon(Icons.calendar_month_outlined, color: Color(0xFF452c63)),
              label: 'Appointments',
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

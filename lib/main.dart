import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:ui_design/ChatPage.dart';
import 'package:ui_design/FeedbackPage.dart';
import 'AttendancePage.dart';
import 'MenuPage.dart';
import 'UpcomingClassPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {

  int _pageIndex = 1;

  final List<Widget> _pages = [
    FeedbackPage(),
    AttendancePage(),
    UpcomingClassPage(),
    ChatPage(),
    MenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_pageIndex],

      bottomNavigationBar: CurvedNavigationBar(
        index: _pageIndex,

        items: [
          CurvedNavigationBarItem(
            child: Icon(Icons.feedback_outlined),
            label: 'Feedback',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.calendar_month_outlined),
            label: 'Attendance',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.chrome_reader_mode_rounded),
            label: 'Up Classes',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],

        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },

        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.greenAccent.shade200,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
      ),

    );
  }
}
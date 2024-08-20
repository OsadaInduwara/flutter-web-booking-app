import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';
import 'admin pages/dashboard.dart';
import 'main pages/about_page.dart';
import 'main pages/contact_page.dart';
import 'main pages/events_page.dart';
import 'main pages/gallery_page.dart';
import 'main pages/services_page.dart';
import 'main pages/testimonials_page.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    AdminHomeContent(),
    AboutPage(),
    EventsPage(),
    ContactPage(),
    GalleryPage(),
    TestimonialsPage(),
    ServicesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomNavigationBarAdmin(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      body: _pages[_selectedIndex],
    );
  }
}

class AdminHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderSection(),
          DashBoard(),
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.0),
      color: Colors.blueAccent,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Admin Panel',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
          SizedBox(height: 2),
        ],
      ),
    );
  }
}


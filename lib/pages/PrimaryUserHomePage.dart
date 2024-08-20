
import 'package:flutter/material.dart';

import '../widgets/footer.dart';
import '../widgets/navigation_bar.dart';
import 'main pages/about_page.dart';
import 'main pages/contact_page.dart';
import 'main pages/events_page.dart';
import 'main pages/gallery_page.dart';
import 'main pages/services_page.dart';
import 'main pages/testimonials_page.dart';



class PrimaryUserHomePage extends StatefulWidget {
  @override
  _PrimaryUserHomePageState createState() => _PrimaryUserHomePageState();
}

class _PrimaryUserHomePageState extends State<PrimaryUserHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
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
      appBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      body: _pages[_selectedIndex],
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderSection(),
          IntroductionSection(),
          Footer(),
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
      padding: EdgeInsets.all(16.0),
      color: Colors.blueAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to Our Event Management Agency',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            'We create memorable experiences for you.',
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class IntroductionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Introduction',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'We are a leading event management agency with years of experience in creating unforgettable events. Our team of professionals ensures that every detail is meticulously planned and executed to perfection.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}


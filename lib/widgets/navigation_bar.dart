import 'package:flutter/material.dart';
import '../auth services/auth_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

abstract class BaseNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BaseNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Event Management Agency'),
      backgroundColor: Colors.blueAccent, // Background color
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return [
      _buildNavItem( 'Home', 0),
      _buildNavItem('About', 1),
      _buildNavItem( 'Events', 2),
      _buildNavItem('Contact', 3),
      if (shouldShowGallery) _buildNavItem('Gallery', 4),
      if (shouldShowTestimonials) _buildNavItem('Testimonials', 5),
      if (shouldShowServices) _buildNavItem('Services', 6),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextButton.icon(
          onPressed: () {
            AuthService().signOut();
            Navigator.pushReplacementNamed(context, '/login');
          },
          icon: const Icon(Icons.logout, color: Colors.white, size: 24.0),
          label: const Text(
            'Logout',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
      ),
    ];
  }

  bool get shouldShowGallery => true;
  bool get shouldShowTestimonials => false;
  bool get shouldShowServices => false;

  Widget _buildNavItem(String label, int index) {
    return TextButton.icon(
      onPressed: () => onItemTapped(index),
      label: Text(
        label,
        style: TextStyle(
          color: selectedIndex == index ? Colors.amber : Colors.white,
          fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomNavigationBar extends BaseNavigationBar {
  const CustomNavigationBar({
    required int selectedIndex,
    required Function(int) onItemTapped,
  }) : super(selectedIndex: selectedIndex, onItemTapped: onItemTapped);

  @override
  bool get shouldShowGallery => true;
  @override
  bool get shouldShowTestimonials => true;
  @override
  bool get shouldShowServices => true;
}

class CustomNavigationBarAdmin extends BaseNavigationBar {
  const CustomNavigationBarAdmin({
    required int selectedIndex,
    required Function(int) onItemTapped,
  }) : super(selectedIndex: selectedIndex, onItemTapped: onItemTapped);

  @override
  bool get shouldShowGallery => false;
  @override
  bool get shouldShowTestimonials => false;
  @override
  bool get shouldShowServices => false;
}

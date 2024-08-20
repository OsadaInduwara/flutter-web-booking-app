import 'package:flutter/material.dart';

import '../auth services/auth_service.dart';


class CustomNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomNavigationBar({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Event Management Agency'),
      actions: [
        _buildNavItem('Home', 0),
        _buildNavItem('About', 1),
        _buildNavItem('Events', 2),
        _buildNavItem('Contact', 3),
        _buildNavItem('Gallery', 4),
        _buildNavItem('Testimonials', 5),
        _buildNavItem('Services', 6),
        TextButton(
          onPressed: () {
            AuthService().signOut();
            Navigator.pushReplacementNamed(context, '/login');
          },
          child: const Text(
            'Logout',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(String label, int index) {
    return TextButton(
      onPressed: () => onItemTapped(index),
      child: Text(
        label,
        style: TextStyle(
          color: selectedIndex == index ? Colors.amber : Colors.black,
          fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

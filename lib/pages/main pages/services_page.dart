import 'package:flutter/material.dart';

import '../../widgets/footer.dart';


class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSection(),
            ServicesList(),
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
            'Our Services',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            'Discover the range of services we offer.',
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class ServicesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ServiceCard(
            title: 'Event Planning',
            description:
            'Our event planning service ensures that every detail is covered, from initial concept to final execution.',
          ),
          ServiceCard(
            title: 'Venue Selection',
            description:
            'We help you find the perfect venue that matches your event’s needs and budget.',
          ),
          ServiceCard(
            title: 'Catering Services',
            description:
            'Our catering services offer a variety of menu options to suit any taste and occasion.',
          ),
          ServiceCard(
            title: 'Entertainment',
            description:
            'We provide top-notch entertainment options to keep your guests engaged and entertained.',
          ),
          // Add more services as needed
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;

  ServiceCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

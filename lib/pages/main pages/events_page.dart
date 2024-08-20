import 'package:flutter/material.dart';

import '../../widgets/footer.dart';


class EventsPage extends StatelessWidget {
  final List<String> events = [
    'Event 1',
    'Event 2',
    'Event 3',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSection(),
            EventsList(events: events),
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
            'Events',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            'Check out our latest events.',
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class EventsList extends StatelessWidget {
  final List<String> events;

  EventsList({required this.events});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: events.map((event) => EventCard(event: event)).toList(),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String event;

  EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          event,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../widgets/footer.dart';


class TestimonialsPage extends StatelessWidget {
  final List<Map<String, String>> testimonials = [
    {'name': 'John Doe', 'feedback': 'Great experience, highly recommended!'},
    {'name': 'Jane Smith', 'feedback': 'Amazing service and wonderful event!'},
    {'name': 'Mike Johnson', 'feedback': 'Professional and seamless planning.'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderSection(),
          TestimonialsList(testimonials: testimonials),
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
            'Testimonials',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            'What our clients say about us.',
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class TestimonialsList extends StatelessWidget {
  final List<Map<String, String>> testimonials;

  TestimonialsList({required this.testimonials});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: testimonials.map((testimonial) => TestimonialCard(testimonial: testimonial)).toList(),
      ),
    );
  }
}

class TestimonialCard extends StatelessWidget {
  final Map<String, String> testimonial;

  TestimonialCard({required this.testimonial});

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
              testimonial['name']!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              testimonial['feedback']!,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

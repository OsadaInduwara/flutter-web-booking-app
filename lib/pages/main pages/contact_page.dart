import 'package:flutter/material.dart';

import '../../widgets/footer.dart';


class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSection(),
            ContactForm(),
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
            'Contact Us',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            'Get in touch with us.',
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class ContactForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Your Name'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Your Email'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Your Message'),
            maxLines: 5,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Handle form submission
            },
            child: Text('Send'),
          ),
        ],
      ),
    );
  }
}

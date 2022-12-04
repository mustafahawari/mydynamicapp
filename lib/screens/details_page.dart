import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailsPage extends StatelessWidget {
  final String details;
  final String imageUrl;
  DetailsPage({
    required this.details,
    required this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.grey,
              child: Image.network(imageUrl),
            ),
            SizedBox(
              height: 30,
            ),
            Html(data: details)
          ],
        ),
      ),
    );
  }
}

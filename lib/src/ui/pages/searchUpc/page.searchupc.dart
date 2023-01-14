import 'package:flutter/material.dart';

class PageSearchUpc extends StatelessWidget {
  const PageSearchUpc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          mapContainer(),
        ],
      ),
    );
  }

  Widget mapContainer() {
    return Container(
      color: Colors.blueAccent,
    );
  }
}

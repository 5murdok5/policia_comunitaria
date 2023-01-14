import 'package:flutter/material.dart';
import 'package:policiacomunitaria/src/theme/theme.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_text.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: text(
              'Policia Comunitaria',
              type: 'title',
              color: Colors.white,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/theme/theme.dart';
import 'package:policiacomunitaria/src/ui/pages/home/comp.home/comp.cont_actions.dart';
import 'package:policiacomunitaria/src/ui/pages/home/comp.home/comp.home_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            const CompHeader(),
            SizedBox(
              height: height * 0.03,
            ),
            Expanded(
              child: CompActionsHome(),
            ),
          ],
        ),
      ),
    );
  }
}

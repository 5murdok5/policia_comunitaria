import 'package:flutter/material.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/theme/theme.dart';

class ArrowBackBtn extends StatelessWidget {
  const ArrowBackBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IconButton(
        icon: const Icon(Icons.keyboard_arrow_left_rounded),
        onPressed: () => back(),
        color: Colors.white,
      ),
    );
  }
}

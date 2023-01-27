import 'package:flutter/material.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/theme/theme.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_text.dart';

class CompHeader extends StatelessWidget {
  final GlobalKey<ScaffoldState> keyscf;
  const CompHeader({super.key, required this.keyscf});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHzApp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text('Bienvenido',
                    type: 'title',
                    color: Colors.white,
                    top: height * 0.04,
                    bottom: height * 0.01),
                text(
                  'Servicio de Alertas de seguridad',
                  type: 'subtitle1',
                  color: Colors.white,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () => keyscf.currentState!.openDrawer(),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Center(
                child: Icon(
                  Icons.menu,
                  color: kprimaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

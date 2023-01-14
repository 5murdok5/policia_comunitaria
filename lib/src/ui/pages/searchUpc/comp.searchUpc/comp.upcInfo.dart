import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/logic/controllers/MapCtrl.dart';
import 'package:policiacomunitaria/src/models/models.upcs.dart';
import 'package:policiacomunitaria/src/theme/theme.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_card.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_text.dart';

class CompUpcsInfo extends StatelessWidget {
  CompUpcsInfo({super.key});
  final MapDtController mapCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.22,
      child: PageView.builder(
        controller: mapCtrl.pagCtrl,
        physics: const BouncingScrollPhysics(),
        itemCount: mapCtrl.listUpcs.length,
        onPageChanged: (value) => mapCtrl.onchangePage(value),
        itemBuilder: (context, index) => cardInfoAddres(
          mapCtrl.listUpcs[index],
          index,
        ),
      ),
    );
  }

  Widget cardInfoAddres(ModelsUpcs upc, index) {
    return Obx(
      () => AnimatedOpacity(
        opacity: mapCtrl.currentPage == index ? 1.0 : 0.2,
        duration: const Duration(
          milliseconds: 400,
        ),
        child: CtCard(
          color: kprimaryColor,
          showShadow: true,
          margin: const EdgeInsets.only(right: 15),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 82, 96, 167),
                  child: Icon(
                    Icons.policy_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    text(upc.nameUpc ?? 'S/N',
                        type: 'subtitle', color: Colors.white, bottom: 4),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 15,
                        ),
                        Expanded(
                          child: text(
                            '${upc.fistStreet}-${upc.secondStreet}-${upc.threeStreet}',
                            left: 5,
                            bottom: 2,
                            maxLines: 2,
                            color: Colors.white,
                            size: 13,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.info,
                          color: Colors.white,
                          size: 15,
                        ),
                        Expanded(
                          child: text(
                            '${upc.reference}',
                            left: 5,
                            bottom: 2,
                            maxLines: 2,
                            color: Colors.white,
                            size: 13,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  text(
                                    'Telef 1: ',
                                    type: 'body1',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                  text(
                                    '09883938999',
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  text(
                                    'Telef 2: ',
                                    type: 'body1',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                  text(
                                    '09883938999',
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.phone,
                            color: kprimaryColor,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

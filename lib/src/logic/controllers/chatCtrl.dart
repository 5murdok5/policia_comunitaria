import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/logic/controllers/appCtrl.dart';
import 'package:policiacomunitaria/src/models/models.message.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_alert.dart';

class ChatController extends GetxController {
  final RxList<MessageModel> _listMessages = <MessageModel>[].obs;
  List<MessageModel> get listMessages => _listMessages;
  set listMessages(List<MessageModel> value) => _listMessages.value = value;
  ScrollController listController = ScrollController();
  late final messageInpCtrl = TextEditingController();
  final time = DateTime.now().millisecondsSinceEpoch;
  @override
  void onInit() {
    sendInitMenssage();

    super.onInit();
  }

  @override
  void onClose() {
    messageInpCtrl.dispose();
    super.onClose();
  }

  sendInitMenssage() {
    final exist = listMessages
        .where((element) => element.type == 'start_message')
        .toList();
    if (exist.isEmpty) {
      Future.delayed(
        const Duration(milliseconds: 1200),
        () => listMessages.add(
          MessageModel(
            dateRecived: DateTime.now().millisecondsSinceEpoch,
            dateSend: DateTime.now().millisecondsSinceEpoch,
            idUser: 'owner',
            message: 'Hola, en que podemos ayudarte?',
            type: 'text',
          ),
        ),
      );
    }
  }

  scrolltoDown() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      listController.animateTo(listController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 1),
          curve: Curves.fastOutSlowIn);
    });
  }

  sendMessage() {
    AppController userCtrl = Get.find();
    listMessages.add(
      MessageModel(
        dateRecived: time,
        dateSend: DateTime.now().millisecondsSinceEpoch,
        idUser: userCtrl.userData!.idUser,
        message: messageInpCtrl.text,
        type: 'string',
      ),
    );
    messageInpCtrl.text = '';
    scrolltoDown();
    Future.delayed(const Duration(seconds: 1), () {
      sendmensajeresponse();
      scrolltoDown();
    });
  }

  sendmensajeresponse() {
    final resp = switchAutomaticsms(listMessages.last.message!.toLowerCase());
    if (resp != '') {
      listMessages.add(
        MessageModel(
          dateRecived: time + 10,
          dateSend: time + 10,
          idUser: 'owner',
          message: resp,
          type: 'text',
        ),
      );
    }
  }

  showAlertExit() {
    showAlert(
      title: '¿Estás seguro de Salir?',
      description:
          'Si sales finalizarás el chat y tu solicitud no será atendida, estás seguro de salir',
      textAcept: 'Si',
      textCancel: 'Esperaré',
      onAcept: () {
        dismisKeybr();
        Get.back();
        Get.delete<ChatController>();
      },
      onCancel: () => Future.value(false),
    );
  }

  String switchAutomaticsms(String text) {
    if (text.contains('ayudar') ||
        text.contains('ayuda') ||
        text.contains('denuncia')) {
      return 'Claro con mucho gusto, detállanos tu denuncia, un encargado responderá a tu mensaje en breve.';
    } else if (text.contains('hola')) {
      return 'Aun seguimos aqui, dinos en que podemos ayudarte!!';
    } else if (text.contains('robo') ||
        text.contains('robado') ||
        text.contains('robar')) {
      return '¿Hace que tiempo ocurrió el robo?';
    } else if (text.contains('asalto')) {
      return '¿Hace que tiempo ocurrió el asalto?';
    } else if (text.contains('ayer')) {
      return '¿En que lugar fué?';
    } else if (text.contains('gracias')) {
      return 'Es un placer atenderte, puedes salir del chat';
    } else if (text.contains('calles') || text.contains('calle')) {
      return 'Correcto hemos guardado tu informacion, tu denuncua se ha guardado con  el numero XXXXXXXXXX, un agente te llamara para culminar el registro de la denuncia';
    } else if (text.contains('medico')) {
      return 'se ha informado al ECU 911 de la emergencia los paramedicos ya estan en camino';
    } else if (text.contains('ahora') ||
        text.contains('hace un momento') ||
        text.contains('momentos') ||
        text.contains('instantes')) {
      return 'Estamos tomando tu ubicación, toma resguardo en un lugar seguro, un agente está en camino al lugar.';
    } else {
      return 'No entiendo tu mensaje';
    }
  }
}

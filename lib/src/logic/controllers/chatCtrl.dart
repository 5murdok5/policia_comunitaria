import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:policiacomunitaria/src/logic/controllers/UserCtrl.dart';
import 'package:policiacomunitaria/src/models/models.message.dart';
import 'package:policiacomunitaria/src/models/models.user.dart';

class ChatController extends GetxController {
  final RxList<MessageModel> _listMessages = <MessageModel>[].obs;
  List<MessageModel> get listMessages => _listMessages;
  set listMessages(List<MessageModel> value) => _listMessages.value = value;

  late final messageInpCtrl = TextEditingController();

  @override
  void onInit() {
    sendInitMenssage();
    super.onInit();
  }

  @override
  void onClose() {
    messageInpCtrl.dispose();
    // TODO: implement onClose
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

  sendMessage() {
    UserController userCtrl = Get.find();
    listMessages.add(
      MessageModel(
        dateRecived: DateTime.now().millisecondsSinceEpoch,
        dateSend: DateTime.now().millisecondsSinceEpoch,
        idUser: userCtrl.userDt.idUser,
        message: messageInpCtrl.text,
        type: 'string',
      ),
    );
    messageInpCtrl.text = '';
    listMessages.sort((a, b) => b.dateSend!.compareTo(a.dateSend!));
  }
}

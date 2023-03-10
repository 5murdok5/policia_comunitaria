import 'dart:convert';

import 'package:policiacomunitaria/src/models/models.user.dart';
import 'package:shared_preferences/shared_preferences.dart';

// UserModel

Future<UserModel> setUserSt(UserModel user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('userCred', user.toJson());
  return user;
}

Future<UserModel?> getUserSt() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? repors = prefs.getString('userCred');
  if (repors != null && repors != '') {
    final resp = json.decode(repors);
    final values = UserModel.fromMap(resp);
    return values;
  }
  return UserModel();
}

Future<void> deleteStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
  return;
}

Future<String> setidEmergenciaSt(String idEmergencia) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('idEmergencia', idEmergencia);
  return idEmergencia;
}

Future<String> getidEmergenciaSt() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? repors = prefs.getString('idEmergencia');
  if (repors != null && repors != '') {
    return repors;
  }
  return '';
}

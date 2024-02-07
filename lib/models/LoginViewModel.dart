import 'package:flutter/material.dart';

import '../ServerLayer/ServerConnector.dart';

Future<bool> loginAction(String code, String tm_number, String store_number) async {
  if (tm_number.characters.length != 8) {
    return false;
  }
  if (store_number.characters.length != 4) {
    return false;
  }
  if (!await validAccessCode(code)) {
    return false;
  }
  return true;
}

void storeInfo(String code, String tm_number, String store_number, String org) {

}
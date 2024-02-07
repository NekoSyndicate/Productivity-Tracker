import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data_layer/DataConnector.dart';
import '../data_layer/ServerConnector.dart';

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

Future<void> storeInfo(String code, String tm_number, String store_number, String org) async {
  DataConnector con = await DataConnector.create();
  await con.setAccessCode(code);
  await con.setTMNumber(tm_number);
  await con.setStoreNumber(store_number);
  await con.setOrganization(org);
  return;
}
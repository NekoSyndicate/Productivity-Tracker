

import 'package:shared_preferences/shared_preferences.dart';

class DataConnector {
  late final SharedPreferences prefs;

  static Future<DataConnector> create() async {
    return DataConnector(await SharedPreferences.getInstance());
  }

  DataConnector(SharedPreferences pre) {
    this. prefs = pre;
  }

  Future<void> setAccessCode(String code) async {
    await prefs.setString("access_code", code);
  }

  Future<String> getAccessCode(String code) async {
    return prefs.getString("access_code") ?? "";
  }

  Future<void> setTMNumber(String tm_number) async {
    await prefs.setString("tm_number", tm_number);
  }

  Future<String> getTMNumber(String tm_number) async {
    return prefs.getString("tm_number") ?? "";
  }

  Future<void> setStoreNumber(String store_number) async {
    await prefs.setString("store_number", store_number);
  }

  Future<String> getStoreNumber(String store_number) async {
    return prefs.getString("store_number") ?? "";
  }

  Future<void> setOrganization(String org) async {
    await prefs.setString("organization", org);
  }

  Future<String> getOrganization(String org) async {
    return prefs.getString("organization") ?? "";
  }


}
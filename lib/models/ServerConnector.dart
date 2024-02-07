import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';

const String API = "http://192.168.1.187:3000";

Future<bool> validAccessCode(String code) async {
  Response res = await http.get(
    Uri.parse(API + "/verify"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': code
    }
  );
  print(res);
  return res.statusCode == 200;
}
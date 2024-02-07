import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';

const String API = "http://157.160.175.38:3000";

Future<bool> validAccessCode(String code) async {
  Response res = await http.get(
    Uri.parse(API + "/verify"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': code
    }
  ).timeout(const Duration(seconds: 1), onTimeout: () {
    return Future<http.Response>.value(
        http.Response("", 404)
    );
  });
  print(res.statusCode);
  return res.statusCode == 200;
}
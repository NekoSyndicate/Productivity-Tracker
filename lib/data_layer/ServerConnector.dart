import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';
import 'package:productivity_tracker/data_layer/DataConnector.dart';

const String API = "http://192.168.1.44:3000";

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

Future<Map<String, dynamic>> schema(String code) async {
  Response res = await http.get(
      Uri.parse(API + "/schema"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': code
      }
  ).timeout(const Duration(seconds: 1), onTimeout: () {
    return Future<http.Response>.value(
        http.Response("", 404)
    );
  });
  return jsonDecode(res.body) as Map<String, dynamic>;
}

Future<void> set(String id, int value) async {
  DataConnector con = await DataConnector.create();
  String access_code = await con.getAccessCode();
  Response res = await http.post(
      Uri.parse("${API}/schema/$id/$value"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': access_code
      }
  ).timeout(const Duration(seconds: 1), onTimeout: () {
    return Future<http.Response>.value(
        http.Response("", 404)
    );
  });
}

Future<dynamic> get(String id) async {
  DataConnector con = await DataConnector.create();
  String access_code = await con.getAccessCode();
  Response res = await http.get(
      Uri.parse("$API/schema/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': access_code
      }
  ).timeout(const Duration(seconds: 1), onTimeout: () {
    return Future<http.Response>.value(
        http.Response("", 404)
    );
  });

  Map<String, dynamic> body = jsonDecode(res.body) as Map<String, dynamic>;

  //print(body['count']);
  return body['count'];
}
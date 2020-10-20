import 'dart:convert';

import 'package:http/http.dart' as http;

class URLS {
  static const String BASE_URL = 'https://reqres.in/';
}
Future loginUser(String email,String password) async
{
  String urls = URLS.BASE_URL + 'api/login';
  final response = await http.post(urls
  headers: {'Aceept': 'Application/json'},
    body:
  );
}
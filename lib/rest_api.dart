import 'dart:convert';

import 'package:http/http.dart' as http;

class URLS {
  static const String BASE_URL = 'https://reqres.in/';
}
Future loginUser(String email,String password) async
{
  String urls = URLS.BASE_URL +  'api/login';
  final response = await http.post(urls,
  headers:{'Accept': 'Application/json'},
  body: {'email': email,'password': password}
  );
  var convertedDataToJson = jsonDecode(response.body);
  return convertedDataToJson;
}
Future Listdash(String email,String password) async
{
  String urls = URLS.BASE_URL +  'api/api/users?page=1';
  final response = await http.post(urls,
      headers:{'Accept': 'Application/json'},
      body: {}
  );
  var convertedDataToJson = jsonDecode(response.body);
  return convertedDataToJson;
}
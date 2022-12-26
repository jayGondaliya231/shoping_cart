import 'dart:convert';

import 'package:http/http.dart' as http;

class SignInService {
  static Future<List<Map<String, dynamic>>> getUsersFromServer() async {
    http.Response response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    List<Map<String, dynamic>> data = List.from(jsonDecode(response.body));
    return data;
  }
}

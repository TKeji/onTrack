import 'dart:convert' as convert;
import './models/user.dart';
import 'package:http/http.dart' show get, Response, post;

// Tunneled endpoints
final String host = 'https://protected-journey-97359.herokuapp.com';
var endpoints = {'register': '/api/auth/register'};

// registerUser(firstname, lastname, password, email) async{
registerUser(NewUser user) async {
  print(user);
  var url = Uri.parse(endpoints['register']);
  // Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/${2+1}'));
  print('endpoints');
  print(url);
  print('posting');
  String jsonUser = convert.jsonEncode(user);
  print(jsonUser);
  print(host + endpoints['register']);
  Response res = await post(
    Uri.parse(host + endpoints['register']),
    headers: {'Content-Type': 'application/json'},
    body: convert.jsonEncode(user),
  );
  // print(json_user);
  print(res.statusCode);
  print(res.body);
}

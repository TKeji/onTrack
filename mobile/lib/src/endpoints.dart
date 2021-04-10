import 'dart:convert' as convert;
import './models/user.dart';
import 'package:http/http.dart' show get, Response, post;

// Tunneled endpoints
// final String host = 'https://protected-journey-97359.herokuapp.com';
final String host = '10.0.2.2:5000';
var endpoints = {'register': '/api/auth/register'};

// registerUser(firstname, lastname, password, email) async{
registerUser(NewUser user) async {
  print('Sending Post Request for New user');
  // Encode User tinto json
  String jsonUser = convert.jsonEncode(user);

  print(host);
  print(endpoints['register']);
  Uri url = Uri.http(host, endpoints['register']);
  print('URL: ' + url.toString());

  Response res = await post(
    // Uri.parse(host + endpoints['register']),
    Uri.http(host, endpoints['register']),
    headers: {'Content-Type': 'application/json'},
    body: convert.jsonEncode(user),
  );
  // print(json_user);
  print(res.statusCode);
  print(res.body);
}

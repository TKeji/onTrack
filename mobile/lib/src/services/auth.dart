import 'dart:convert';
import '../models/user.dart' show User;
import 'package:http/http.dart' show Response, post;
import '../global_data.dart' show globalSessionData, clearSessionData;

// Local on port 5000
final String host = '10.0.2.2:5000';
var endpoints = {
  'register': '/api/auth/register',
  'login': '/api/auth/login',
};

Future<bool> registerUser(User user) async {
  print('Sending Post Request for New user');
  print('User ${user.toJson()}');
  Uri url = Uri.http(host, endpoints['register']);
  Map<String, String> headers = {'Content-Type': 'application/json'};

  Response res = await post(
    url,
    headers: headers,
    body: jsonEncode(user.toJson()),
  );
  final parsedBody = jsonDecode(res.body);
  if (res.statusCode == 200) {
    clearSessionData();
    globalSessionData.userId = int.parse(parsedBody['data']['user_id']);
    globalSessionData.accessToken = parsedBody['data']['access_token'];
    globalSessionData.accessToken = parsedBody['data']['refresh_token'];
    return true;
  } else if (res.statusCode == 400) {
    print(parsedBody['error']);
  } else if (res.statusCode == 401) {
    print(parsedBody['error']);
  }
  print(res.statusCode);
  return false;
}

Future<bool> loginUser(User user) async {
  print('Sending Post Request to Login User');
  print('User ${user.toLoginJson()}');
  Uri url = Uri.http(host, endpoints['login']);
  Map<String, String> headers = {'Content-Type': 'application/json'};

  Response res = await post(
    url,
    headers: headers,
    body: jsonEncode(user.toLoginJson()),
  );
  final parsedBody = jsonDecode(res.body);
  if (res.statusCode == 200) {
    clearSessionData();
    globalSessionData.userId = parsedBody['data']['user_id'];
    globalSessionData.accessToken = parsedBody['data']['access_token'];
    globalSessionData.accessToken = parsedBody['data']['refresh_token'];

    return true;
  } else if (res.statusCode == 401) {
    print(parsedBody['error']);
  }
  print(res.statusCode);
  return false;
}

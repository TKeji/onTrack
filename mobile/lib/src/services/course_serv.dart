import 'dart:convert';
import '../models/course.dart' show Course;
import 'package:http/http.dart' show Response, get, post;
import '../global_data.dart'
    show host, endpoints, generateAddCourseURL, generateGetUserCoursesURL;

Future<List<Course>> fetchAllCourses({int user_id}) async {
  // Make get request
  print('Getting all courses');
  Uri url = Uri.http(host, endpoints['get-courses']);
  Map<String, String> headers = {'Content-Type': 'application/json'};

  Response res = await get(
    url,
    headers: headers,
  );
  final parsedBody = jsonDecode(res.body);
  print(res.statusCode);
  // print(parsedBody);
  print(res.statusCode);
  if (res.statusCode == 200) {
    // Deserialize & send
    return List<Course>.from(parsedBody['data']
        .map((course_model) => Course.fromJson(course_model)));
  }

  return [];
}

Future addCourse({int userId, String courseCode}) async {
  print('Adding a course $courseCode to $userId');
  Uri url = Uri.http(host, generateAddCourseURL(userId, courseCode));

  Map<String, String> headers = {'Content-Type': 'application/json'};

  Response res = await post(
    url,
    headers: headers,
  );

  final parsedBody = jsonDecode(res.body);
  print(res.statusCode);
  print(parsedBody);

  if (res.statusCode == 200) {
    print('Added course to user');
    return true;
  }
  print('Failed to add course to user');
  return false;
}

Future<List<Course>> getUserCourses(int userId) async {
  print('Get courses for $userId');
  Uri url = Uri.http(host, generateGetUserCoursesURL(userId));

  Map<String, String> headers = {'Content-Type': 'application/json'};

  Response res = await get(
    url,
    headers: headers,
  );

  final parsedBody = jsonDecode(res.body);
  print(res.statusCode);
  if (res.statusCode == 200) {
    print('printing body');
    print(parsedBody['data']);
    return List<Course>.from(
        parsedBody['data'].map((courseModel) => Course.fromJson(courseModel)));
  }
  return [];
}

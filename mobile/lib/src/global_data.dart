class SessionData {
  String accessToken;
  String refreshToken;
  int userId;
}

SessionData globalSessionData;

//Having a clear function is pretty handy
void clearSessionData() {
  globalSessionData = new SessionData();
}

final String host = '10.0.2.2:5000';
var endpoints = {
  'register': '/api/auth/register',
  'login': '/api/auth/login',
  'get-courses': '/api/courses',
  'add-course': generateAddCourseURL,
};

String generateAddCourseURL(userId, courseCode) {
  return '/api/users/$userId/courses/$courseCode';
}

String generateGetUserCoursesURL(userId) {
  return '/api/users/$userId/courses';
}

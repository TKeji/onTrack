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

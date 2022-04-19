class StringConstant {
  static const String appName = "Janus";

  static const String pageNotFound = "Page not found";
}

class RouteConstant {
  static const String home = "/";
  static const String login = "/login";
  static const String register = "/register";
}

class RestApiConstant {
  static const String serverUrl = "http://localhost:3000";

  static const String users = "/users";
  static const String register = users + "/create";
  static const String remove = users + "/remove";
  static const String login = users + "/auth/sign-in";
}

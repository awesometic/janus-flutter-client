class StringConstant {
  static const String appName = "Janus";

  static const String pageNotFound = "Page not found";
}

class RouteConstant {
  static const String home = "/";
  static const String login = "/login";
  static const String register = "/register";
}

// Each item indicates the endpoint of the APIs
// For example, `users` is the endpoint of the `/users/*` API
enum RestApiComponentType {
  users,
  departments,
  permissions,
  places,
  beacons,
  entrances,
}

class RestApiConstant {
  static const String serverUrl = "http://localhost:3000";

  // Basic CRUD APIs for each component excepts 'read'
  static const String create = "/create";
  static const String update = "/update";
  static const String remove = "/remove";

  // Users specific APIs
  static const String userLogin = "/users/auth/sign-in";
  static const String emailVerification = "/users/auth/email-verification";
}

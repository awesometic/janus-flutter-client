import 'package:flutter_test/flutter_test.dart';
import 'package:janus/src/repository/provider/restapi_provider.dart';

void main() {
  var restApiProvider = RestApiProvider();
  String name = 'ATestUserFromFlutterClient';
  String email = 'test@test.com';
  String password = '!@#\$%^&*';

  group('Register', () {
    setUp(() async {
      await restApiProvider.remove(email: email, password: password);
    });

    tearDown(() async {
      await restApiProvider.remove(email: email, password: password);
    });

    test('should success to register an account', () async {
      final results = await restApiProvider.register(
        name: name,
        email: email,
        password: password,
      );

      expect(results['email'], isNotNull);
    });
  });

  group('Login', () {
    setUp(() async {
      await restApiProvider.register(
          name: name, email: email, password: password);
    });

    tearDown(() async {
      await restApiProvider.remove(email: email, password: password);
    });

    test('should success to login the RestApi server', () async {
      final results = await restApiProvider.login(
        email: email,
        password: password,
      );

      expect(results['accessToken'], isNotNull);
    });
  });
}

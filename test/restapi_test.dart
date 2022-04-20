import 'package:flutter_test/flutter_test.dart';
import 'package:janus/src/repository/provider/restapi_provider.dart';
import 'package:janus/src/utility/constants.dart';

void main() {
  var restApiProvider = RestApiProvider();
  String name = 'ATestUserFromFlutterClient';
  String email = 'test@test.com';
  String password = '!@#\$%^&*';

  group('Users Basic CRUD functions', () {
    setUp(() async {
      await restApiProvider.remove(
          type: RestApiComponentType.users, email: email, password: password);
    });

    tearDown(() async {
      await restApiProvider.remove(
          type: RestApiComponentType.users, email: email, password: password);
    });

    test('should success to register an account', () async {
      final results = await restApiProvider.create(
        type: RestApiComponentType.users,
        name: name,
        email: email,
        password: password,
      );

      expect(results['email'], isNotNull);
    });
  });

  group('Login', () {
    setUp(() async {
      await restApiProvider.create(
          type: RestApiComponentType.users,
          name: name,
          email: email,
          password: password);
    });

    tearDown(() async {
      await restApiProvider.remove(
          type: RestApiComponentType.users, email: email, password: password);
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

import 'package:flutter_test/flutter_test.dart';
import 'package:janus/src/repository/data/restapi_user_data.dart';
import 'package:janus/src/repository/provider/restapi_provider.dart';

/*
 * The tests here assumes that all the RestAPI components working flawlessly on the server
 * */

void main() {
  var restApiProvider = RestApiProvider();
  String name = 'ATestUserFromFlutterClient';
  String email = 'test@test.com';
  String password = '12345678';

  group('Users Basic CRUD functions:', () {
    test('It should create a user', () async {
      final results = await restApiProvider.create(
        data: CreateUserData(name: name, email: email, password: password),
      );

      expect(results['email'], isNotNull);
    });

    test('It should remove the user', () async {
      final results = await restApiProvider.remove(
        data: RemoveUserData(email: email, password: password),
      );

      expect(results['email'], isNotNull);
    });
  });

  group('Authenticate:', () {
    setUp(() async {
      await restApiProvider.create(
        data: CreateUserData(name: name, email: email, password: password),
      );

      tearDown(() async {
        await restApiProvider.remove(
            data: RemoveUserData(email: email, password: password));
      });

      test('It should login to the RestApi server', () async {
        final results = await restApiProvider.login(
          email: email,
          password: password,
        );

        expect(results['accessToken'], isNotNull);
      });
    });
  });
}

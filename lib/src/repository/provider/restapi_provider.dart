import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:janus/src/repository/data/restapi_basic_data.dart';
import 'package:janus/src/repository/data/restapi_user_data.dart';
import 'package:janus/src/utility/constants.dart';

class RestApiProvider {
  RestApiProvider();

  Future<dynamic> create({required BasicCrudData data}) async {
    Response response;

    switch (data.runtimeType) {
      case CreateUserData:
        var userData = data as CreateUserData;
        var requestBody = {
          'name': userData.name,
          'email': userData.email,
          'password': userData.password,
        };

        if (userData.departmentId != null) {
          requestBody['department'] = userData.departmentId.toString();
        }
        if (userData.permissionId != null) {
          requestBody['permission'] = userData.permissionId.toString();
        }

        response = await http.post(
            Uri.parse(RestApiConstant.serverUrl +
                "/${userData.type!.name}" +
                RestApiConstant.create),
            body: requestBody);
        break;
      default:
        throw Exception('Unknown BasicCrudData type');
    }

    return json.decode(response.body.trim());
  }

  Future<dynamic> remove({required BasicCrudData data}) async {
    Response response;

    switch (data.runtimeType) {
      case RemoveUserData:
        var userData = data as RemoveUserData;

        response = await http.post(
          Uri.parse(RestApiConstant.serverUrl +
              "/${userData.type!.name}" +
              RestApiConstant.remove),
          body: {
            'email': userData.email,
            'password': userData.password,
          },
        );
        break;
      default:
        throw Exception('Unknown BasicCrudData type');
    }

    return json.decode(response.body.trim());
  }

  Future<dynamic> update({required BasicCrudData data}) async {
    Response response;

    switch (data.runtimeType) {
      case UpdateUserData:
        var userData = data as UpdateUserData;
        var requestBody = {
          'email': userData.email,
          'password': userData.password,
        };

        if (userData.name != null) {
          requestBody['name'] = userData.name;
        }
        if (userData.departmentId != null) {
          requestBody['department'] = userData.departmentId.toString();
        }
        if (userData.permissionId != null) {
          requestBody['permission'] = userData.permissionId.toString();
        }

        response = await http.post(
          Uri.parse(RestApiConstant.serverUrl +
              "/${userData.type!.name}" +
              RestApiConstant.create),
          body: requestBody,
        );
        break;
      default:
        throw Exception('Unknown BasicCrudData type');
    }

    return json.decode(response.body.trim());
  }

  Future<dynamic> login(
      {required String email, required String password}) async {
    var response = await http.post(
      Uri.parse(RestApiConstant.serverUrl + RestApiConstant.userLogin),
      body: {
        'email': email,
        'password': password,
      },
    );

    return json.decode(response.body.trim());
  }
}

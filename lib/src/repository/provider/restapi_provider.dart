import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:janus/src/utility/constants.dart';

class RestApiProvider {
  RestApiProvider();

  Future<dynamic> create(
      {required RestApiComponentType type,
      required String name,
      required String email,
      required String password,
      int? departmentId,
      int? permissionId}) async {
    Response response;

    if (departmentId != null && permissionId != null) {
      response = await http.post(
        Uri.parse(RestApiConstant.serverUrl +
            "/" +
            type.name +
            RestApiConstant.create),
        body: {
          'name': name,
          'email': email,
          'password': password,
          'department': departmentId.toString(),
          'permission': permissionId.toString(),
        },
      );
    } else {
      response = await http.post(
        Uri.parse(RestApiConstant.serverUrl +
            "/" +
            type.name +
            RestApiConstant.create),
        body: {
          'name': name,
          'email': email,
          'password': password,
        },
      );
    }

    return json.decode(response.body.trim());
  }

  Future<dynamic> update(
      {required RestApiComponentType type,
      required String email,
      required String password}) async {
    var response = await http.post(
      Uri.parse(
          RestApiConstant.serverUrl + "/" + type.name + RestApiConstant.update),
      body: {
        'email': email,
        'password': password,
      },
    );

    return json.decode(response.body.trim());
  }

  Future<dynamic> remove(
      {required RestApiComponentType type,
      required String email,
      required String password}) async {
    var response = await http.post(
      Uri.parse(
          RestApiConstant.serverUrl + "/" + type.name + RestApiConstant.remove),
      body: {
        'email': email,
        'password': password,
      },
    );

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

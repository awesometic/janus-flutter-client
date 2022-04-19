import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:janus/src/utility/constants.dart';

class RestApiProvider {
  RestApiProvider();

  Future<dynamic> register(
      {required String name,
      required String email,
      required String password,
      int? departmentId,
      int? permissionId}) async {
    Response response;

    if (departmentId != null && permissionId != null) {
      response = await http.post(
        Uri.parse(RestApiConstant.serverUrl + RestApiConstant.register),
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
        Uri.parse(RestApiConstant.serverUrl + RestApiConstant.register),
        body: {
          'name': name,
          'email': email,
          'password': password,
        },
      );
    }

    return json.decode(response.body.trim());
  }

  Future<dynamic> login(
      {required String email, required String password}) async {
    var response = await http.post(
      Uri.parse(RestApiConstant.serverUrl + RestApiConstant.login),
      body: {
        'email': email,
        'password': password,
      },
    );

    return json.decode(response.body.trim());
  }

  Future<dynamic> remove(
      {required String email, required String password}) async {
    var response = await http.post(
      Uri.parse(RestApiConstant.serverUrl + RestApiConstant.remove),
      body: {
        'email': email,
        'password': password,
      },
    );

    return json.decode(response.body.trim());
  }
}

import 'package:janus/src/repository/data/restapi_basic_data.dart';
import 'package:janus/src/utility/constants.dart';

class CreateUserData implements BasicUserData {
  CreateUserData({
    required this.name,
    required this.email,
    required this.password,
    this.departmentId,
    this.permissionId,
  }) {
    type = RestApiComponentType.users;
  }

  @override
  RestApiComponentType? type;

  @override
  String? email;

  @override
  String? password;

  String name;
  int? departmentId;
  int? permissionId;
}

class RemoveUserData implements BasicUserData {
  RemoveUserData({
    required this.email,
    required this.password,
  }) {
    type = RestApiComponentType.users;
  }

  @override
  RestApiComponentType? type;

  @override
  String? email;

  @override
  String? password;
}

class UpdateUserData implements BasicUserData {
  UpdateUserData({
    this.name,
    required this.email,
    required this.password,
    this.departmentId,
    this.permissionId,
  }) {
    type = RestApiComponentType.users;
  }

  @override
  RestApiComponentType? type;

  @override
  String? email;

  @override
  String? password;

  String? name;
  int? departmentId;
  int? permissionId;
}

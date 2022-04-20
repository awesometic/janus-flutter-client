import 'package:janus/src/utility/constants.dart';

class BasicCrudData {
  RestApiComponentType? type;
}

class BasicUserData implements BasicCrudData {
  String? email;
  String? password;

  @override
  RestApiComponentType? type;
}

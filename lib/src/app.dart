import 'package:flutter/material.dart';
import 'package:janus/src/utility/constants.dart';
import 'utility/router.dart' as router;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = StringConstant.appName;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      initialRoute: RouteConstant.login,
      onGenerateRoute: router.Router.generateRoute,
    );
  }
}

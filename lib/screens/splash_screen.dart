import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  navigateFun(BuildContext context) async{
    await Future.delayed(Duration(seconds: 2));
    Provider.of<AuthProvider>(context,listen: false).checkUser();
  }
  @override
  Widget build(BuildContext context) {
    navigateFun(context);
    return Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
import 'package:admin_app/helpers/auth_helper.dart';
import 'package:admin_app/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import '../models/user.dart';
import '../providers/auth_provider.dart';
import '../router.dart';

class SignIn extends StatefulWidget {
  static const rourtName = 'login';
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final UserCredential userCredential =
      UserCredential(usernameOrEmail: '', password: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Email or Username';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          userCredential.usernameOrEmail = value!;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Username Or Email',
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        userCredential.password = value!;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                          ),
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async{
                            // Validate form
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              // Hit Api
                              try {
                                await Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .logIn(userCredential.usernameOrEmail,
                                        userCredential.password);
                              } on PlatformException catch (e) {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(e.toString()),
                                  backgroundColor: Theme.of(context).errorColor,
                                ));
                              }
                            }
                          },
                        )),
                  ),
                  TextButton(
                      onPressed: () {
                        AppRouter.NavigateToWidget(SignUp());
                      },
                      child: Text('SignUp'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

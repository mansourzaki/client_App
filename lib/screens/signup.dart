import 'dart:developer';

import 'package:admin_app/helpers/auth_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../providers/auth_provider.dart';
import '../router.dart';
import 'home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final User user = User(password: '', username: '', email: '');
  late String confirmPassword;

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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Username';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          user.username = value!;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Username',
                        labelText: 'Username',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Email Address';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          user.email = value!;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Email',
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          setState(() {
                            user.password = value!;
                          });
                        },
                        onChanged: (text) {
                          user.password = text;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter Password',
                          labelText: 'Password',
                        ),
                        obscureText: true),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Confirm Password';
                      } else if (user.password != confirmPassword) {
                        return 'Password fields dont match';
                      }
                      return null;
                    },
                    onChanged: (text) {
                      confirmPassword = text;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Same Password',
                      labelText: 'Confirm Password',
                    ),
                    obscureText: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Consumer<AuthProvider>(builder:
                          (BuildContext context, AuthProvider auth,
                              Widget? child) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                          ),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              try {
                                await context.read<AuthProvider>().signUp(
                                    user.email, user.password, user.password);
                                print('in readd');
                                AppRouter.NavigateWithReplacemtnToWidget(
                                    Home());
                                print('in create');
                              } catch (e) {
                                log('signup');
                                log(e.toString());
                              }

                              //auth.register(user);
                            }
                          },
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

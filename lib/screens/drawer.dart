import 'dart:developer';

import 'package:admin_app/router.dart';
import 'package:admin_app/screens/signin.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../helpers/auth_helper.dart';
import '../providers/auth_provider.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String url = '';
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    return Column(
      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/drawer-header.jpg'),
          )),
          currentAccountPicture: GestureDetector(
            child: CircleAvatar(
              backgroundImage: NetworkImage(url != ''
                  ? 'https://avatars2.githubusercontent.com/u/2400215?s=120&v=4'
                  : url),
            ),
          ),
          accountEmail: AuthHelper.authHelper.auth.currentUser == null
              ? Text('')
              : Text(AuthHelper.authHelper.auth.currentUser!.email!),
          accountName: AuthHelper.authHelper.auth.currentUser == null
              ? Text('Please login')
              : Text('ss'),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.home,
                    color: Theme.of(context).colorScheme.secondary),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_basket,
                    color: Theme.of(context).colorScheme.secondary),
                title: Text('Shop'),
                trailing: Text('New',
                    style: TextStyle(color: Theme.of(context).primaryColor)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/shop');
                },
              ),
              ListTile(
                leading: Icon(Icons.category,
                    color: Theme.of(context).colorScheme.secondary),
                title: Text('Categories'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/categorise');
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite,
                    color: Theme.of(context).colorScheme.secondary),
                title: Text('My Wishlist'),
                trailing: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Text('4',
                      style: TextStyle(color: Colors.white, fontSize: 10.0)),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/wishlist');
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart,
                    color: Theme.of(context).colorScheme.secondary),
                title: Text('My Cart'),
                trailing: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Text('2',
                      style: TextStyle(color: Colors.white, fontSize: 10.0)),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cart');
                },
              ),
              Divider(),
              // ListTile(
              //   leading: Icon(Icons.settings,
              //       color: Theme.of(context).colorScheme.secondary),
              //   title: Text('Settings'),
              //   onTap: () {
              //     Navigator.pop(context);
              //     Navigator.pushNamed(context, '/settings');
              //   },
              // ),
              AuthHelper.authHelper.auth.currentUser == null
                  ? ListTile(
                      leading: Icon(Icons.exit_to_app,
                          color: Theme.of(context).colorScheme.secondary),
                      title: Text('Login'),
                      onTap: () async {
                        //await auth.logout();
                        AppRouter.NavigateToWidget(SignIn());
                      },
                    )
                  : ListTile(
                      leading: Icon(Icons.exit_to_app,
                          color: Theme.of(context).colorScheme.secondary),
                      title: Text('Logout'),
                      onTap: () async {
                        //await auth.logout();
                        context.read<AuthProvider>().signOut();
                        log('logout');
                      },
                    )
            ],
          ),
        )
      ],
    );
  }
}

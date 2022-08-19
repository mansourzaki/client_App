import 'package:admin_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'providers/auth_provider.dart';
import 'providers/firestore_provider.dart';
import 'router.dart';
import 'screens/home.dart';
import 'screens/signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final Locale locale = Locale('en');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthProvider>(create: (context) => AuthProvider()),
      // ChangeNotifierProvider<AuthBlock>(create: (context) => AuthBlock()),
      ChangeNotifierProvider<FireStoreProvider>(
          create: (context) => FireStoreProvider())
    ],
    child: MaterialApp(
      supportedLocales: [Locale('en'), Locale('ar')],
      locale: locale,
      navigatorKey: AppRouter.navKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrange.shade500,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.lightBlue.shade900),
        fontFamily: locale.languageCode == 'ar' ? 'Dubai' : 'Lato',
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings routeSettings) {
        String? name = routeSettings.name;
        dynamic arguments = routeSettings.arguments;
        if (name == SignIn.rourtName) {
          return MaterialPageRoute(builder: (context) {
            return SignIn();
          });
        } else {
          return MaterialPageRoute(builder: (context) {
            return Home();
          });
        }
      },
      // routes: <String, WidgetBuilder>{
      //   '/': (BuildContext context) => SplashScreen(),
      //   '/auth': (BuildContext context) => Auth(),
      //   '/shop': (BuildContext context) => Shop(),
      //   '/categorise': (BuildContext context) => Categorise(),
      //   '/wishlist': (BuildContext context) => WishList(),
      //   '/cart': (BuildContext context) => CartList(),
      //   '/settings': (BuildContext context) => Settings(),
      //   '/products': (BuildContext context) => Products()
      // },
    ),
  ));
}

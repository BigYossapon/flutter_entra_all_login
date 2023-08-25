import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:flutter/material.dart';

import 'LoginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Config config = new Config(
      tenant: "3704a322-5949-4963-a45e-f69da8218fc1",
      clientId: "89c62ad0-827f-4415-9a20-064088f18dbc",
      scope: "api://89c62ad0-827f-4415-9a20-064088f18dbc/User.Login",
      // redirectUri is Optional as a default is calculated based on app type/web location
      redirectUri:
          "msauth://com.example.flutter_entra_test/VzSiQcXRmi2kyjzcA%2BmYLEtbGVs%3D",
      navigatorKey: navigatorKey,
      webUseRedirect:
          true, // default is false - on web only, forces a redirect flow instead of popup auth
      //Optional parameter: Centered CircularProgressIndicator while rendering web page in WebView
      loader: Center(child: CircularProgressIndicator()),
      postLogoutRedirectUri:
          'http://com.example.flutter_entra_test/VzSiQcXRmi2kyjzcA%2BmYLEtbGVs%3D/logout', //optional
    );
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(configB2Ca: config),
    );
  }
}

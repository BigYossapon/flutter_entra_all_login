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
    //organized test
    // final Config config = new Config(
    //   tenant: "fdf098e9-2c27-4bff-bc6d-d78e9138fb99",
    //   clientId: "955c709c-7757-4bad-bb21-62454c7d4e65",
    //   scope: "api://955c709c-7757-4bad-bb21-62454c7d4e65/Users.Login",
    //   // redirectUri is Optional as a default is calculated based on app type/web location
    //   redirectUri:
    //       "msauth://com.example.flutter_entra_test/gYfucgrOlZ3FLWgYctqk1bCxZbo%3D",
    //   navigatorKey: navigatorKey,

    //   webUseRedirect: true,
    //   // default is false - on web only, forces a redirect flow instead of popup auth
    //   //Optional parameter: Centered CircularProgressIndicator while rendering web page in WebView
    //   loader: Center(child: CircularProgressIndicator()),
    //   postLogoutRedirectUri:
    //       'http://com.example.flutter_entra_test/gYfucgrOlZ3FLWgYctqk1bCxZbo%3D/logout', //optional
    //   isB2C: false,
    // );

    //personal test
    final Config config = new Config(
      tenant: "3704a322-5949-4963-a45e-f69da8218fc1",
      clientId: "f81ede76-d0a5-47f6-a7c7-79dd1a188d44",
      scope: "api://f81ede76-d0a5-47f6-a7c7-79dd1a188d44/Users.Login",
      // redirectUri is Optional as a default is calculated based on app type/web location
      redirectUri:
          "msauth://com.example.flutter_entra_test/gYfucgrOlZ3FLWgYctqk1bCxZbo%3D",
      navigatorKey: navigatorKey,

      webUseRedirect: true,
      // default is false - on web only, forces a redirect flow instead of popup auth
      //Optional parameter: Centered CircularProgressIndicator while rendering web page in WebView
      loader: Center(child: CircularProgressIndicator()),
      postLogoutRedirectUri:
          'http://com.example.flutter_entra_test/gYfucgrOlZ3FLWgYctqk1bCxZbo%3D/logout', //optional
      isB2C: false,
    );

    //personal b2c test
    // final Config config = new Config(
    //   tenant: "3704a322-5949-4963-a45e-f69da8218fc1",
    //   clientId: "f81ede76-d0a5-47f6-a7c7-79dd1a188d44",
    //   scope: "api://f81ede76-d0a5-47f6-a7c7-79dd1a188d44/Users.Login",
    //   // redirectUri is Optional as a default is calculated based on app type/web location
    //   redirectUri:
    //       "msauth://com.example.flutter_entra_test/gYfucgrOlZ3FLWgYctqk1bCxZbo%3D",
    //   navigatorKey: navigatorKey,

    //   webUseRedirect: true,
    //   // default is false - on web only, forces a redirect flow instead of popup auth
    //   //Optional parameter: Centered CircularProgressIndicator while rendering web page in WebView
    //   loader: Center(child: CircularProgressIndicator()),
    //   postLogoutRedirectUri:
    //       'http://com.example.flutter_entra_test/gYfucgrOlZ3FLWgYctqk1bCxZbo%3D/logout', //optional
    //   isB2C: true,
    // );
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

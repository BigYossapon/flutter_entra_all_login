import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.configB2Ca});

  final Config configB2Ca;
  @override
  Widget build(BuildContext context) {
    final AadOAuth oauth = AadOAuth(configB2Ca);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Azure AD"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              _handleSignIn(context);
            },
            child: Text("Signin")),
      ),
    );
  }

  Future<void> _handleSignIn(BuildContext context) async {
    final AadOAuth oauth = AadOAuth(configB2Ca);
    print(oauth);

    try {
      final result = await oauth.login();
      result.fold(
          (failure) => print(failure.toString()), (token) => print("$token")
          //showMessage('Logged in successfully, your access token: $token'),
          );
      String? accessToken = await oauth.getAccessToken();
      String? idToken = await oauth.getIdToken();
      //final accessToken = await oauth.getAccessToken();
      // Successfully obtained access token. You can now use it to access AAD-protected resources.
      print('Access token: $accessToken');
      print('ID token: $idToken');
      // Navigate to the next screen or perform required actions.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            accessToken: accessToken!,
            configB2Ca: configB2Ca,
          ),
        ),
      );
    } catch (e) {
      // Handle authentication errors.
      print('Error during AAD authentication: $e');
    }
  }
}

class HomePage extends StatelessWidget {
  final String accessToken;
  final Config configB2Ca;
  HomePage({required this.accessToken, required this.configB2Ca});

  Future<void> logout(BuildContext context) async {
    final AadOAuth oauth = AadOAuth(configB2Ca);
    try {
      await oauth.logout();
      //Navigator.maybePop(context);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(
            configB2Ca: configB2Ca,
          ),
        ),
      );

      //Navigator.pop(context);
      print("logout success");
    } catch (e) {
      print("logout failure");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Successfully authenticated with Azure AD!'),
            SizedBox(height: 20),
            Expanded(
              child: Text('Access token: $accessToken'),
            ),
            FloatingActionButton(
              onPressed: () {
                logout(context);
                //Navigator.pop(context);
              },
              child: Icon(Icons.logout),
            )
          ],
        ),
      ),
    );
  }
}

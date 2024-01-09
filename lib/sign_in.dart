import 'package:flutter/material.dart';
import 'package:attendanaceapp/add_employee.dart';
import 'package:provider/provider.dart'; // Import provider package
import 'google_sign_in_provider.dart'; // Import your GoogleSignInProvider
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import FontAwesomeIcons

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isSignedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In Page'),
      ),
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.75,
              left: MediaQuery.of(context).size.width * 0.1,
              child: Column(
                children: [
                  FilledButton.icon(
                    onPressed: isSignedIn
                        ? null
                        : () {
                            final provider =
                                Provider.of<GoogleSignInProvider>(
                                    context,
                                    listen: false);
                            provider.googleLogin().then((_) {
                              // Update the sign-in status
                              setState(() {
                                isSignedIn = true;
                              });
                              // Navigate to the next page after successful sign-in
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>UserProfilePage()),
                              );
                            });
                          },
                    icon: const Icon(
                      FontAwesomeIcons.google,
                      color: Color.fromARGB(255, 241, 106, 96),
                    ),
                    label: const Text('Sign in with Google'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      backgroundColor: Color.fromARGB(255, 75, 2, 75),
                      minimumSize: Size(
                        MediaQuery.of(context).size.width * 0.8,
                        50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

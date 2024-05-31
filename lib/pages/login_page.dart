import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackathon2024/auth/auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  String? errorMessage = '';
  bool isLogin = true;

  // sign user in method
  void signUserIn() {}

  Future<void> signInWithEmailAndPassword() async {
    print(11);
    try {
      await Auth(FirebaseAuth.instance).signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _logo() {
    return Image.asset(
      'lib/images/Zenith-logos_white.png',
      scale: 5,
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      style: OutlinedButton.styleFrom(backgroundColor: Colors.white),
      onPressed: signInWithEmailAndPassword,
      child: Text(
        'Login',
        style: TextStyle(color: Colors.green[600]),
      ),
    );
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth(FirebaseAuth.instance).createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _errorMessage() {
    if (errorMessage == 'success') {
      String email = _controllerEmail.text;
      return Text(
        'Reset Password Link has been sent to $email',
        style: const TextStyle(color: Colors.black),
      );
    } else if (errorMessage != '') {
      return Text(
        'Humm ? $errorMessage',
        style: const TextStyle(color: Colors.red),
      );
    } else {
      return const Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo
                _logo(),

                // welcome back you've been missed!
                Text(
                  'Welcome back, you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                TextFormField(
                  controller: _controllerEmail,
                  decoration: InputDecoration(hintText: "Email"),
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                TextFormField(
                  controller: _controllerPassword,
                  decoration: InputDecoration(hintText: "Password"),
                  obscureText: true,
                ),

                const SizedBox(height: 10),
                _errorMessage(),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ResetPage()));
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.grey[600]),
                          )),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // sign in button
                TextButton(
                  child: isLogin ? Text('Login') : Text('Register'),
                  onPressed: isLogin
                      ? signInWithEmailAndPassword
                      : createUserWithEmailAndPassword,
                ),

                // not a member? register now
                Row(
                  // register now
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isLogin ? 'Not a member?' : 'Already have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            isLogin = !isLogin;
                          });
                        },
                        child: Text(
                          isLogin ? 'Register now' : 'Login now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    //log in or register
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResetPage extends StatefulWidget {
  const ResetPage({Key? key}) : super(key: key);

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  String? errorMessage = '';

  final TextEditingController _controllerEmail = TextEditingController();

  Future<void> resetPassword() async {
    try {
      await Auth(FirebaseAuth.instance).resetPassword(
        // change
        email: _controllerEmail.text,
      );
      setState(() {
        errorMessage = 'success';
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Text('Zenith');
  }

  Widget _entryField(String title, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget _errorMessage() {
    print(222);
    if (errorMessage == 'success') {
      String email = _controllerEmail.text;
      return Text(
        'Reset Password Link has been sent to $email',
        style: const TextStyle(color: Colors.black),
      );
    } else if (errorMessage != '') {
      return Text(
        'Humm ? $errorMessage',
        style: const TextStyle(color: Colors.red),
      );
    } else {
      return const Text('');
    }
  }

  Widget _submitButton() {
    // change pass page
    return ElevatedButton(
      style: OutlinedButton.styleFrom(backgroundColor: Colors.white),
      onPressed: resetPassword, //change
      child: Text(
        'reset',
        style: TextStyle(color: Colors.green[600]),
      ),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          'Back to Login Page',
          style: TextStyle(color: Colors.black),
        ));
  }

  Widget _logo() {
    return Image.asset(
      'lib/images/Zenith-logos_white.png',
      scale: 5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _logo(),
            SizedBox(height: 20),
            TextFormField(
              controller: _controllerEmail,
              decoration: InputDecoration(hintText: "Email"),
              obscureText: false,
            ),
            SizedBox(height: 10),
            SizedBox(height: 20),
            _submitButton(),
            SizedBox(height: 10),
            _errorMessage(),
            _loginOrRegisterButton(),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

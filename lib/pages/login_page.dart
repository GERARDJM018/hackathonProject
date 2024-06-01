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
      "lib/images/wesafe.png",
      scale: 1.5,
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
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                _logo(),
                // welcome back you've been missed!
                const Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      'Login to your Account',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 13),
                Padding(
                  padding: const EdgeInsets.fromLTRB(36, 0, 36, 0),
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: _controllerEmail,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                    color: const Color.fromARGB(255, 255, 255,
                                        255), // Border color when enabled
                                  )),
                              filled: true,
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(128, 162, 162, 162)),
                              hintText: "Email",
                              fillColor: Colors.white70,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        // Add some space between the TextField and the next widget
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(36, 0, 36, 0),
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          // This ensures the TextField takes up the available space
                          child: TextField(
                            controller: _controllerPassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(128, 162, 162, 162)),
                              hintText: "Password",
                              fillColor: Colors.white70,
                            ),
                          ),
                        ),
                        SizedBox(
                            width:
                                10), // Add some space between the TextField and the next widget
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // forgot password?
                Container(
                  width: 330,
                  margin:
                      const EdgeInsets.all(10.0), // Adjust the value as needed
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color of the container
                    border: Border.all(
                        color: Colors.black, width: 2.0), // Optional border
                    borderRadius:
                        BorderRadius.circular(15.0), // Rounded corners
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: isLogin
                              ? signInWithEmailAndPassword
                              : createUserWithEmailAndPassword,
                          child: Align(
                            alignment: Alignment.center,
                            child: isLogin ? Text('Login') : Text('Register'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
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

                // sign in button
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
                _errorMessage(),
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
      "lib/images/wesafe.png",
      scale: 1.5,
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
            SizedBox(height: 10),
            TextFormField(
              controller: _controllerEmail,
              decoration: InputDecoration(hintText: "Email"),
              obscureText: false,
            ),
            SizedBox(height: 10),
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

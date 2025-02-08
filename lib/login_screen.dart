import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'create_account_screen.dart';
import 'home_screen.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder())),
            SizedBox(height: 16.0),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()), obscureText: true),
            SizedBox(height: 16.0),
            ElevatedButton(onPressed: _login, child: Text('Login')),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen())), child: Text('Forgot password?', style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline))),
                Text(' or '),
                GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccountScreen())), child: Text('Create account', style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
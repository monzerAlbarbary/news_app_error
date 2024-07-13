// screens/login_screen.dart
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // تحقق من اسم المستخدم وكلمة المرور (يمكنك إضافة المنطق الخاص بك هنا)
                  if (_usernameController.text == 'admin' && _passwordController.text == 'password') {
                    Navigator.pushReplacementNamed(context, '/news');
                  } else {
                    // إذا كانت بيانات الدخول غير صحيحة، يمكنك عرض رسالة تحذير هنا
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Invalid username or password')),
                    );
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'home_page.dart'; // Ana sayfa widget'ını import ediyoruz

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Formu gönderme işlemi
  void _submitForm() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Şu anda sadece giriş bilgilerini print ediyoruz
    print('Email: $email, Password: $password');

    // Başarılı giriş sonrasında HomePage'e yönlendir
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()), // Ana sayfaya yönlendir
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Giriş Yap')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Lütfen giriş bilgilerinizi girin.", style: TextStyle(fontSize: 18)),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Email adresinizi girin",
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: "Şifre",
                hintText: "Şifrenizi girin",
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm, // Formu gönderme işlemi
              child: Text("Giriş Yap"),
            ),
          ],
        ),
      ),
    );
  }
}

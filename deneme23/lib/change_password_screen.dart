import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  String _currentPassword = '';
  String _newPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Şifre Değiştir'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mevcut ve Yeni Şifrenizi Girin',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Mevcut Şifre'),
                onSaved: (value) {
                  _currentPassword = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Mevcut şifrenizi girin';
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Yeni Şifre'),
                onSaved: (value) {
                  _newPassword = value!;
                },
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Yeni şifre en az 6 karakter olmalı';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Şifreniz değiştirildi!')),
                    );
                  }
                },
                child: Text('Değiştir'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

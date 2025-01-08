import 'package:flutter/material.dart';

class LanguageSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dil Seçimi'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Türkçe'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Dil Türkçe olarak ayarlandı!')),
              );
            },
          ),
          ListTile(
            title: Text('English'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Language changed to English!')),
              );
            },
          ),
        ],
      ),
    );
  }
}

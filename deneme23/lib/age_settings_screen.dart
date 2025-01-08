import 'package:flutter/material.dart';

class AgeSettingsScreen extends StatefulWidget {
  @override
  _AgeSettingsScreenState createState() => _AgeSettingsScreenState();
}

class _AgeSettingsScreenState extends State<AgeSettingsScreen> {
  double _age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yaş Ayarları'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Yaşınızı Ayarlayın',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Slider(
              value: _age,
              min: 0,
              max: 100,
              divisions: 100,
              label: _age.round().toString(),
              onChanged: (value) {
                setState(() {
                  _age = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Yaşınız $_age olarak ayarlandı!')),
                );
              },
              child: Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}

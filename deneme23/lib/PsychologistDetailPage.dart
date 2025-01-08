import 'package:flutter/material.dart';

class PsychologistDetailPage extends StatelessWidget {
  final String name;
  final String clinic;
  final String rating;
  final String shortInfo;

  PsychologistDetailPage({
    required this.name,
    required this.clinic,
    required this.rating,
    required this.shortInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Adı: $name',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Klinik: $clinic',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 20),
                Text(
                  '$rating / 5',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Hakkında:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              shortInfo,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Favorilere ekleme işlemi
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$name favorilere eklendi!')),
                );
              },
              icon: Icon(Icons.favorite_border),
              label: Text('Favorilere Ekle'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                // WhatsApp ile iletişime geçme işlemi
                // WhatsApp URL açma kodu buraya eklenebilir
              },
              icon: Icon(Icons.chat),
              label: Text('WhatsApp ile İletişime Geç'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

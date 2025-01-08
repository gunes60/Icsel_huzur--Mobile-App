import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  final List<String> notifications = [
    'Yarın Ömer Arlı ile randevunuz var!',
    'Meditasyon programınızı güncellemeyi unutmayın.',
    'Psikoloğunuz yeni bir not ekledi.',
    'Favori etkinliklerinize bir yenisi eklendi.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bildirimler',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notifications[index]),
            leading: Icon(Icons.notification_important, color: Colors.black),
          );
        },
      ),
    );
  }
}

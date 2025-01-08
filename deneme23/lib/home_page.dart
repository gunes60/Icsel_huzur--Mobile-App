import 'package:flutter/material.dart';
import 'dart:math'; // Rastgele bildirim seçmek için

// Diğer ekranlara yönlendirme için importlar
import 'PsikolojikTestlerPage.dart';
import 'emotion_selection_page.dart'; // Duygusal durum ekranı
import 'psychologists_page.dart'; // Psikologlar ekranı
import 'favorites_page.dart'; // Favoriler ekranı
import 'notifications_page.dart'; // Bildirim ekranı
import 'profile_management_screen.dart'; // Profil yönetim ekranı

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> notifications = [
  "Yarın Ömer Arlı ile randevunuz var!",
  "Bugün meditasyon yapmayı unutmayın.",
  "Psikologunuz size bir mesaj gönderdi.",
   "Favori içeriklerinizde yeni bir güncelleme var.",
  "Sağlığınız için 10 dakikalık bir yürüyüş yapmayı deneyin.",
  "Bugün duygusal durumunuzu kontrol ettiniz mi?",
  "Unutmayın, bugün su içmeyi ihmal etmeyin!",
  "Ruhsal sağlığınız için bir mola verin.",
  "Yeni bir test tamamladınız, sonuçları görmek için tıklayın.",
  "Bugün kendinize biraz vakit ayırmayı unutmayın.",
  "Duygusal durumunuzu iyileştirmek için bir şeyler yapın.",
  "Yavaşlayın ve nefes alın, her şey yolunda olacak.",
  "Günlük hedeflerinizi tamamlamak için adım atın.",
  "Kendinizi sevmeniz için harika bir gün!",
      "Bir kahve molası vermek iyi gelebilir.",
  "Bugün ruhsal sağlığınız için bir şeyler yapın.",
  "Kendinize bir teşekkür edin, her şeyin farkında olun.",
  "Günlük aktivitelerinizde kendinizi nasıl hissettiğinizi kontrol edin.",
  "Bir şeyler yapmak için harika bir zaman!",
  "Duygusal durumunuzun farkında olun, destek alın.",
   "Gün boyunca minnettarlıkla dolu olun.",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ana Sayfa',
          style: TextStyle(color: Colors.white54),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"), // Arka plan resmi
            fit: BoxFit.cover, // Resmin ekranı kaplamasını sağlar
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildIconButton(Icons.face, '😊 Duygusal Durum', Colors.white, context),
                _buildIconButton(Icons.favorite, '❤️ Favoriler', Colors.white, context),
                _buildIconButton(Icons.circle, '⭕ Testler', Colors.white, context),
              ],
            ),
            SizedBox(height: 50),
            Center(
              child: Text(
                'İyi Hissetmeyi Unutma!',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.home, color: Colors.black),
                Text('Ana Sayfa', style: TextStyle(color: Colors.white54)),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.psychology, color: Colors.black),
                Text('Psikologlar', style: TextStyle(color: Colors.white54)),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.notifications, color: Colors.black),
                Text('Bildirimler', style: TextStyle(color: Colors.white54)),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.account_circle, color: Colors.blueGrey),
                Text('Profil', style: TextStyle(color: Colors.white54)),
              ],
            ),
            label: '',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PsychologistsPage()),
            );
          } else if (index == 2) {
            // Rastgele bir bildirim seç
            final random = Random();
            final randomNotification =
            notifications[random.nextInt(notifications.length)];

            // Bildirimi Snackbar ile göster
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(randomNotification),
                duration: Duration(seconds: 3),
              ),
            );
          } else if (index == 3) {
            // Profil Yönetim ekranına yönlendirme
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileManagementScreen()),
            );
          }
        },
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String label, Color backgroundColor, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: ElevatedButton.icon(
        onPressed: () {
          if (label == '😊 Duygusal Durum') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EmotionSelectionPage()),
            );
          } else if (label == '❤️ Favoriler') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavoritesPage()),
            );
          } else if (label == '⭕ Testler') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PsikolojikTestlerPage()),
            );
          }
        },
        icon: Icon(icon, color: Colors.black),
        label: Text(
          label,
          style: TextStyle(color: Colors.black),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: Colors.blue,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}

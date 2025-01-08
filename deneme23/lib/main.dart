import 'package:flutter/material.dart';
import 'login_screen.dart'; // Giriş ekranı widget'ını import ediyoruz
import 'home_page.dart'; // Ana sayfa widget'ını import ediyoruz
import 'notifications_page.dart';

// Uygulamanın giriş noktası
void main() {
  runApp(const MyApp());
}

// Ana uygulama widget'ı
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Debug banner'ı kaldırıyoruz
      title: 'İçsel Huzur Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Uygulama temasını belirleyin
      ),
      initialRoute: '/login', // Başlangıç rotası
      routes: {
        '/': (context) => HomePage(), // Ana sayfa rotası
        '/login': (context) => LoginScreen(), // Giriş ekranı rotası
      },
    );
  }
}

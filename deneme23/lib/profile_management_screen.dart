import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // WhatsApp linki için gerekli
import 'profile_edit_screen.dart';
import 'change_password_screen.dart';
import 'age_settings_screen.dart';
import 'language_selection_screen.dart';

class ProfileManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Yönetim'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Profil Ayarları',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Divider(color: Colors.black),
            SizedBox(height: 10),
            _buildListTile(
              context,
              title: 'Profil Bilgilerini Düzenle',
              icon: Icons.person,
              screen: ProfileEditScreen(),
            ),
            _buildListTile(
              context,
              title: 'Şifre Değiştir',
              icon: Icons.lock,
              screen: ChangePasswordScreen(),
            ),
            _buildListTile(
              context,
              title: 'Yaş Ayarları',
              icon: Icons.calendar_today,
              screen: AgeSettingsScreen(),
            ),
            _buildListTile(
              context,
              title: 'Dil Seçimi',
              icon: Icons.language,
              screen: LanguageSelectionScreen(),
            ),
            Divider(),
            SizedBox(height: 10),
            _buildPsychologistTile(
              context,
              psychologistName: 'Psikolog 1',
              phoneNumber: '1234567890', // WhatsApp numarası
            ),
            _buildPsychologistTile(
              context,
              psychologistName: 'Psikolog 2',
              phoneNumber: '0987654321', // WhatsApp numarası
            ),
            Spacer(),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Çıkış yapma işlemi
                  Navigator.pop(context);
                },
                icon: Icon(Icons.logout),
                label: Text('Çıkış Yap'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(
      BuildContext context, {
        required String title,
        required IconData icon,
        required Widget screen,
      }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }

  Widget _buildPsychologistTile(
      BuildContext context, {
        required String psychologistName,
        required String phoneNumber, // WhatsApp numarası
      }) {
    return ListTile(
      leading: Icon(Icons.person, color: Colors.black),
      title: Text(psychologistName),
      subtitle: Text('Psikolog ile iletişime geç'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {
              _addToFavorites(context, psychologistName);
            },
          ),
          IconButton(
            icon: Icon(Icons.chat, color: Colors.green),
            onPressed: () {
              _launchWhatsApp(phoneNumber);
            },
          ),
        ],
      ),
    );
  }

  void _addToFavorites(BuildContext context, String psychologistName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$psychologistName favorilere eklendi!')),
    );
  }

  void _launchWhatsApp(String phoneNumber) async {
    final url = 'https://wa.me/$phoneNumber'; // WhatsApp ile iletişime geç linki
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'WhatsApp ile iletişime geçilemedi: $url';
    }
  }
}

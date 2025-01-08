import 'package:flutter/material.dart';
import 'EmotionalStateTestPage.dart';
import 'beck_depresyon_testi.dart'; // Beck Depresyon Testi'ni içeri aktar
// Duygusal Durum Testi sayfasını içeri aktar

class PsikolojikTestlerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Psikolojik Testler'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Beck Depresyon Testi'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BeckDepresyonTesti()),
              );
            },
          ),
          ListTile(
            title: Text('Duygusal Durum Testi'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmotionalStateTestPage()),
              );
            },
          ),
          // Diğer testlerinizi buraya ekleyebilirsiniz
        ],
      ),
    );
  }
}

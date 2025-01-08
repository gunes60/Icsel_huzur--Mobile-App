import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'favorites_page.dart';

class PsychologistsPage extends StatefulWidget {
  @override
  _PsychologistsPageState createState() => _PsychologistsPageState();
}

class _PsychologistsPageState extends State<PsychologistsPage> {
  final List<Map<String, String>> psychologists = [
    {
      'name': 'Dr. Ömer Arlı',
      'clinic': 'Arlı Klinik',
      'rating': '5.0',
      'degree': 'Psikoloji Lisansı - İstanbul Üniversitesi',
      'certifications': 'Bilişsel Davranışçı Terapi Sertifikası',
      'sessionFee': '500₺',
      'whatsapp': 'https://wa.me/905332124765',
      'isOnline': 'Evet',
    },
    {
      'name': 'Dr. Ayşe Kılınç',
      'clinic': 'Kılınç Psikoloji',
      'rating': '5.0',
      'degree': 'Psikoloji Yüksek Lisansı - Hacettepe Üniversitesi',
      'certifications': 'EMDR Terapisi Sertifikası',
      'sessionFee': '450₺',
      'whatsapp': 'https://wa.me/905451753702',
      'isOnline': 'Hayır',
    },
    {
      'name': 'Dr. Mehmet Demir',
      'clinic': 'Demir Psikoloji Merkezi',
      'rating': '4.8',
      'degree': 'Psikoloji Lisansı - Ankara Üniversitesi',
      'certifications': 'Çocuk Terapisi Sertifikası',
      'sessionFee': '550₺',
      'whatsapp': 'https://wa.me/905334567789',
      'isOnline': 'Evet',
    },
    {
      'name': 'Dr. Selin Aydın',
      'clinic': 'Aydın Psikoterapi',
      'rating': '4.6',
      'degree': 'Psikoloji Lisansı - Boğaziçi Üniversitesi',
      'certifications': 'Aile Terapisi Sertifikası',
      'sessionFee': '400₺',
      'whatsapp': 'https://wa.me/905335678890',
      'isOnline': 'Hayır',
    },
    {
      'name': 'Dr. Fatma Yıldırım',
      'clinic': 'Liv Hospital',
      'rating': '4.0',
      'degree': 'Psikoloji Lisansı - İstanbul Üniversitesi',
      'certifications': 'Bilişsel Davranışçı Terapi Sertifikası',
      'sessionFee': '600₺',
      'whatsapp': 'https://wa.me/905516460210',
      'isOnline': 'Evet',
    },
    {
      'name': 'Dr. Zeynep Kılıç',
      'clinic': 'Kılıç Psikoloji',
      'rating': '4.7',
      'degree': 'Psikoloji Lisansı - İstanbul Bilgi Üniversitesi',
      'certifications': 'Aile Terapisi Sertifikası',
      'sessionFee': '480₺',
      'whatsapp': 'https://wa.me/905338890123',
      'isOnline': 'Evet',
    },
    {
      'name': 'Dr. Hakan Öztürk',
      'clinic': 'Öztürk Psikoloji Merkezi',
      'rating': '4.5',
      'degree': 'Psikoloji Lisansı - Ankara GATA',
      'certifications': 'Çift Terapisi Sertifikası',
      'sessionFee': '450₺',
      'whatsapp': 'https://wa.me/905339001234',
      'isOnline': 'Hayır',
    },
    {
      'name': 'Dr. Elif Özdemir',
      'clinic': 'Özdemir Psikoloji',
      'rating': '4.8',
      'degree': 'Psikoloji Lisansı - Ege Üniversitesi',
      'certifications': 'Bilişsel Davranışçı Terapi Sertifikası',
      'sessionFee': '530₺',
      'whatsapp': 'https://wa.me/905330112233',
      'isOnline': 'Evet',
    },
    {
      'name': 'Dr. Kemal Şahin',
      'clinic': 'Şahin Psikoloji',
      'rating': '4.9',
      'degree': 'Psikoloji Lisansı - İstanbul Üniversitesi',
      'certifications': 'EMDR Terapisi Sertifikası',
      'sessionFee': '600₺',
      'whatsapp': 'https://wa.me/905337003344',
      'isOnline': 'Evet',
    },
    {
      'name': 'Dr. Büşra Güler',
      'clinic': 'Güler Psikoterapi',
      'rating': '4.6',
      'degree': 'Psikoloji Lisansı - Hacettepe Üniversitesi',
      'certifications': 'Bilişsel Davranışçı Terapi Sertifikası',
      'sessionFee': '460₺',
      'whatsapp': 'https://wa.me/905338998877',
      'isOnline': 'Hayır',
    },
    {
      'name': 'Dr. Asuman Tuncer',
      'clinic': 'Tuncer Psikoloji',
      'rating': '4.4',
      'degree': 'Psikoloji Lisansı - Ankara Üniversitesi',
      'certifications': 'Aile Terapisi Sertifikası',
      'sessionFee': '480₺',
      'whatsapp': 'https://wa.me/905330123456',
      'isOnline': 'Evet',
    },
    {
      'name': 'Dr. Asiye Akgül',
      'clinic': 'Akgül Psikoloji',
      'rating': '4.7',
      'degree': 'Psikoloji Lisansı - Ankara Üniversitesi',
      'certifications': 'Aile Terapisi Sertifikası',
      'sessionFee': '480₺',
      'whatsapp': 'https://wa.me/905013737160',
      'isOnline': 'Evet',
    },
  ];

  List<String> favoritePsychologists = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      favoritePsychologists = prefs.getStringList('favorites') ?? [];
    });
  }

  _addToFavorites(String psychologistName) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      favoritePsychologists.add(psychologistName);
    });
    prefs.setStringList('favorites', favoritePsychologists);
  }

  _removeFromFavorites(String psychologistName) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      favoritePsychologists.remove(psychologistName);
    });
    prefs.setStringList('favorites', favoritePsychologists);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Psikologlar'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: psychologists.length,
          itemBuilder: (context, index) {
            var psychologist = psychologists[index];
            bool isFavorite = favoritePsychologists.contains(psychologist['name']);

            return Card(
              color: Colors.white,
              elevation: 4.0,
              child: GestureDetector(
                onTap: () {
                  // Psikolog profiline tıklandığında detay sayfasına yönlendirme
                },
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          psychologist['name']!,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          psychologist['clinic']!,
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 16),
                            Text(
                              psychologist['rating']!,
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Online Durum: ${psychologist['isOnline']}',
                          style: TextStyle(fontSize: 14, color: Colors.green),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Eğitim: ${psychologist['degree']}',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Sertifikalar: ${psychologist['certifications']}',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Seans Ücreti: ${psychologist['sessionFee']}',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () async {
                            final url = psychologist['whatsapp']!;
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Text('WhatsApp ile İletişime Geç'),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          if (isFavorite) {
                            _removeFromFavorites(psychologist['name']!);
                          } else {
                            _addToFavorites(psychologist['name']!);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

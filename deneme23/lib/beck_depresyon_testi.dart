import 'package:flutter/material.dart';

class BeckDepresyonTesti extends StatefulWidget {
  @override
  _BeckDepresyonTestiState createState() => _BeckDepresyonTestiState();
}

class _BeckDepresyonTestiState extends State<BeckDepresyonTesti> {
  final List<String> questions = [
    '1. Kendinizi mutsuz hissediyor musunuz?',
    '2. Kendinizi yalnız hissediyor musunuz?',
    '3. Gelecekle ilgili umudunuzu kaybettiniz mi?',
    '4. Yaşamınızda ilgi ve zevk kaybı var mı?',
    '5. Kendinizi suçlu hissediyor musunuz?',
    '6. Duygusal olarak çok hassas mısınız?',
    '7. Kendinizi değersiz hissediyor musunuz?',
    '8. Kendinizi depresif hissediyor musunuz?',
    '9. Uyku düzeninizde bozulmalar oldu mu?',
    '10. Duygusal olarak kendinizi bitkin hissediyor musunuz?'
  ];

  final List<int> answers = List.generate(10, (index) => 0); // Yanıtlar için bir liste

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beck Depresyon Testi'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(questions[index]),
            trailing: DropdownButton<int>(
              value: answers[index],
              items: [
                DropdownMenuItem(
                  value: 0,
                  child: Text('0 - Hiçbir Zaman'),
                ),
                DropdownMenuItem(
                  value: 1,
                  child: Text('1 - Bazen'),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text('2 - Sıklıkla'),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text('3 - Her Zaman'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  answers[index] = value!;
                });
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            int totalScore = answers.reduce((a, b) => a + b);
            String result;

            if (totalScore <= 10) {
              result = 'Depresyonun hafif belirtileri var.';
            } else if (totalScore <= 20) {
              result = 'Orta derecede depresyon belirtileri.';
            } else {
              result = 'Ciddi depresyon belirtileri.';
            }

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Sonuç'),
                  content: Text(result),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Tamam'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Sonuçları Görüntüle'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
    );
  }
}

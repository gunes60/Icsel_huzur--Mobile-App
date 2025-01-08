import 'package:flutter/material.dart';

class EmotionalStateTestPage extends StatefulWidget {
  @override
  _EmotionalStateTestPageState createState() => _EmotionalStateTestPageState();
}

class _EmotionalStateTestPageState extends State<EmotionalStateTestPage> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Son zamanlarda kendini nasıl hissediyorsun?',
      'options': ['Çok mutlu', 'Mutlu', 'Hafif üzgün', 'Çok üzgün']
    },
    {
      'question': 'Son 1 hafta içinde enerjini nasıl hissediyorsun?',
      'options': ['Çok yüksek', 'Ortalama', 'Düşük', 'Çok düşük']
    },
    {
      'question': 'Son zamanlarda uyku düzenin nasıl?',
      'options': ['Harika', 'İyi', 'Zorlanıyorum', 'Çok kötü']
    },
    {
      'question': 'Son zamanlarda kendini ne kadar huzurlu hissediyorsun?',
      'options': ['Çok huzurlu', 'Huzurlu', 'Biraz huzursuz', 'Çok huzursuz']
    },
    {
      'question': 'Son bir ayda genel ruh halin nasıl?',
      'options': ['Çoğunlukla pozitif', 'Bazen pozitif', 'Bazen negatif', 'Çoğunlukla negatif']
    },
    {
      'question': 'Son zamanlarda sosyal etkileşimlerde nasıl hissediyorsun?',
      'options': ['Çok iyi, sık sık sosyalleşiyorum', 'Orta seviyede, bazen sosyalleşiyorum', 'Zorlanıyorum, nadiren sosyalleşiyorum', 'Hiç sosyalleşmiyorum']
    },
    {
      'question': 'İş veya okul stresin son zamanlarda nasıl?',
      'options': ['Hiç stresim yok', 'Hafif stresliyim', 'Orta seviyede stresliyim', 'Çok stresliyim']
    },
    {
      'question': 'Son zamanlarda genel sağlığını nasıl hissediyorsun?',
      'options': ['Çok sağlıklıyım', 'Sağlıklıyım', 'Biraz sağlıksız hissediyorum', 'Çok sağlıksız hissediyorum']
    },
    {
      'question': 'Son bir hafta içinde kendini ne kadar yorgun hissettin?',
      'options': ['Hiç yorgun hissetmedim', 'Biraz yorgundum', 'Oldukça yorgundum', 'Çok yorgundum']
    },
    {
      'question': 'Son zamanlarda kendini daha huzurlu hissetmek için ne kadar zaman ayırdın?',
      'options': ['Her gün huzurlu anlar ayırdım', 'Haftada birkaç kez', 'Zor zamanlar geçirdim, hiç ayıramadım', 'Hiç huzurlu anlar ayırmadım']
    },
  ];

  List<int> selectedAnswers = [];
  int score = 0;

  void evaluateAnswers() {
    setState(() {
      score = selectedAnswers.fold(0, (sum, answer) => sum + answer);
    });
  }

  String getCommentary() {
    if (score >= 35) {
      return 'Genel olarak iyi bir ruh haliniz var. Kendinizi oldukça huzurlu ve sağlıklı hissediyorsunuz.';
    } else if (score >= 25) {
      return 'Daha dengeli bir ruh hali içindesiniz, ancak biraz daha fazla dikkat etmeniz gereken alanlar var.';
    } else if (score >= 15) {
      return 'Son zamanlarda stres ve yorgunluk gibi bazı zorluklarla karşılaşıyor olabilirsiniz. Kendinize biraz daha zaman ayırın.';
    } else {
      return 'Duygusal olarak zor bir dönem geçiriyorsunuz. Yardım almak iyi bir fikir olabilir.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Duygusal Durum Testi'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  questions[index]['question'],
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ...questions[index]['options'].map<Widget>((option) {
                int optionIndex = questions[index]['options'].indexOf(option);
                return RadioListTile<int>(
                  title: Text(option),
                  value: optionIndex + 1,
                  groupValue: selectedAnswers.length > index ? selectedAnswers[index] : 0,
                  onChanged: (value) {
                    setState(() {
                      if (selectedAnswers.length > index) {
                        selectedAnswers[index] = value!;
                      } else {
                        selectedAnswers.add(value!);
                      }
                    });
                  },
                );
              }).toList(),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          evaluateAnswers();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Sonuç'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Test Sonucunuz: $score'),
                    SizedBox(height: 10),
                    Text('Yorum: ${getCommentary()}'),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Tamam'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.check),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

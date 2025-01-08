import 'package:flutter/material.dart';

class EmotionSelectionPage extends StatefulWidget {
  @override
  _EmotionSelectionPageState createState() => _EmotionSelectionPageState();
}

class _EmotionSelectionPageState extends State<EmotionSelectionPage> {
  String _selectedEmotion = '';
  String _emotionDescription = '';

  final Map<String, String> _emotionDescriptions = {
    'Yorgun': 'Hayat bazen üzerimize ağır gelebilir, ama unutma ki her fırtınanın ardında güneş doğar. Bugün belki zor geçiyor olabilir, ama bu zorluğun seni daha güçlü yapacağını bil. Her adımında, küçük de olsa, ileriye doğru gittiğini unutma. İçindeki gücü hisset ve asla pes etme. Sen, bu dünyanın harika bir parçasısın ve daha iyi günler çok yakında. 💪🌟.',
    'Stresli': 'Unutma, bu stresli anlar da geçecek. Kendine küçük bir mola ver, derin bir nefes al ve yeniden başlamaya hazır ol. Güçlü olduğunu ve bu zorlukları aşabileceğini biliyorum.',
    'Mutlu': 'Mutluluğunu paylaşmak harika! Bu anın tadını çıkar ve çevrendeki güzelliklere odaklan. Senin mutluluğun etrafına da ışık saçıyor. 😊🌞',
    'Heyecanlı': 'Heyecanın müthiş! Bu heyecan, seni yeni fırsatlara götürecek bir enerji. Cesur ol, adımını at ve bu yolculuğun tadını çıkar. Büyük başarılar seni bekliyor. 🎉',
    'Kaygılı': 'Kaygıların olabilir, bu çok normal. Derin bir nefes al ve unutma ki her şey yoluna girecek. Küçük adımlarla ilerle ve kendine güven; bu duygular seni tanımlar ama seni tanımlamaz.',
    'Normal': 'Bugün her şey yolunda gibi görünüyor, ve bu da harika. Hayatın bu dengeli anlarının tadını çıkar ve küçük mutlulukları kutlamayı unutma. Sen harikasın! 😊',
    'Mutsuz': 'Mutsuz hissetmek de hayatın bir parçası. Bu duygularını kabul et ve kendine nazik ol. Bu zor anlar geçecek ve daha güçlü, daha mutlu günler gelecek. Unutma, yalnız değilsin ve iyileşmek zaman alır. 😞',
    'Gururlu': 'Gurur duymak, başarılarının bir sonucudur ve bu anı hak ettiğini unutma. Kendinle gurur duyman, gelecekteki başarılarına ilham verecek. Başardığın her şey, azminin ve çalışkanlığının bir kanıtıdır. Bu başarıları kutla ve kendine teşekkür et. Sen harikasın! 🎉',
    'Kızgın': 'Öfkeni anlamak ve kabul etmek, duygularınla sağlıklı bir şekilde başa çıkmanın ilk adımıdır. Şu an kızgın olabilirsin, ama bu güçlü hislerinin seni daha bilinçli ve güçlü kılmasına izin ver. Derin bir nefes al, sakinleş ve enerjini olumlu bir şeye yönlendir. Senin kontrolünde olmayan şeyleri bırak ve odaklanabileceğin şeylere odaklan. Unutma, bu da geçecek ve sen daha güçlü olacaksın. 💪✨',
    'Şaşkın': 'Şaşkınlık, yeni şeyler öğrenmenin ve keşfetmenin bir parçasıdır. Bu duyguyu kucakla ve seni nereye götüreceğini gör. Her yeni bilgi, seni daha da zenginleştirir. 🌟',
    'Huzurlu': 'Huzur, içsel bir denge ve sakinlik halidir. Bu anın tadını çıkar ve bu huzuru korumak için elinden geleni yap. Senin huzurun, çevrendekilere de yansır. 🌿',
    'Motivasyonlu': 'Motivasyonun harika! Bu enerjiyi kullanarak hedeflerine ulaşmak için adımlar at. Senin azmin ve kararlılığın, büyük başarıların anahtarıdır. 🚀',
    'Üzgün': 'Üzgün hissetmek de hayatın bir parçası. Bu duygularını kabul et ve kendine nazik ol. Bu zor anlar geçecek ve daha güçlü, daha mutlu günler gelecek. Unutma, yalnız değilsin ve iyileşmek zaman alır. 😞',
    'Şüpheli': 'Şüphe, bilinmeyenle yüzleşmenin doğal bir parçasıdır. Bu duyguyu kabul et ve seni rahatsız eden konuları araştır. Bilgi, şüpheyi yenmenin en güçlü yoludur. 🔍',
    'İlhamlı': 'İlham, yaratıcılığın ve yeniliklerin kaynağıdır. Bu duyguyu kucakla ve seni nereye götüreceğini gör. Büyük fikirler, küçük bir ilham kıvılcımıyla başlar. 💡',
    'Korkmuş': 'Korku, bilinmeyenle yüzleşmenin doğal bir parçasıdır. Bu duyguyu kabul et ve seni rahatsız eden konuları araştır. Bilgi, korkuyu yenmenin en güçlü yoludur. 🔍',
    'Meraklı': 'Merak, öğrenmenin ve keşfetmenin ilk adımıdır. Bu duyguyu kucakla ve seni nereye götüreceğini gör. Her yeni bilgi, seni daha da zenginleştirir. 🔍',
    'Rahatlamış': 'Rahatlamış hissetmek, içsel bir denge ve sakinlik halidir. Bu anın tadını çıkar ve bu huzuru korumak için elinden geleni yap. Senin huzurun, çevrendekilere de yansır. 🌿',
  };

  final Map<String, Color> _emotionColors = {
    'Yorgun': Colors.grey,
    'Stresli': Colors.redAccent,
    'Mutlu': Colors.yellow,
    'Heyecanlı': Colors.orange,
    'Kaygılı': Colors.blueAccent,
    'Normal': Colors.green,
    'Mutsuz': Colors.blue,
    'Gururlu': Colors.purple,
    'Kızgın': Colors.red,
    'Şaşkın': Colors.pink,
    'Huzurlu': Colors.lightGreen,
    'Motivasyonlu': Colors.teal,
    'Üzgün': Colors.indigo,
    'Şüpheli': Colors.brown,
    'İlhamlı': Colors.amber,
    'Korkmuş': Colors.deepOrange,
    'Meraklı': Colors.cyan,
    'Rahatlamış': Colors.lightBlue,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Duygusal Durum Seçimi'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 3,
          children: _emotionDescriptions.keys.map((emotion) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _emotionColors[emotion], // Buton rengi
                ),
                onPressed: () {
                  setState(() {
                    _selectedEmotion = emotion;
                    _emotionDescription = _emotionDescriptions[emotion]!;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      emotion,
                      style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      _getEmotionEmoji(emotion),
                      style: TextStyle(fontSize: 40),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
      bottomSheet: _selectedEmotion.isNotEmpty
          ? Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Seçilen Duygu: $_selectedEmotion',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              _emotionDescription,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      )
          : null,
    );
  }

  String _getEmotionEmoji(String emotion) {
    switch (emotion) {
      case 'Yorgun':
        return '😴';
      case 'Stresli':
        return '😰';
      case 'Mutlu':
        return '😊';
      case 'Heyecanlı':
        return '🤩';
      case 'Kaygılı':
        return '😟';
      case 'Normal':
        return '😌';
      case 'Mutsuz':
        return '😞';
      case 'Gururlu':
        return '😎';
      case 'Kızgın':
        return '😡';
      case 'Şaşkın':
        return '😲';
      case 'Huzurlu':
        return '😌';
      case 'Motivasyonlu':
        return '💪';
      case 'Üzgün':
        return '😢';
      case 'Şüpheli':
        return '🤔';
      case 'İlhamlı':
        return '💡';
      case 'Korkmuş':
        return '😱';
      case 'Meraklı':
        return '🔍';
      case 'Rahatlamış':
        return '😌';
      default:
        return '';
    }
  }
}
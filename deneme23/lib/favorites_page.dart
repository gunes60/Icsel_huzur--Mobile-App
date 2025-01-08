import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<String> favoritePsychologists = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  // Favorileri SharedPreferences'tan yükle
  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    setState(() {
      favoritePsychologists = favorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorilerim'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: favoritePsychologists.isEmpty
            ? Center(child: Text('Favori psikologunuz yok.'))
            : ListView.builder(
          itemCount: favoritePsychologists.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              elevation: 4.0,
              child: ListTile(
                title: Text(favoritePsychologists[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}

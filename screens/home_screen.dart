import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../models/manga_model.dart';
import '../widgets/web_banner.dart';

class HomeScreen extends StatelessWidget {
  final List<Manga> mangas = [
    Manga(id: "1", title: "One Piece", coverUrl: "https://via.placeholder.com/150x200?text=One+Piece"),
    Manga(id: "2", title: "Attack on Titan", coverUrl: "https://via.placeholder.com/150x200?text=Attack+on+Titan"),
    Manga(id: "3", title: "Demon Slayer", coverUrl: "https://via.placeholder.com/150x200?text=Demon+Slayer"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mangás")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner apenas na Web
            if (kIsWeb) WebBanner(),

            // GridView de mangás
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _getCrossAxisCount(context),
                childAspectRatio: 0.7,
              ),
              itemCount: mangas.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => _navigateToMangaDetails(context, mangas[index]),
                  child: Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            mangas[index].coverUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(mangas[index].title),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Responsividade: Web (mais colunas) vs Mobile (menos colunas)
  int _getCrossAxisCount(BuildContext context) {
    if (kIsWeb) {
      return MediaQuery.of(context).size.width > 1200 ? 5 : 3;
    } else {
      return 2;
    }
  }

  void _navigateToMangaDetails(BuildContext context, Manga manga) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChapterListScreen(manga: manga)),
    );
  }
}
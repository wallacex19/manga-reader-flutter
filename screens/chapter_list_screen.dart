import 'package:flutter/material.dart';
import '../models/manga_model.dart';
import 'reader_screen.dart';

class ChapterListScreen extends StatelessWidget {
  final Manga manga;

  const ChapterListScreen({Key? key, required this.manga}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(manga.title)),
      body: ListView.builder(
        itemCount: 10, // Exemplo: 10 capítulos
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Capítulo ${index + 1}"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReaderScreen(
                    chapter: Chapter(
                      id: "${index + 1}",
                      mangaId: manga.id,
                      title: "Capítulo ${index + 1}",
                      pageUrls: List.generate(
                        10,
                        (i) => "https://via.placeholder.com/500x800?text=${manga.title}+Cap${index+1}+Pag${i+1}",
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
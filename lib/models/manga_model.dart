class Manga {
  final String id;
  final String title;
  final String coverUrl;
  
  Manga({required this.id, required this.title, required this.coverUrl});
}

class Chapter {
  final String id;
  final String mangaId;
  final String title;
  final List<String> pageUrls;
  
  Chapter({
    required this.id,
    required this.mangaId,
    required this.title,
    required this.pageUrls,
  });
}
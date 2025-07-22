import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/manga_model.dart';

class ReaderScreen extends StatelessWidget {
  final Chapter chapter;

  const ReaderScreen({Key? key, required this.chapter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(chapter.title)),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: chapter.pageUrls.length,
        itemBuilder: (context, index) {
          return CachedNetworkImage(
            imageUrl: chapter.pageUrls[index],
            fit: BoxFit.contain,
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          );
        },
      ),
    );
  }
}
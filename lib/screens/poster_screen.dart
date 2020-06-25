import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PosterScreen extends StatelessWidget {
  final String posterUrl;
  PosterScreen({@required this.posterUrl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        child: PhotoView(
          imageProvider: NetworkImage(posterUrl),
          minScale: PhotoViewComputedScale.contained * 1,
          maxScale: PhotoViewComputedScale.covered * 2,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_main/domain/entities/videos_post.dart';
import 'package:flutter_main/infrastructure/models/local_video_model.dart';
import 'package:flutter_main/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
  List<VideosPost> videos = [];
  bool initialLoading = true;

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideosPost> newVideos = videoPosts
        .map((el) => LocalVideoModel.fromJSONMap(el).toVideoPostEntity())
        .toList();

    videos.addAll(newVideos);
    initialLoading = false;

    notifyListeners();
  }
}

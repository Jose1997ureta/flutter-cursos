import 'package:flutter_main/domain/entities/videos_post.dart';

class LocalVideoModel {
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel(
      {required this.name,
      required this.videoUrl,
      required this.likes,
      required this.views});

  factory LocalVideoModel.fromJSONMap(Map<String, dynamic> json) =>
      LocalVideoModel(
          name: json["name"],
          videoUrl: json["videoUrl"],
          likes: json["likes"],
          views: json["views"]);

  VideosPost toVideoPostEntity() =>
      VideosPost(caption: name, videoUrl: videoUrl, likes: likes, views: views);
}

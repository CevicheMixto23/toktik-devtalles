import 'package:flutter/material.dart';
import 'package:toktik_devtalles/domain/entities/video_post.dart';
import 'package:toktik_devtalles/infrastructure/models/local_video_model.dart';
import 'package:toktik_devtalles/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
  //TODO: Repository, DataSource

  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    //todo:  cargar videos
    await Future.delayed(const Duration(seconds: 2));
    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}

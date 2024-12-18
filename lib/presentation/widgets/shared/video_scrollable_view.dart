import 'package:flutter/material.dart';
import 'package:flutter_main/domain/entities/videos_post.dart';
import 'package:flutter_main/presentation/widgets/shared/full_screen_player.dart';
import 'package:flutter_main/presentation/widgets/shared/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideosPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final item = videos[index];
        return Stack(
          children: [
            /* VIDEO PLAYER */
            SizedBox.expand(
              child: FullScreenPlayer(
                  videoUrl: item.videoUrl, caption: item.caption),
            ),
            /* BUTTON */
            Positioned(bottom: 40, right: 20, child: VideoButtons(video: item))
          ],
        );
      },
    );
  }
}

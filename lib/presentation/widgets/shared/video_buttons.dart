import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_main/config/helpers/formate_number.dart';
import 'package:flutter_main/domain/entities/videos_post.dart';

class VideoButtons extends StatelessWidget {
  final VideosPost video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          icon: Icons.favorite,
          value: video.likes,
          iconColor: Colors.red,
        ),
        _CustomIconButton(
          icon: Icons.remove_red_eye_outlined,
          value: video.likes,
        ),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 3),
          child: const _CustomIconButton(
            icon: Icons.play_circle_outline,
            value: 0,
          ),
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData icon;
  final Color? color;

  const _CustomIconButton({required this.value, required this.icon, iconColor})
      : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              color: color,
            )),
        if (value > 0)
          Text(
            FormateNumber.formate(value.toDouble()),
            style: const TextStyle(color: Colors.white),
          )
      ],
    );
  }
}

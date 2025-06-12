import 'package:assessment/src/presentation/blocs/reels_cubit/reels_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String url;

  const VideoPlayerWidget({super.key, required this.url});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController? controller;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<ReelsCubit>();
    cubit.initializeVideo(widget.url);
    controller = cubit.state.controllerCache[widget.url];
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ReelsCubit>();
    final controller = cubit.state.controllerCache[widget.url];

    if (cubit.state.error) {
      return const Center(
        child: Text(
          "Error loading video",
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    if (controller != null && controller.value.isInitialized) {
      return GestureDetector(
        onTap: () {
          if (controller.value.isPlaying) {
            controller.pause();
          } else {
            controller.play();
          }
        },
        child: Center(
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(controller),
          ),
        ),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}

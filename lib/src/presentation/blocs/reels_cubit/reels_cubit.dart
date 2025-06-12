import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:assessment/src/data/models/reel_model.dart';
import 'package:assessment/src/data/repositories/reel_repository.dart';

part 'reels_state.dart';

class ReelsCubit extends Cubit<ReelsState> {
  ReelsCubit()
    : super(
        ReelsState(
          reels: [],
          controllerCache: {},
          pageController: PageController(),
          currentUrl: null,
        ),
      );

  int page = 1;
  int limit = 1;

  Future<void> fetchData() async {
    final data = await ReelRepository.fetchReels(page: page, limit: limit);
    emit(state.copyWith(reels: data));
  }

  Future<void> needMoreData() async {
    limit++;
    final newData = await ReelRepository.fetchReels(page: page, limit: limit);
    if (newData.isNotEmpty) {
      final updated = List<Datum>.from(state.reels)..add(newData.last);
      emit(state.copyWith(reels: updated));
    }
  }

  void onPageChanged(int index) {
    if (state.currentUrl != null &&
        state.controllerCache.containsKey(state.currentUrl)) {
      state.controllerCache[state.currentUrl!]!.pause();
      state.controllerCache[state.currentUrl!]!.seekTo(Duration.zero);
    }

    if (index < state.reels.length) {
      final nextUrl = state.reels[index].cdnUrl!;
      if (state.controllerCache.containsKey(nextUrl)) {
        state.controllerCache[nextUrl]!.play();
        emit(state.copyWith(currentUrl: nextUrl));
      }
    }

    if (index == state.reels.length) {
      needMoreData();
    }
  }

  Future<void> initializeVideo(String url) async {
    if (state.controllerCache.containsKey(url)) {
      emit(state.copyWith(currentUrl: url));
      state.controllerCache[url]!.play();
    } else {
      try {
        final controller = VideoPlayerController.networkUrl(Uri.parse(url));
        await controller.initialize();
        controller.setLooping(true);
        controller.play();

        final updatedCache = Map<String, VideoPlayerController>.from(
          state.controllerCache,
        )..[url] = controller;

        emit(state.copyWith(controllerCache: updatedCache, currentUrl: url));
      } catch (_) {
        emit(state.copyWith(error: true));
      }
    }
  }

  @override
  Future<void> close() async {
    for (var controller in state.controllerCache.values) {
      await controller.dispose();
    }
    state.pageController.dispose();
    return super.close();
  }
}

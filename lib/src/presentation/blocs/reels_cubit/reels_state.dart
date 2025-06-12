part of 'reels_cubit.dart';

class ReelsState {
  final List<Datum> reels;
  final Map<String, VideoPlayerController> controllerCache;
  final PageController pageController;
  final String? currentUrl;
  final bool error;

  ReelsState({
    required this.reels,
    required this.controllerCache,
    required this.pageController,
    required this.currentUrl,
    this.error = false,
  });

  ReelsState copyWith({
    List<Datum>? reels,
    Map<String, VideoPlayerController>? controllerCache,
    String? currentUrl,
    bool? error,
  }) {
    return ReelsState(
      reels: reels ?? this.reels,
      controllerCache: controllerCache ?? this.controllerCache,
      pageController: pageController,
      currentUrl: currentUrl ?? this.currentUrl,
      error: error ?? this.error,
    );
  }
}

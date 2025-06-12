import 'package:assessment/src/presentation/blocs/reels_cubit/reels_cubit.dart';
import 'package:assessment/src/presentation/widgets/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReelsCubit, ReelsState>(
      builder: (context, state) {
        final cubit = context.read<ReelsCubit>();
    
        if (state.reels.isEmpty) {
          return const Scaffold(
            backgroundColor: Colors.black,
            body: Center(child: CircularProgressIndicator()),
          );
        }
    
        return Scaffold(
          backgroundColor: Colors.black,
          body: PageView.builder(
            controller: state.pageController,
            scrollDirection: Axis.vertical,
            itemCount: state.reels.length + 1,
            onPageChanged: cubit.onPageChanged,
            itemBuilder: (context, index) {
              if (index == state.reels.length) {
                return const Center(child: CircularProgressIndicator());
              }
    
              final url = state.reels[index].cdnUrl!;
              return VideoPlayerWidget(url: url);
            },
          ),
        );
      },
    );
  }
}

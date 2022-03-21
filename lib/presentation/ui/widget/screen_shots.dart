import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_collections/Data/model/game_screenshots.dart';
import 'package:game_collections/controller/generic_state_notifier.dart';
import 'package:game_collections/presentation/component/loading_progress.dart';
import 'package:game_collections/presentation/ui/gameScreenshot/bloc/game_screen_shots_bloc.dart';

class ScreenShots extends StatelessWidget {
  const ScreenShots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenShotBloc, RequestState<GameScreenShots>>(
        builder: ((context, state) {
      return state.when(
        idle: () => const LoadingProgress(),
        loading: () => const LoadingProgress(),
        error: (Object e, StackTrace s) => Text(e.toString()),
        success: (data) {
          return SizedBox(
            height: 100,
            child: ListView.separated(
              cacheExtent: 9999,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              itemCount: data!.results!.length,
              itemBuilder: (context, index) {
                final shots = data.results![index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: CachedNetworkImage(
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => Image.asset(
                            'images/noimage.jpg',
                            width: 20,
                            height: 20,
                          ),
                      placeholder: (context, url) => const LoadingProgress(),
                      imageUrl: shots.image.toString()),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 10,
                );
              },
            ),
          );
        },
      );
    }));
  }
}

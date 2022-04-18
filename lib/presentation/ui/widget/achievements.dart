import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_collections/Data/model/game_achievements.dart';
import 'package:game_collections/controller/generic_state_notifier.dart';
import 'package:game_collections/presentation/component/loading_progress.dart';
import 'package:game_collections/presentation/ui/bloc/achievements_bloc.dart';
import 'package:game_collections/presentation/util/space_util.dart';

class AchievementView extends StatelessWidget {
  const AchievementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AchievementsBloc, RequestState<GameAchievements>>(
        builder: (context, state) {
      return state.when(
        idle: () => const LoadingProgress(),
        loading: () => const LoadingProgress(),
        error: (Object e, StackTrace s) => Text(e.toString()),
        success: (data) {
          return SizedBox(
            height: 150,
            child: ListView.separated(
              cacheExtent: 9999,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              itemCount: data!.results!.length,
              itemBuilder: (context, index) {
                final shots = data.results![index];
                return Column(
                  children: [
                    ClipRRect(
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
                          placeholder: (context, url) =>
                              const LoadingProgress(),
                          imageUrl: shots.image.toString()),
                    ),
                    const Space(10),
                    Text(
                      shots.name.toString(),
                      style: const TextStyle(
                          height: 1.4,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ],
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
    });
  }
}

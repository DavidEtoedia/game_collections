import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_collections/Data/model/games.dart';
import 'package:game_collections/controller/generic_state_notifier.dart';
import 'package:game_collections/presentation/component/loading_progress.dart';
import 'package:game_collections/presentation/ui/helper/app_image.dart';
import 'package:game_collections/presentation/ui/helper/rating_star.dart';
import 'package:game_collections/presentation/ui/sinlge_game/bloc/single_game_bloc.dart';
import 'package:game_collections/presentation/util/space_util.dart';

class GameHeader extends StatelessWidget {
  const GameHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingleGameBloc, RequestState<Games>>(
        builder: (context, state) {
      return state.when(
        idle: () => const CircularProgressIndicator(),
        loading: () => const CircularProgressIndicator(),
        error: (e, s) => Text(e.toString()),
        success: (data) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: ShaderMask(
                        shaderCallback: (Rect bound) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black54],
                            stops: [
                              0.0,
                              0.7
                            ], // 10% purple, 80% transparent, 10% purple
                          ).createShader(bound);
                        },
                        blendMode: BlendMode.dstOut,
                        child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            placeholder: (context, url) =>
                                const LoadingProgress(),
                            errorWidget: (context, url, error) => SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset(
                                    'images/noimage.jpg',
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                            imageUrl: data!.results![13].backgroundImage),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    right: 15,
                    bottom: 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          data.results![13].name.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'reviews:${data.results![13].reviewsCount.toString()}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                        SmoothStarRating(
                          starCount: data.results![13].rating!.toInt(),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      left: 280,
                      right: 0,
                      bottom: 20,
                      child: SizedBox(
                        width: 10,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              AppImage.ps,
                              height: 20,
                              width: 20,
                            ),
                            const Space(15),
                            Image.asset(
                              AppImage.xboxx,
                              height: 20,
                              width: 20,
                            )
                          ],
                        ),
                      ))
                ],
              ),
              const Space(10),
              Text(
                data.results![13].name.toString(),
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          );
        },
      );
    });
  }
}

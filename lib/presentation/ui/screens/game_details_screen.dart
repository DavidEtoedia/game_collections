import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_collections/Data/model/game_detail.dart';
import 'package:game_collections/controller/generic_state_notifier.dart';
import 'package:game_collections/presentation/component/loading_progress.dart';
import 'package:game_collections/presentation/ui/Game%20detail/bloc/games_details_dart_bloc.dart';
import 'package:game_collections/presentation/ui/cubit/appstate_cubit.dart';
import 'package:game_collections/presentation/ui/widget/screen_shots.dart';
import 'package:game_collections/presentation/util/space_util.dart';

import '../helper/rating_star.dart';

class GameDetailsScreen extends StatelessWidget {
  // final int gameId;
  const GameDetailsScreen({
    Key? key,
    // required this.gameId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<GamesDetailsBloc>(context).add(GetGamesDetail(gameId));
    final vm = context.watch<AppstateCubit>();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0Xff29282b),
            Color(0Xff1b2231),
          ],
        )),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          child: Column(
            children: [
              BlocBuilder<GamesDetailsBloc, RequestState<GameDetails>>(
                builder: (context, state) {
                  return state.when(
                    idle: () => const LoadingProgress(),
                    loading: () => const LoadingProgress(),
                    error: (Object e, StackTrace s) => Text(e.toString()),
                    success: (data) {
                      final maxline = vm.state ? null : 6;
                      return Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    errorWidget: (context, url, error) =>
                                        SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: Image.asset(
                                            'images/noimage.jpg',
                                            width: 20,
                                            height: 20,
                                          ),
                                        ),
                                    placeholder: (context, url) =>
                                        const LoadingProgress(),
                                    imageUrl: data!.backgroundImage.toString()),
                              ),
                              const Space(20),
                              Text(
                                data.name.toString(),
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              ),
                              const Space(10),
                              StarRating(
                                  allowHalfRating: true,
                                  starCount: data.rating!.toInt(),
                                  spacing: 0.0),
                              const Space(20),
                              const ScreenShots(),
                              const Space(20),
                              const Text(
                                'Description',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              const Space(12),
                              Text(
                                data.descriptionRaw.toString(),
                                maxLines: maxline,
                                style: const TextStyle(
                                    height: 1.4,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                              InkWell(
                                onTap: () {
                                  context.read<AppstateCubit>().toggleButton();
                                },
                                child: Text(
                                  vm.state == false ? 'Read more' : 'Read less',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blueAccent),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              const Space(30),
            ],
          ),
        ),
      ),
    );
  }
}

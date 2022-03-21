import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_collections/Data/model/games.dart';
import 'package:game_collections/presentation/util/app_nav.dart';
import 'package:game_collections/presentation/util/space_util.dart';
import 'package:intl/intl.dart';

import '../../../component/loading_progress.dart';
import '../../Game detail/bloc/games_details_dart_bloc.dart';
import '../../bloc/gamezz_bloc.dart';
import '../../helper/rating_star.dart';
import '../../screens/game_details_screen.dart';

class GameListView extends StatefulWidget {
  const GameListView({Key? key}) : super(key: key);

  @override
  State<GameListView> createState() => _GameListViewState();
}

class _GameListViewState extends State<GameListView>
    with AutomaticKeepAliveClientMixin {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        BlocConsumer<GamezzBloc, GamezzState>(listener: ((context, state) {
          if (state.status == GamezzStatus.initial) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Lets play baby')));
          }
        }), builder: (_, state) {
          switch (state.status) {
            case GamezzStatus.failure:
              return Center(child: Text(state.errorMessage.toString()));
            case GamezzStatus.success:
              if (state.result.isEmpty) {
                return const Center(child: Text('no posts'));
              }

              // BlocProvider.of<GamezzBloc>(context)
              //     .add(Scrollfetch(_scrollController));
              _setupScrollController();
              return Expanded(
                child: ListView.builder(
                  cacheExtent: 9999,
                  physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  // shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),

                  itemBuilder: (BuildContext context, int index) {
                    if (index < state.result.length) {
                      final value = state.result[index];
                      return GamesListBuild(games: value);
                      // return const LoadingProgress();
                    } else {
                      return const LoadingProgress();
                    }
                  },
                  itemCount: state.result.length + (state.isLoading ? 1 : 0),

                  controller: _scrollController,
                ),
              );
            // ListView.builder(
            //   itemBuilder: (BuildContext context, int index) {
            //     return index >= state.result.length
            //         ? const CircularProgressIndicator()
            //         :
            //   },
            //   itemCount: state.hasReachedMax
            //       ? state.result.length
            //       : state.result.length + 1,

            default:
              return const Center(child: CircularProgressIndicator());
          }
        }),
      ],
    );
  }

  void _setupScrollController() {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          context.read<GamezzBloc>().add(GamezzFetch());
        }
      }
    });
  }

  @override
  bool get wantKeepAlive => true;
}

class GamesListBuild extends StatelessWidget {
  final Result games;
  const GamesListBuild({Key? key, required this.games}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime relDate = games.released!;
    final date = DateFormat.yMMMM().format(relDate);
    return InkWell(
        onTap: () {
          context.navigate(const GameDetailsScreen(
              // gameId: games.id!.toInt(),
              ));
          context
              .read<GamesDetailsBloc>()
              .add(GetGamesDetail(games.id!.toInt()));
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0Xff1d1d1f)),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,

              children: [
                // const Space(10),
                Container(
                  padding: const EdgeInsets.all(13),
                  height: 150,
                  width: 140,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(
                        height: 140,
                        width: 140,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => Image.asset(
                              'images/noimage.jpg',
                              width: 20,
                              height: 20,
                            ),
                        placeholder: (context, url) => const LoadingProgress(),
                        imageUrl: games.backgroundImage.toString()),
                  ),
                ),
                // const Space(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      margin: const EdgeInsets.only(
                        top: 15,
                      ),
                      child: Text(
                        games.name.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            height: 1.2,
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Space(8),
                    Text(
                      'play time: ${games.playtime.toString()}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                    const Space(8),
                    StarRating(
                      starCount: games.rating!.toInt(),
                    ),
                    const Space(8),
                    Text(
                      "released: $date",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

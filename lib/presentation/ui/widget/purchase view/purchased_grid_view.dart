import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_collections/Data/model/games.dart';
import 'package:game_collections/presentation/ui/Games/gamezz_bloc.dart';
import 'package:game_collections/presentation/ui/bloc/achievements_bloc.dart';
import 'package:game_collections/presentation/ui/gameScreenshot/bloc/game_screen_shots_bloc.dart';
import 'package:game_collections/presentation/ui/purchased/bloc/purchased_games_bloc.dart';
import 'package:game_collections/presentation/util/app_nav.dart';

import '../../../component/loading_progress.dart';
import '../../Game detail/bloc/games_details_dart_bloc.dart';
import '../../screens/game_details_screen.dart';

class PurchasedGridView extends StatefulWidget {
  const PurchasedGridView({Key? key}) : super(key: key);

  @override
  State<PurchasedGridView> createState() => _PurchasedGridViewState();
}

class _PurchasedGridViewState extends State<PurchasedGridView>
    with AutomaticKeepAliveClientMixin {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        BlocConsumer<PurchasedGamesBloc, PurchasedGameState>(
            listener: ((context, state) {
          if (state.status == PurchasedStatus.initial) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Lets play baby')));
          }
        }), builder: (_, state) {
          switch (state.status) {
            case PurchasedStatus.failure:
              return Center(child: Text(state.errorMessage.toString()));
            case PurchasedStatus.success:
              if (state.result.isEmpty) {
                return const Center(child: Text('no posts'));
              }

              // BlocProvider.of<GamezzBloc>(context)
              //     .add(Scrollfetch(_scrollController));
              _setupScrollController();
              return Expanded(
                child: GridView.builder(
                  physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  // shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  cacheExtent: 9999,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1.25),
                  itemBuilder: (BuildContext context, int index) {
                    if (index < state.result.length) {
                      final value = state.result[index];
                      return GamesImages(games: value);
                      // return const LoadingProgress();
                    } else {
                      return const LoadingProgress();
                    }
                  },
                  itemCount: state.result.length + (state.isLoading ? 2 : 0),

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
          context.read<PurchasedGamesBloc>().add(FetchPurchased());
        }
      }
    });
  }

  @override
  bool get wantKeepAlive => true;
}

class GamesImages extends StatelessWidget {
  final Result games;
  const GamesImages({Key? key, required this.games}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.navigate(const GameDetailsScreen(
            // gameId: games.id!.toInt(),
            ));
        context.read<GamesDetailsBloc>().add(GetGamesDetail(games.id!.toInt()));
        context
            .read<ScreenShotBloc>()
            .add(GetScreenShot(screenShotId: games.slug.toString()));
        context
            .read<AchievementsBloc>()
            .add(FetchAchievements(games.id!.toInt()));
      },
      child: SizedBox(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: CachedNetworkImage(
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset(
                      'images/noimage.jpg',
                      width: 20,
                      height: 20,
                    ),
                  ),
              placeholder: (context, url) => const LoadingProgress(),
              imageUrl: games.backgroundImage),
        ),
      ),
    );
  }
}

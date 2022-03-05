import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_collections/Data/model/games.dart';
import 'package:game_collections/presentation/component/loading_progress.dart';
import 'package:game_collections/presentation/ui/bloc/gamezz_bloc.dart';
import 'package:game_collections/presentation/ui/helper/tab_helper.dart';
import 'package:game_collections/presentation/ui/screens/game_details_screen.dart';
import 'package:game_collections/presentation/util/app_nav.dart';
import 'package:game_collections/presentation/util/space_util.dart';

class TabBarVieww extends StatefulWidget {
  const TabBarVieww({Key? key}) : super(key: key);

  @override
  State<TabBarVieww> createState() => _TabBarViewwState();
}

class _TabBarViewwState extends State<TabBarVieww>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final _selectedSegment_05 = ValueNotifier('all');

    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Space(50),
        AdvancedSegment(controller: _selectedSegment_05, segments: const {
          'all': 'All',
          'missed': 'Missed',
        }),
        SizedBox(
          height: 694,
          child: Center(
              child: ValueListenableBuilder<String>(
                  valueListenable: _selectedSegment_05,
                  builder: (_, key, __) {
                    switch (key) {
                      case 'all':
                        return const GameList();

                      case 'missed':
                        return Container(
                          color: Colors.red,
                          height: 200,
                        );
                      default:
                        return const SizedBox();
                    }
                  })),
        )
      ],
    ));
  }

  @override
  bool get wantKeepAlive => true;
}

class GameList extends StatefulWidget {
  const GameList({Key? key}) : super(key: key);

  @override
  State<GameList> createState() => _GameListState();
}

class _GameListState extends State<GameList>
    with AutomaticKeepAliveClientMixin {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          BlocConsumer<GamezzBloc, GamezzState>(listener: ((context, state) {
            if (state.status == GamezzStatus.initial) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Lets play baby')));
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
                  child: GridView.builder(
                    // shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    cacheExtent: 9999,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
      ),
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

class GamesImages extends StatelessWidget {
  final Result games;
  const GamesImages({Key? key, required this.games}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.navigate(GameDetailsScreen(
          gameId: games.id!.toInt(),
        ));
        // context.read<GamesDetailsBloc>().add(GetGamesDetail(games.id!.toInt()));
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

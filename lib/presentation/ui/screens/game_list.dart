import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_collections/Data/model/games.dart';
import 'package:game_collections/presentation/component/loading_progress.dart';
import 'package:game_collections/presentation/ui/bloc/gamezz_bloc.dart';
import 'package:game_collections/presentation/ui/screens/game_details_screen.dart';
import 'package:game_collections/presentation/util/app_nav.dart';
import 'package:game_collections/presentation/util/space_util.dart';

import '../Game detail/bloc/games_details_dart_bloc.dart';

class NewTabView extends StatefulWidget {
  const NewTabView({Key? key}) : super(key: key);

  @override
  State<NewTabView> createState() => _NewTabViewState();
}

class _NewTabViewState extends State<NewTabView> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // _tabController.animateTo(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black45,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0Xff29282b),
                Color(0Xff1b2231),
              ],
            )),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 150,
                    top: 7,
                    child: Container(
                      height: 47,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0Xff1d1d1f)),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              // padding: const EdgeInsets.only(left: 21, right: 18),
                              height: 40,
                              width: 200,
                              child: TabBar(
                                isScrollable: false,
                                controller: _tabController,
                                labelColor: Colors.white,
                                labelStyle: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                                unselectedLabelStyle: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                                unselectedLabelColor: Colors.white,
                                labelPadding: EdgeInsets.zero,
                                indicatorPadding: EdgeInsets.zero,
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0Xff29282b),
                                ),
                                tabs: const [
                                  Tab(
                                    child: Text(
                                      'played',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      'Purchased',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.grid_view,
                              color: Colors.white,
                            ),
                            const Space(20),
                            const Icon(
                              Icons.list,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        const Space(15),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 645,
                          // color: Colors.grey,
                          child:
                              TabBarView(controller: _tabController, children: [
                            const GameList(),
                            Container(
                              color: Colors.red,
                            )

                            // TechTab(),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
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
                child: GridView.builder(
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
        context.navigate(const GameDetailsScreen(
            // gameId: games.id!.toInt(),
            ));
        context.read<GamesDetailsBloc>().add(GetGamesDetail(games.id!.toInt()));
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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_collections/Data/model/games.dart';
import 'package:game_collections/presentation/ui/bloc/gamezz_bloc.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    void setupScrollController() {
      _scrollController.addListener(() {
        if (_scrollController.position.atEdge) {
          if (_scrollController.position.pixels != 0) {
            context.read<GamezzBloc>().add(GamezzFetch());
          }
        }
      });
    }

    return BlocConsumer<GamezzBloc, GamezzState>(listener: ((context, state) {
      if (state.status == GamezzStatus.initial) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Lets play baby')));
      }
    }), builder: (context, state) {
      switch (state.status) {
        case GamezzStatus.failure:
          return Center(child: Text(state.errorMessage.toString()));
        case GamezzStatus.success:
          if (state.result.isEmpty) {
            return const Center(child: Text('no posts'));
          }

          setupScrollController();
          return Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              cacheExtent: 9999,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 1.25),
              itemBuilder: (BuildContext context, int index) {
                if (index >= state.result.length) {
                  return const Text('Loading');
                }

                return GamesImages(games: state.result[index]);
              },
              itemCount: state.hasReachedMax
                  ? state.result.length
                  : state.result.length + 1,
              controller: _scrollController,
            ),
          );
        // ListView.builder(
        //   itemBuilder: (BuildContext context, int index) {
        //     return index >= state.result.length
        //         ? const CircularProgressIndicator()
        //         :
        //         // PostListItem(post: state.posts[index]);
        //         BeerListItem(state.result[index]);
        //   },
        //   itemCount: state.hasReachedMax
        //       ? state.result.length
        //       : state.result.length + 1,

        //   // state.result.length + (state.isLoading ? 1 : 0),
        //   // ? _beers.length
        //   // : state.games!.results!.length + 1,
        //   controller: _scrollController,
        // );
        default:
          return const Center(child: CircularProgressIndicator());
      }
    });
  }
}

class GamesImages extends StatelessWidget {
  final Result games;
  const GamesImages({Key? key, required this.games}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            imageUrl: games.backgroundImage),
      ),
    );
  }
}

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  _LoadingAnimationState createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey.shade50,
        enabled: true,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.6),
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                height: 20,
                width: 100,
                color: Colors.black26,
              );
            }));
  }
}

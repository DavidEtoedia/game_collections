import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_collections/Data/model/games.dart';
import 'package:game_collections/presentation/ui/bloc/gamezz_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();

  // @override
  // void initState() {
  //   super.initState();
  //   _scrollController.addListener(_onScroll);
  // }

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

    // setupScrollController(context);
    return Scaffold(
      body: BlocBuilder<GamezzBloc, GamezzState>(builder: (context, state) {
        switch (state.status) {
          case GamezzStatus.failure:
            return const Center(child: Text('failed to fetch posts'));
          case GamezzStatus.success:
            if (state.result.isEmpty) {
              return const Center(child: Text('no posts'));
            }
            // _beers.addAll(state.games!.results!);
            setupScrollController();
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.result.length
                    ? const CircularProgressIndicator()
                    :
                    // PostListItem(post: state.posts[index]);
                    BeerListItem(state.result[index]);
              },
              itemCount: state.hasReachedMax
                  ? state.result.length
                  : state.result.length + 1,

              // state.result.length + (state.isLoading ? 1 : 0),
              // ? _beers.length
              // : state.games!.results!.length + 1,
              controller: _scrollController,
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }

  // @override
  // void dispose() {
  //   _scrollController
  //     ..removeListener(_onScroll)
  //     ..dispose();
  //   super.dispose();
  // }

  // void _onScroll() {
  //   if (_isBottom) context.read<GamezzBloc>().add(GamezzFetch());
  // }

  // bool get _isBottom {
  //   if (!_scrollController.hasClients) return false;
  //   final maxScroll = _scrollController.position.maxScrollExtent;
  //   final currentScroll = _scrollController.offset;
  //   return currentScroll >= (maxScroll * 0.9);
  // }
}

class BeerListItem extends StatelessWidget {
  final Result beer;

  const BeerListItem(this.beer);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(beer.name.toString()),
      subtitle: Text(beer.id.toString()),
      childrenPadding: const EdgeInsets.all(16),
      leading: Container(
        margin: EdgeInsets.only(top: 8),
        child: Text(beer.id.toString()),
      ),
      children: [
        Text(
          beer.slug.toString(),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}

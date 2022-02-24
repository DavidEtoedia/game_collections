import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_collections/Data/model/games.dart';
import 'package:game_collections/Data/model/news.dart';
import 'package:game_collections/controller/generic_state_notifier.dart';
import 'package:game_collections/presentation/ui/Games/bloc/games_bloc.dart';
import 'package:game_collections/presentation/ui/collection/coll_cubit.dart';
import 'package:game_collections/presentation/ui/collection/controller.dart';

import 'collection/collection_bloc.dart';
import 'collection/collection_event.dart';
import 'collection/collection_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatefulWidget {
  HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  final _scrollController = ScrollController();

  void setupScrollController(context) {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          BlocProvider.of<CollectionsCubit>(context).loadData();
        }
      }
    });
  }

  @override
  void initState() {
    BlocProvider.of<CollectionsCubit>(context).loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    // final ScrollController _scrollController = ScrollController();

    // BlocProvider.of<GameBloc>(context).add(const GameFetchEvent());
    // final value = context.read<AllNewsBloc>();

    return Scaffold(
      body: BlocBuilder<CollectionsCubit, PostsState>(
        builder: (context, state) {
          if (state is PostsLoading && state.isFirstFetch) {
            return const CircularProgressIndicator();
          }
          // if (state is GameLoadingState) {
          //   _posts = state.oldgames.results!;
          // } else if (state is GameSuccessState) {
          //   _posts = state.games.results!;
          //   // _posts.addAll(state.games.results!);
          // }
          List<Result> result = [];
          bool isLoading = false;
          if (state is PostsLoading) {
            result = state.oldgames;
            isLoading = true;
          } else if (state is PostsLoaded) {
            result = state.gamez;
          }

          return ListView.separated(
            controller: _scrollController,
            itemBuilder: (context, index) {
              if (index < result.length) {
                isLoading = true;
                // setupScrollController(context);

                return BeerListItem(result[index]);
              } else {
                Timer(const Duration(milliseconds: 30), () {
                  _scrollController
                      .jumpTo(_scrollController.position.maxScrollExtent);
                });

                return const CircularProgressIndicator();
              }
            },
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: result.length + (isLoading ? 1 : 0),
          );
        },
      ),
    );
  }
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_collections/Data/repository/game_repo.dart';
import 'package:game_collections/Data/services/game_service.dart';
import 'package:game_collections/presentation/ui/bloc/gamezz_bloc.dart';
import 'package:game_collections/presentation/ui/creators/bloc/creators_bloc.dart';
import 'package:game_collections/presentation/ui/home_page.dart';
import 'package:game_collections/presentation/ui/new%20release/bloc/new_release_bloc.dart';
import 'package:game_collections/presentation/ui/screens/home_screen.dart';

class HomeSetUp extends StatelessWidget {
  const HomeSetUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) => GamesRepository(gamesService: GamesService()),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<GamezzBloc>(
                create: (context) => GamezzBloc()..add(GamezzFetch())),
            BlocProvider<NewReleaseBloc>(
                create: (context) => NewReleaseBloc()..add(NewReleaseFetch())),
            BlocProvider<CreatorsBloc>(
                create: (context) => CreatorsBloc()..add(CreatorFetch()))
          ],
          child: const HomeScreen(),
        ),
      ),
    );
  }
}

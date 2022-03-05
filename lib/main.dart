import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_collections/Data/repository/game_repo.dart';
import 'package:game_collections/presentation/ui/locator/locator.dart';
import 'package:game_collections/presentation/ui/screens/home_screen.dart';
import 'package:game_collections/presentation/util/app_nav.dart';
import 'Data/services/game_service.dart';
import 'presentation/ui/Game detail/bloc/games_details_dart_bloc.dart';
import 'presentation/ui/bloc/gamezz_bloc.dart';
import 'presentation/ui/creators/bloc/creators_bloc.dart';
import 'presentation/ui/new release/bloc/new_release_bloc.dart';
import 'presentation/ui/sinlge_game/bloc/single_game_bloc.dart';
import 'presentation/util/app_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final games = locator.get<GamesRepository>();
    return RepositoryProvider(
      create: (_) => GamesRepository(gamesService: GamesService()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NewReleaseBloc>(
              create: (_) => NewReleaseBloc()..add(NewReleaseFetch())),
          BlocProvider<GamezzBloc>(
              create: (_) => GamezzBloc()..add(GamezzFetch())),
          BlocProvider<CreatorsBloc>(
              create: (_) => CreatorsBloc()..add(CreatorFetch())),
          BlocProvider<SingleGameBloc>(
              create: (_) => SingleGameBloc()..add(SingleGameFetch())),
          BlocProvider<GamesDetailsBloc>(create: (_) => GamesDetailsBloc())
        ],
        child: const GameView(),
      ),
    );
  }
}

class GameView extends StatelessWidget {
  const GameView({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final games = locator.get<GamesRepository>();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigator.key,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen()

        // HomePage(),
        );
  }
}

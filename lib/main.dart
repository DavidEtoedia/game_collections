import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_collections/Data/repository/game_repo.dart';
import 'package:game_collections/presentation/ui/cubit/appstate_cubit.dart';
import 'package:game_collections/presentation/ui/gameScreenshot/bloc/game_screen_shots_bloc.dart';
import 'package:game_collections/presentation/ui/locator/locator.dart';
import 'package:game_collections/presentation/ui/screens/home_screen.dart';
import 'package:game_collections/presentation/util/app_nav.dart';
import 'Data/services/game_service.dart';
import 'presentation/ui/Game detail/bloc/games_details_dart_bloc.dart';
import 'presentation/ui/bloc/gamezz_bloc.dart';
import 'presentation/ui/connection/cubit/connection_cubit_cubit.dart';
import 'presentation/ui/creators/bloc/creators_bloc.dart';
import 'presentation/ui/network/bloc/network_bloc.dart';
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
          BlocProvider<GamesDetailsBloc>(create: (_) => GamesDetailsBloc()),
          BlocProvider<ScreenShotBloc>(create: (_) => ScreenShotBloc()),
          BlocProvider<AppstateCubit>(create: (_) => AppstateCubit()),
          BlocProvider<ViewStateCubit>(create: (_) => ViewStateCubit()),
          BlocProvider<ConnectionCubit>(create: (_) => ConnectionCubit()),
          BlocProvider<NetworkBloc>(
              create: (_) => NetworkBloc()..add(NetworkEvent())),
        ],
        child: const GameView(),
      ),
    );
  }
}

class GameView extends StatefulWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //connection works very fine.......
    context.read<ConnectionCubit>().monitorInternetConnection();
    // final games = locator.get<GamesRepository>();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigator.key,
        title: 'Flutter Demo',
        theme: ThemeData(
          // scaffoldBackgroundColor: Color.fromARGB(255, 37, 37, 37),
          scaffoldBackgroundColor: const Color(0Xff29282b),
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen()

        // HomePage(),
        );
  }
}

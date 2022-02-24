import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_collections/Data/repository/game_repo.dart';
import 'package:game_collections/presentation/ui/bloc/gamezz_bloc.dart';
import 'package:game_collections/presentation/ui/collection/coll_cubit.dart';
import 'package:game_collections/presentation/ui/collection/collection_bloc.dart';
import 'package:game_collections/presentation/ui/locator/locator.dart';
import 'package:game_collections/presentation/ui/new_ui.dart';
import 'presentation/ui/ui.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<GamezzBloc>(
        create: (context) => GamezzBloc()..add(GamezzFetch()),
        child: const HomePage(),
      ),

      // HomePage(),
    );
  }
}

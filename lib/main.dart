import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/ui/Games/bloc/games_bloc.dart';
import 'presentation/ui/ui.dart';
import 'presentation/util/app_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<GamesBloc>(
        create: (context) => GamesBloc()..add(FetchGamesEvent()),
        child: const HomeLayout(),
      ),

      // HomePage(),
    );
  }
}

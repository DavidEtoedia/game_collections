// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:game_collections/Data/repository/game_repo.dart';
// import 'package:game_collections/Data/services/game_service.dart';
// import 'package:game_collections/presentation/ui/bloc/gamezz_bloc.dart';
// import 'package:game_collections/presentation/ui/creators/bloc/creators_bloc.dart';
// import 'package:game_collections/presentation/ui/new%20release/bloc/new_release_bloc.dart';
// import 'package:game_collections/presentation/ui/screens/home_screen.dart';
// import 'package:game_collections/presentation/ui/sinlge_game/bloc/single_game_bloc.dart';

// import 'Game detail/bloc/games_details_dart_bloc.dart';

// class HomeSetUp extends StatelessWidget {
//   const HomeSetUp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: RepositoryProvider(
//         create: (_) => GamesRepository(gamesService: GamesService()),
//         child: MultiBlocProvider(
//           providers: [
//             BlocProvider<NewReleaseBloc>(
//                 create: (_) => NewReleaseBloc()..add(NewReleaseFetch())),
//             BlocProvider<GamezzBloc>(
//                 create: (_) => GamezzBloc()..add(GamezzFetch())),
//             BlocProvider<CreatorsBloc>(
//                 create: (_) => CreatorsBloc()..add(CreatorFetch())),
//             BlocProvider<SingleGameBloc>(
//                 create: (_) => SingleGameBloc()..add(SingleGameFetch())),
//             BlocProvider<GamesDetailsBloc>(
//                 create: (_) => GamesDetailsBloc()..add(GamesDetailsEvent()))
//           ],
//           child: const HomeScreen(),
//         ),
//       ),
//     );
//   }
// }

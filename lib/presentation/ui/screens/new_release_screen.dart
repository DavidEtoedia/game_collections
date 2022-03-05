import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_collections/Data/model/games.dart' as games;
import 'package:game_collections/controller/generic_state_notifier.dart';
import 'package:game_collections/presentation/component/loading_progress.dart';
import 'package:game_collections/presentation/ui/bloc/gamezz_bloc.dart';
import 'package:game_collections/presentation/ui/helper/glass_morph.dart';
import 'package:game_collections/presentation/ui/helper/rating_star.dart';
import 'package:game_collections/presentation/ui/screens/game_list.dart';
import 'package:game_collections/presentation/ui/new%20release/bloc/new_release_bloc.dart';
import 'package:game_collections/presentation/util/app_nav.dart';
import 'package:game_collections/presentation/util/space_util.dart';
import 'package:intl/intl.dart';

class NewReleaseScreen extends StatefulWidget {
  const NewReleaseScreen({Key? key}) : super(key: key);

  @override
  State<NewReleaseScreen> createState() => _NewReleaseScreenState();
}

class _NewReleaseScreenState extends State<NewReleaseScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewReleaseBloc, RequestState<games.Games>>(
        bloc: BlocProvider.of<NewReleaseBloc>(context),
        builder: ((context, state) {
          return state.when(
              idle: () => const LoadingProgress(),
              loading: () => const LoadingProgress(),
              success: (data) {
                return InkWell(
                  onTap: () {
                    context.navigate(const TabBarVieww());

                    // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    //   return BlocProvider.value(
                    //       value: BlocProvider.of<GamezzBloc>(context),
                    //       child: const GameList());
                    // }));
                    // context.navigate(BlocProvider.value(
                    //   value: BlocProvider.of<GamezzBloc>(context),
                    //   child: const GameList(),
                    // ));
                  },
                  child: GlassmorphicContainer(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    borderRadius: 10,
                    blur: 20,
                    alignment: Alignment.bottomCenter,
                    border: 1,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 65, 65, 65).withOpacity(0.1),
                          const Color(0xFFFFFFFF).withOpacity(0.05)
                        ],
                        stops: const [
                          0.1,
                          1,
                        ]),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFffffff).withOpacity(0.5),
                        const Color((0xFFFFFFFF)).withOpacity(0.5)
                      ],
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 10, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Text(
                            'Most played game',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 147,
                            child: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: data!.results!.length,
                              itemBuilder: (context, index) {
                                final newRel = data.results![index];
                                DateTime relDate = newRel.released!;
                                final date = DateFormat.yMMMM().format(relDate);

                                return SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Row(
                                    children: [
                                      CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              const LoadingProgress(),
                                          errorWidget: (context, url, error) =>
                                              SizedBox(
                                                height: 50,
                                                width: 50,
                                                child: Image.asset(
                                                  'images/noimage.jpg',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              ),
                                          imageUrl: newRel.backgroundImage
                                              .toString()),
                                      const Space(20),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Text(
                                                newRel.name.toString(),
                                                maxLines: 1,
                                                style: const TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            const Space(0),
                                            Text(
                                              "Released: $date",
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            const Space(3.5),
                                            SmoothStarRating(
                                                allowHalfRating: true,
                                                starCount:
                                                    newRel.rating!.toInt(),
                                                spacing: 0.0)
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  height: 20,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              error: (Object e, StackTrace s) {
                return Text(e.toString());
              });
        }));
  }
}

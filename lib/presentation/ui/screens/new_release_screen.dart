import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_collections/Data/model/games.dart' as games;
import 'package:game_collections/controller/generic_state_notifier.dart';
import 'package:game_collections/presentation/ui/helper/glass_morph.dart';
import 'package:game_collections/presentation/ui/helper/rating_star.dart';
import 'package:game_collections/presentation/ui/new%20release/bloc/new_release_bloc.dart';
import 'package:game_collections/presentation/util/space_util.dart';
import 'package:intl/intl.dart';

class NewReleaseScreen extends StatelessWidget {
  const NewReleaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewReleaseBloc, RequestState<games.Games>>(
        builder: ((context, state) {
      return state.when(idle: () {
        return const CircularProgressIndicator();
      }, loading: () {
        return const CircularProgressIndicator();
      }, success: (data) {
        return GlassmorphicContainer(
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
                const Color(0xFFffffff).withOpacity(0.1),
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
            padding: const EdgeInsets.only(
              left: 20,
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  'Latest Games Released',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                // const Space(1),
                SizedBox(
                  height: 145,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data!.results!.length,
                    itemBuilder: (context, index) {
                      final newRel = data.results![index];
                      DateTime relDate = newRel.released!;
                      final date = DateFormat.yMMMM().format(relDate);
                      return Container(
                        height: 60,
                        width: 60,
                        child: Row(
                          children: [
                            CachedNetworkImage(
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
                                imageUrl: newRel.backgroundImage.toString()),
                            const Space(20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  newRel.name.toString(),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Space(3.5),
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
                                    starCount: newRel.rating!.toInt(),
                                    spacing: 0.0)
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }, error: (Object e, StackTrace s) {
        return Text(e.toString());
      });
    }));
  }
}

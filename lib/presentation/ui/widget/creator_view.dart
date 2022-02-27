import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_collections/Data/model/creators.dart';
import 'package:game_collections/controller/generic_state_notifier.dart';
import 'package:game_collections/presentation/ui/creators/bloc/creators_bloc.dart';
import 'package:game_collections/presentation/ui/helper/glass_morph.dart';
import 'package:game_collections/presentation/util/space_util.dart';

class CreatorsView extends StatelessWidget {
  const CreatorsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatorsBloc, RequestState<Creators>>(
        builder: (context, state) {
      return state.when(
        idle: () => const CircularProgressIndicator(),
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text(error.toString()),
        success: (data) {
          return GlassmorphicContainer(
            width: MediaQuery.of(context).size.width,
            height: 120,
            borderRadius: 10,
            blur: 1,
            alignment: Alignment.bottomCenter,
            border: 1,
            linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFffffff).withOpacity(0.2),
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Game Creators',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  const Space(10),
                  SizedBox(
                    height: 50,
                    width: 320,
                    child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics()),
                      scrollDirection: Axis.horizontal,
                      itemCount: data!.results!.length,
                      itemBuilder: (context, index) {
                        final facePile = data.results![index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(300.0),
                          child: CachedNetworkImage(
                            fit: BoxFit.contain,
                            imageUrl: facePile.image.toString(),
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.asset(
                                'assets/images/noimage.jpg',
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 15,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}

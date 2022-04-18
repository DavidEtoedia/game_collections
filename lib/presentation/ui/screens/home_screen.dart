import 'package:flutter/material.dart';
import 'package:game_collections/presentation/ui/helper/glass_morph.dart';
import 'package:game_collections/presentation/ui/screens/new_release_screen.dart';
import 'package:game_collections/presentation/ui/widget/creator_view.dart';
import 'package:game_collections/presentation/ui/widget/game_header.dart';
import 'package:game_collections/presentation/util/space_util.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: 400,
      height: 800,
      borderRadius: 1,
      blur: 2,
      alignment: Alignment.bottomCenter,
      border: 1,
      linearGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color.fromARGB(255, 27, 27, 27).withOpacity(0.9),
            const Color.fromARGB(255, 73, 73, 73).withOpacity(0.8)
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: SingleChildScrollView(
            child: Column(
              children: const [
                Space(20),
                GameHeader(),
                Divider(
                  color: Colors.grey,
                  endIndent: 0,
                  thickness: 0.5,
                ),

                Space(20),

                NewReleaseScreen(),
                Space(20),
                CreatorsView(),

                Space(30),

                // const HomePage()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FloatingBottomNav extends StatelessWidget {
  const FloatingBottomNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: MediaQuery.of(context).size.width,
      height: 70,
      borderRadius: 20,
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
    );
  }
}

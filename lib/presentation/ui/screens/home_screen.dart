import 'package:flutter/material.dart';
import 'package:game_collections/Data/model/game_release.dart';
import 'package:game_collections/presentation/ui/helper/app_bg.dart';
import 'package:game_collections/presentation/ui/home_page.dart';
import 'package:game_collections/presentation/ui/screens/new_release_screen.dart';
import 'package:game_collections/presentation/ui/widget/creator_view.dart';
import 'package:game_collections/presentation/util/space_util.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackGroundImage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Space(50),
                Container(
                  color: Colors.blueAccent,
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                ),
                const Space(40),
                const Divider(
                  color: Colors.grey,
                  endIndent: 0,
                  thickness: 0.5,
                ),
                const Space(20),

                const NewReleaseScreen(),
                const Space(20),
                const CreatorsView(),

                const Space(30),
                Container(
                  color: Colors.blueAccent,
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                ),
                // const HomePage()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

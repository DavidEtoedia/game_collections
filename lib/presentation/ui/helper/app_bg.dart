import 'package:flutter/material.dart';
import 'package:game_collections/presentation/ui/helper/glass_morph.dart';

class BackGroundImage extends StatelessWidget {
  final Widget child;
  final ImageProvider image;
  const BackGroundImage({
    Key? key,
    required this.image,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          BuildBackGround(
            image: image,
          ),
          child
        ],
      );

  // Widget buildBackGround() {
  //   return Container(
  //     decoration: BoxDecoration(
  //         // gradient: LinearGradient(colors: [
  //         //   Color(0XFF29292a),
  //         //   Color(0XFF29282b),
  //         // ]),
  //         image: DecorationImage(image: image, fit: BoxFit.fill)),
  //   );
  // }
}

class BuildBackGround extends StatelessWidget {
  final ImageProvider image;
  const BuildBackGround({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // gradient: LinearGradient(colors: [
          //   Color(0XFF29292a),
          //   Color(0XFF29282b),
          // ]),
          image: DecorationImage(image: image, fit: BoxFit.fill)),
    );
  }
}

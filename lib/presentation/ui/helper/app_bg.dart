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
        children: [buildBackGround(), child],
      );

  Widget buildBackGround() {
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

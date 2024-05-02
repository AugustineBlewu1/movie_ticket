import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

class MovieDetails extends HookWidget {
  const MovieDetails(this.assetsName, this.movieName,  {super.key});
  final String? assetsName;
  final String? movieName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height / 2,
                decoration: const BoxDecoration(shape: BoxShape.rectangle),
                child: Image(fit: BoxFit.cover, image: AssetImage(assetsName!)),
              )
        ],
      ),
    );
  }
}

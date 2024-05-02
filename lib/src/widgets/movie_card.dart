import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(
      {super.key,
      required this.assetsName,
      required this.movieName,
      this.callback});

  final String? assetsName;
  final String? movieName;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: 180,
              width: 135,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              child: Image(fit: BoxFit.cover, image: AssetImage(assetsName!)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            movieName!,
            style: Theme.of(context).textTheme.labelSmall,
          )
        ],
      ),
    );
  }
}

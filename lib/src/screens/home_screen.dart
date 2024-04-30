import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket/src/contants/constant.dart';
import 'package:movie_ticket/src/contants/extensions.dart';

class MyHomePage extends HookWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController(text: "");
    final selectedChip = useState<String>("action");
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 3, 4, 17),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back 👋",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      Text(
                        "Let's relax and watch a movie !",
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/amusing-kid.png"),
                  )
                ],
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                    fillColor: Colors.white24,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                        borderSide: BorderSide.none),
                    hintText: "Search movie ...",
                    hintStyle: const TextStyle(color: Colors.white24),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.white24,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    "View all",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: orangeColor),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: Categories.values
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ChoiceChip(
                                label: Text(
                                  e.name.capitalizeFirstLetter(),
                                ),
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: Colors.white),
                                selected: selectedChip.value == e.name,
                                onSelected: (select) {
                                  selectedChip.value =
                                      (select ? e.name : selectedChip.value);
                                },
                                selectedColor: orangeColor,
                                showCheckmark: false,
                                // disabledColor: Colors.white24,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    side: BorderSide.none),
                                backgroundColor: Colors.white12,
                              ),
                            ))
                        .toList()),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Latest Movie",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            "View all",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: orangeColor),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MovieCard(
                              assetsName: "assets/monkey.jpg",
                              movieName: "Thor: Love and Thunder",
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            MovieCard(
                              assetsName: "assets/sky_movie.png",
                              movieName: "Sky Movie",
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            MovieCard(
                              assetsName: "assets/spiderman.png",
                              movieName: "Spider Man",
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Favourite Movie",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            "View all",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: orangeColor),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MovieCard(
                              assetsName: "assets/monkey.jpg",
                              movieName: "Thor: Love and Thunder",
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            MovieCard(
                              assetsName: "assets/sky_movie.png",
                              movieName: "Sky Movie",
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            MovieCard(
                              assetsName: "assets/spiderman.png",
                              movieName: "Spider Man",
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard(
      {super.key, required this.assetsName, required this.movieName});

  final String? assetsName;
  final String? movieName;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

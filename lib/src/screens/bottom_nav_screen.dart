import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket/src/contants/constant.dart';
import 'package:movie_ticket/src/screens/home_screen.dart';
import 'package:movie_ticket/src/screens/profile_screen.dart';
import 'package:movie_ticket/src/screens/ticket_screen.dart';

class MovieBottomNavBar extends HookWidget {
  const MovieBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState<int>(0);
    List<Widget> screens = [
      const MyHomePage(),
      const TicketScreen(),
      const ProfileScreen()
    ];

    return Scaffold(
      body: screens.elementAt(selectedIndex.value),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex.value,
        onTap: (value) => selectedIndex.value = value,
        items: _navBarItems(selectedIndex.value),
        backgroundColor: const Color.fromARGB(255, 3, 4, 17),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        // type: BottomNavigationBarType.shifting,
      ),
    );
  }

  List<BottomNavigationBarItem> _navBarItems(int? selected) {
    return [
      BottomNavigationBarItem(
        icon: const Icon(
          Icons.local_movies_outlined,
          color: Colors.white,
        ),
        activeIcon: Container(
          decoration: BoxDecoration(
              color: orangeColor, borderRadius: BorderRadius.circular(20)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 5,
              children: [
                Icon(
                  Icons.local_movies_outlined,
                  color: Colors.white,
                ),
                Text("Home")
              ],
            ),
          ),
        ),
        label: "",
      ),
       BottomNavigationBarItem(
        icon: const Icon(Icons.table_chart_outlined),
        label: "",
        activeIcon: Container(
          decoration: BoxDecoration(
              color: orangeColor, borderRadius: BorderRadius.circular(20)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 5,
              children: [
                Icon(
                  Icons.table_chart_outlined,
                  color: Colors.white,
                ),
                Text("Tickets")
              ],
            ),
          ),
        ),
      ),
       BottomNavigationBarItem(
        icon: const Icon(Icons.person),
        label: "",
         activeIcon: Container(
          decoration: BoxDecoration(
              color: orangeColor, borderRadius: BorderRadius.circular(20)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 5,
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                Text("Profile")
              ],
            ),
          ),
        )
      ),
    ];
  }
}

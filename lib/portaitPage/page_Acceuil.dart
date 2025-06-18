import 'package:flutter/material.dart';
import 'package:project/drawer_class.dart';
import 'package:project/portaitPage/home_page.dart';
import 'package:project/portaitPage/map.dart';
import 'package:project/portaitPage/plus.dart';
import 'package:project/portaitPage/statistique.dart';

class PageAcceuil extends StatefulWidget {
  const PageAcceuil({super.key});

  @override
  State<PageAcceuil> createState() => _PageAcceuilState();
}

class _PageAcceuilState extends State<PageAcceuil> {
  int current = 0;
  List<Widget> page = [HomePage(), MapPortail(), Stat(), Plus()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.teal,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Stats"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Plus"),
        ],
        onTap: (index) {
          setState(() {
            current = index;
          });
        },
      ),

      /*floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 15,
        children: [
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.remove)),
        ],
      ),*/
      body: AnimatedSize(
        curve: Curves.easeInOutCirc,
        duration: Duration(milliseconds: 130),
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 150),
          child: page[current],
        ),
      ),
    );
  }
}

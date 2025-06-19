import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project/drawer_class.dart';
import 'package:project/portaitPage/my_grid/main_grid.dart';
import 'package:project/portaitPage/data/notifiers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int current = 0;
  List<GridW> grid = [
    GridW(ic: Icons.map, name: "Map"),
    GridW(ic: Icons.bar_chart, name: "Statistiques"),
    GridW(ic: Icons.home_work, name: "Infrastructure"),
    GridW(ic: Icons.face_retouching_natural, name: "Culture"),
    GridW(ic: Icons.nature, name: "Environnement"),
  ];

  List<String> images = [
    "images/1.jpg",
    "images/2.jpg",
    "images/3.jpg",
    "images/4.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerClass(),
      appBar: AppBar(
        title: Text("GeoPortail Platteform"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            onPressed: () {
              isDarkNotifier.value = !isDarkNotifier.value;
            },
            icon: ValueListenableBuilder(
              valueListenable: isDarkNotifier,
              builder: (BuildContext context, dynamic value, Widget? child) {
                return Icon(value ? Icons.light_mode : Icons.dark_mode);
              },
            ),
          ),
        ],
      ),

      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Text(
            "Bienvenue sur le GeoPortail National",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            "Explorer les cartes et les donnees regionale et les ressources",
          ),
          SizedBox(
            height: 250,
            child: GridView.builder(
              itemCount: grid.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => grid[index],
            ),
          ),

          CarouselSlider(
            items:
                images.map((i) {
                  return Builder(
                    builder: (context) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Image.asset(
                            i,
                            fit: BoxFit.cover,
                            height: 200,
                            width: 400,
                          ),
                        ), //Image.asset(i,)),
                      );
                    },
                  );
                }).toList(),
            options: CarouselOptions(autoPlay: true),
          ),
        ],
      ),
    );
  }
}

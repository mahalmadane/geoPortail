import 'package:flutter/material.dart';
import 'package:project/drawer_class.dart';
import 'package:project/portaitPage/my_grid/main_grid.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerClass(),
      appBar: AppBar(
        title: Text("GeoPortail Platteform"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),

      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Text("Bienvenue sur le GeoPortail National"),
          Text(
            "Explorer les cartes et les donnees regionale et les ressources",
          ),
          SizedBox(
            height: 500,
            child: GridView.builder(
              itemCount: grid.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => grid[index],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:project/portaitPage/page_Acceuil.dart';
import 'package:project/portaitPage/data/notifiers.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkNotifier,
      builder: (BuildContext context, dynamic value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // theme: value? ThemeData.dark() : ThemeData.light(), en fonction de dark et light
          theme: ThemeData(
            brightness:
                isDarkNotifier.value ? Brightness.dark : Brightness.light,
          ),
          home: SafeArea(child: PageAcceuil()),
        );
      },
    );
  }
}

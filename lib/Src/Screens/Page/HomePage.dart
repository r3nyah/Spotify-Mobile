import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobilespotify/Src/Constant/Color.dart';
import 'package:mobilespotify/Src/Service/Model.dart';
import 'package:mobilespotify/Src/Service/Provider.dart';
import 'package:mobilespotify/Src/Screens/Widget/Home/Albums.dart';
import 'package:mobilespotify/Src/Screens/Widget/Home/SongTypes.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Model();
      },
      child: Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          backgroundColor: black,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Explore",
                  style: TextStyle(
                      fontSize: 20, color: white, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.transparent ,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      'https://pbs.twimg.com/profile_images/1013614110171250688/vrPUCDn2_400x400.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Icon(Icons.list)
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<Model>(builder: (context, model, child) {
                    return SongTypes(
                      onTap: (index) {
                        model.changeActiveMenuOne(index);
                      },
                      activeMenu: model.activeMenu1,
                      songType: song_type_1,
                    );
                  }),
                  const SizedBox(height: 20),
                  Albums(
                    songsList: songs.sublist(0, 5),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<Model>(builder: (context, model, child) {
                    return SongTypes(
                      onTap: (index) {
                        model.changeActiveMenuTwo(index);
                      },
                      activeMenu: model.activeMenu2,
                      songType: song_type_2,
                    );
                  }),
                  const SizedBox(height: 20),
                  Albums(
                    songsList: songs.sublist(5),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
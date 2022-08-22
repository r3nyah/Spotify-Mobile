import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobilespotify/Src/Constant/Color.dart';
import 'package:mobilespotify/Src/Service/Provider.dart';
import 'package:mobilespotify/Src/Screens/Widget/Layout/BottomNavBar.dart';
import 'package:mobilespotify/Src/Screens/Page/HomePage.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Model(),
      child: Scaffold(
        backgroundColor: black,
        body: Consumer<Model>(builder: (context, model, child) {
          return IndexedStack(
            index: model.activeTab,
            children: [
              const HomePage(),
              Center(
                child: Center(
                  child: const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 72,
                  ),
                ),
              ),
              Center(
                child: Center(
                  child: const Icon(
                    Icons.error,
                    color: Colors.green,
                    size: 72,
                  ),
                ),
              ),
            ],
          );
        }),
        bottomNavigationBar: Consumer<Model>(builder: (context, model, child) {
          return BottomNavBar(
              children: List.generate(model.bottomNavBaritems.length, (index) {
                return IconButton(
                    icon: Icon(model.bottomNavBaritems[index],
                        color: model.activeTab == index ? white : grey),
                    onPressed: () {
                      model.changeBottomNavBarIndex(index);
                    });
              }));
        }),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:new_flutter/pages/widgets/home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottom: const PreferredSize(
            preferredSize: Size(30, 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Explore the world',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black45, fontSize: 26),
                ),
              ),
            )),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            'Hi, David 👋',
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'assets/images/person.png',
                      ))))
        ],
      ),
      body: const HomeBody(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedPageIndex = index;
          });
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'Learn',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.engineering),
            icon: Icon(Icons.engineering_outlined),
            label: 'Relearn',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: 'Unlearn',
          ),
        ],
      ),
    );
  }
}

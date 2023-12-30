import 'dart:async';
import 'package:flutter/material.dart';
import 'package:new_flutter/core/routes/go.dart';
import 'package:new_flutter/pages/widgets/custom_search_delegate.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    super.key,
  });

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late final StreamController<int> tabStream;
  @override
  void initState() {
    super.initState();
    tabStream = StreamController<int>.broadcast();
  }

  @override
  void dispose() {
    tabStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 30,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30,),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Search places'),
                  onTap: () {
                    showSearch(
                        context: context, delegate: CustomSearchDelegate());
                  },
                ),
              ),
              const Text(
                '|',
                style: TextStyle(fontSize: 35, color: Colors.black38),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/filter.png'))
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Popular Places',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              'View all',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      HorizontalList(
        itemCount: 10,
        generator: (p0) {
          return TabItem(
            itemIndex: p0,
            tabStream: tabStream,
          );
        },
      ),
      const SizedBox(
        height: 40,
      ),
      HorizontalList(
          generator: (p0) {
            return Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    GO.to('/detail',arguments: p0,);
                  },
                  child: Hero(
                    flightShuttleBuilder: (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) {
                switch (flightDirection) {
                  case HeroFlightDirection.push:
                    return Material(
                      color: Colors.transparent,
                      child: ScaleTransition(
                         scale: animation.drive(Tween<double>(begin: 0,end: 1.1).chain(CurveTween(curve: Curves.easeInExpo))),
                        child: fromHeroContext.widget));
                case HeroFlightDirection.pop:
                    return Material(
                      color: Colors.transparent,
                      child: toHeroContext.widget);
                }
              },
              tag: p0,
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      height: 350,
                      width: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/bg-image.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
               const  Positioned(
                  right: 20,
                  top: 20,
                  child: StackedIcon(iconData: Icons.favorite_outline,),
                ),
                const Positioned(
                  bottom: 30,
                  right: 30,
                  left: 40,
                  child: DescriptionInfo(),
                )
              ],
            );
          },
          itemCount: 10)
    ]);
  }
}

class DescriptionInfo extends StatelessWidget {
  const DescriptionInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.lightBlue.shade900,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Mount Fuji, ',
                  style: TextStyle(color: Colors.white),
                ),
                Text('Tokyo',
                    style: TextStyle(color: Colors.grey.shade200))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.map_rounded,
                      color: Colors.grey.shade200,
                    ),
                    Text('Tokyo, Japan',
                        style: TextStyle(
                            color: Colors.grey.shade200))
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star_rate_outlined,
                      color: Colors.grey.shade200,
                    ),
                    Text('4.8',
                        style: TextStyle(
                            color: Colors.grey.shade200))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StackedIcon extends StatelessWidget {
  final IconData iconData;
  const StackedIcon({
    super.key, required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(50)),
      child:   Padding(
        padding: const EdgeInsets.all(10.0),
        child: Icon(
          iconData,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final StreamController<int> tabStream;
  final int itemIndex;
  const TabItem({
    super.key,
    required this.itemIndex,
    required this.tabStream,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: tabStream.stream,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: () {
              tabStream.sink.add(itemIndex);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  color: itemIndex == snapshot.data
                      ? Colors.black
                      : Colors.black12,
                  borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical:15),
                child: Text(
                  'MostViewed',
                  style: TextStyle(
                      color: itemIndex == snapshot.data
                          ? Colors.white
                          : Colors.black26,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
              ),
            ),
          );
        });
  }
}

class HorizontalList extends StatelessWidget {
  final Widget Function(int) generator;
  final int itemCount;
  const HorizontalList({
    super.key,
    required this.generator,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [...List.generate(itemCount, generator)],
      ),
    );
  }
}

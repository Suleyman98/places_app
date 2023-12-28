import 'dart:async';

import 'package:flutter/material.dart';
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
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 50,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
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
                style: TextStyle(fontSize: 40, color: Colors.black38),
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
        height: 40,
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
        height: 50,
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
        height: 50,
      ),
      HorizontalList(
          generator: (p0) {
            return Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  height: 500,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: const DecorationImage(
                          image: AssetImage(
                            'assets/images/bg-image.png',
                          ),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  right: 20,
                  top: 20,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50)),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  right: 30,
                  left: 40,
                  child: Container(
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
                  ),
                )
              ],
            );
          },
          itemCount: 10)
    ]);
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
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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

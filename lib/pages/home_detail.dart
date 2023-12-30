import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:new_flutter/core/routes/go.dart';
import 'package:new_flutter/pages/widgets/home_body.dart';

class HomeDetail extends StatelessWidget {
  const HomeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic index = ModalRoute.of(context)!.settings.arguments;
    log(index.toString());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Stack(
                children: [
                  Hero(
                    tag: index,
                    child: Container(
                      height: 400,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/bg-image.png',
                              )),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  Positioned(
                      left: 20,
                      top: 20,
                      child: GestureDetector(
                        onTap: () {
                          GO.back();
                        },
                        child: const StackedIcon(
                          iconData: Icons.arrow_back_ios,
                        ),
                      )),
                  const Positioned(
                      right: 20,
                      top: 20,
                      child: StackedIcon(
                        iconData: Icons.bookmark_add_outlined,
                      )),
                  const Positioned(
                      bottom: 20, right: 20, left: 20, child: DescriptionInfo())
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text('Overview',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    'Details',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DescIcon(
                    icon: Icons.watch_later_rounded,
                    text: '8 hours',
                  ),
                  DescIcon(
                    icon: Icons.cloud,
                    text: '16 C',
                  ),
                  DescIcon(
                    icon: Icons.star,
                    text: '4,5',
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'This vast mountain range is renowned for its remarkable diversity in terms of topography and climate. It features towering peaks, active volcanoes, deep canyons, expansive plateaus, and lush valleys. The Andes are also home to ',
              style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                onPressed: () {
              }, child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text('Book Now',style: TextStyle(color: Colors.white,fontSize: 20),),
                  SizedBox(width: 10,),
                  Icon(Icons.send_rounded,color: Colors.white,size: 30,)
                ],),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class DescIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  const DescIcon({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.black12),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(
              icon,
              size: 25,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(text, style: const TextStyle(fontSize: 16))
      ],
    );
  }
}

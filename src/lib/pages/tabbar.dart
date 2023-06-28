import 'package:flutter/material.dart';
import 'package:test1/pages/news_business.dart';
import 'package:test1/pages/news_health.dart';
import 'package:test1/pages/news_science.dart';
import 'package:test1/pages/news_sports.dart';
import 'package:test1/pages/news_technology.dart';
class Tabbar extends StatelessWidget{
  const Tabbar({super.key, required this.isHideBottomNavBar, required void Function(String title) addToHistory});
  final Function(bool) isHideBottomNavBar;
  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                tabs: [
                  Tab(
                    // text: 'Business',
                    icon: Icon(Icons.business),
                  ),
                  Tab(
                    // text: 'Health',
                    icon: Icon(Icons.health_and_safety),
                  ),
                  Tab(
                    // text: 'Science',
                    icon: Icon(Icons.science),
                  ),
                  Tab(
                    // text: 'Sports',
                    icon: Icon(Icons.sports),
                  ),
                  Tab(
                    // text: 'Technology',
                    icon: Icon(Icons.computer),
                  )
                ],
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Business(),
            Health(),
            Science(),
            Sports(),
            Technology(),
          ],
        ),
      ),
    );
  }
}
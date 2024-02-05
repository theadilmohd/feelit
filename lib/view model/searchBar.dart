import 'package:flutter/material.dart';
import 'package:my_music/view%20model/recently_played.dart';
import 'package:my_music/view%20model/recommendations.dart';

class searchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration:const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                Color(0xFF100A1C),
                Color(0xFF322251),
                Color(0xFF6886EF),
                Color(0xFF7368EF),
              ],
            ),
          ),
          child: Column(
            children: [
             const SizedBox(height: 60.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: MySearchBar(),
              ),
              const RecentlyPlayedTitle(title: 'RECENTLY PLAYED'),
              RecentlyPlayed(),
             const  SizedBox(height: 20.0),
              const RecommendationsTitle(title: 'RECOMMENDATIONS'),
              SongList(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class MySearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 40, 40, 40),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search song',
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(Icons.search, color: Colors.white),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(16.0),
          ),
        ),
      ),
    );
  }
}




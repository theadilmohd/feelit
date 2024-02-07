import 'package:flutter/material.dart';
import 'package:my_music/model/apimodel.dart';
import 'package:my_music/views/home_page.dart';

class RecentlyPlayedTitle extends StatelessWidget {
  final String title;

  const RecentlyPlayedTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 200),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class RecentlyPlayed extends StatelessWidget {
  //int currentIndex = 1;

  RecentlyPlayed({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchMusic(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasData) {
          List<Welcome> musicList = snapshot.data as List<Welcome>;
          return SizedBox(
            height: 250.0,
            child: ListView.builder(
              itemCount: musicList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 180.0,
                  height: 250.0,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        musicList[index].artwork,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return Container(); 
      },
    );
  }
}
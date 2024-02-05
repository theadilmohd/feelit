import 'package:flutter/material.dart';


class RecentlyPlayedTitle extends StatelessWidget {
  final String title;

  const RecentlyPlayedTitle({required this.title});

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

class RecentlyPlayed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          RecentlyPlayedCard(
            imageUrl: 'https://i.pinimg.com/564x/5b/1c/4c/5b1c4c0ddc6b17a4956820e12e5e19a4.jpg',
          ),
          RecentlyPlayedCard(
            imageUrl: 'https://i.pinimg.com/564x/a4/9e/aa/a49eaa3d52b37ed02cadb08c734c8171.jpg',
          ),
          RecentlyPlayedCard(
            imageUrl: 'https://i.pinimg.com/236x/97/1a/0c/971a0cf30d03d13081d4504593847d99.jpg',
          ),
          RecentlyPlayedCard(
            imageUrl: 'https://i.pinimg.com/236x/4f/df/e4/4fdfe42ed1d5725662a0752688d0f82d.jpg',
          ),
          RecentlyPlayedCard(
            imageUrl: 'https://i.pinimg.com/236x/82/e3/16/82e3164be1b79a1ead13edab4b92d9b8.jpg',
          ),
        ],
      ),
    );
  }
}

class RecentlyPlayedCard extends StatelessWidget {
  final String imageUrl;

  const RecentlyPlayedCard({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.0,
      height: 250.0,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

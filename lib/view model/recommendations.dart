import 'package:flutter/material.dart';


class RecommendationsTitle extends StatelessWidget {
  final String title;

  const RecommendationsTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 40,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}

class SongContainer extends StatefulWidget {
  final String imageUrl;
  final String musicName;
  final String artistName;

  const SongContainer({
    required this.imageUrl,
    required this.musicName,
    required this.artistName,
  });

  @override
  _SongContainerState createState() => _SongContainerState();
}

class _SongContainerState extends State<SongContainer> {
  bool _isFavorite = false;

  void _onFavoriteTapped() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              widget.imageUrl,
              width: 50.0,
              height: 90.0,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.musicName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5.0),
                Text(widget.artistName),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: _onFavoriteTapped,
          ),
        ],
      ),
    );
  }
}
class SongList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0, // Set a fixed height based on your design
      child: ListView(
        scrollDirection: Axis.vertical,
        children: const [
          SongContainer(
            imageUrl: 'https://i.pinimg.com/236x/97/1a/0c/971a0cf30d03d13081d4504593847d99.jpg',
            musicName: 'Song Name 1',
            artistName: 'Artist Name 1',
          ),
          SongContainer(
            imageUrl: 'https://i.pinimg.com/564x/5b/1c/4c/5b1c4c0ddc6b17a4956820e12e5e19a4.jpg',
            musicName: 'Song Name 2',
            artistName: 'Artist Name 2',
          ),
          SongContainer(
            imageUrl: 'https://i.pinimg.com/236x/97/1a/0c/971a0cf30d03d13081d4504593847d99.jpg',
            musicName: 'Song Name 3',
            artistName: 'Artist Name 3',
          ),
          SongContainer(
            imageUrl: 'https://i.pinimg.com/236x/97/1a/0c/971a0cf30d03d13081d4504593847d99.jpg',
            musicName: 'Song Name 4',
            artistName: 'Artist Name 4',
          ),
          SongContainer(
            imageUrl: 'https://i.pinimg.com/236x/97/1a/0c/971a0cf30d03d13081d4504593847d99.jpg',
            musicName: 'Song Name 5',
            artistName: 'Artist Name 5',
          ),
        ],
      ),
    );
  }
}
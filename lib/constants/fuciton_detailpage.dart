//   import 'package:audioplayers/audioplayers.dart';
// import 'package:my_music/model/apimodel.dart';

// final player = AudioPlayer();
//   bool isPlaying = false;
//   int currentIndex = 1;
//   void 
//   playPauseMusic(String url) {
//     if (isPlaying) {
//       player.pause();
//     } else {
//       player.play(UrlSource(url.toString()));
//     }
//    // setState(() {
//       isPlaying = !isPlaying;
//   //  });
//   }

//   void playNext(List<Welcome> musicList) {
//     if (currentIndex < musicList.length - 1) {
//       currentIndex++;
//       playMusic(musicList[currentIndex].url);
//     }
//   }

//   void playPrevious(List<Welcome> musicList) {
//     if (currentIndex > 0) {
//       currentIndex--;
//       playMusic(musicList[currentIndex].url);
//     }
//   }

//   void playMusic(String url) {
//     if (isPlaying) {
//       player.pause();
//     } else {
//       player.play(UrlSource(url.toString()));
//     }
//    // setState(() {
//       isPlaying = !isPlaying;
//    // });
//   }
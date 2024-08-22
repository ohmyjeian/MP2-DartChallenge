import 'dart:math';

class Song {
  String title;
  String artist;
  double duration;

  Song(this.title, this.artist, this.duration);

  void displaySong() {
    print("$title by $artist (${duration.toStringAsFixed(2)} minutes)");
  }

  int getDurationInSeconds() {
    return (duration * 60).toInt();
  }
}

class Playlist {
  String name;
  List<Song> songs = [];

  Playlist(this.name);

  void addSong(Song song) {
    songs.add(song);
  }

  void displayPlaylist() {
    print("Playlist: $name");
    for (var song in songs) {
      song.displaySong();
    }
  }

  void sortSongsByArtist() {
    songs.sort((a, b) => a.artist.compareTo(b.artist));
  }

  int getTotalDurationInSeconds() {
    return songs.fold(0, (sum, song) => sum + song.getDurationInSeconds());
  }

  Song getRandomSong() {
    final random = Random();
    return songs[random.nextInt(songs.length)];
  }
}

class MusicFestival {
  String name;
  List<Playlist> stages = [];

  MusicFestival(this.name);

  void addStage(Playlist playlist) {
    stages.add(playlist);
  }

  void displayFestival() {
    print(name);
    int totalDuration = getTotalFestivalDuration();
    print("Total Festival Duration: $totalDuration seconds\n");

    // Display stage names
    print("DIFF STAGE, DIFF GENRE!");
    for (var stage in stages) {
      print(stage.name);
    }

    for (var stage in stages) {
      print("\n${stage.name} playlist sorted by artist:");
      stage.sortSongsByArtist();
      stage.displayPlaylist();
    }
  }

  int getTotalFestivalDuration() {
    return stages.fold(
        0, (sum, stage) => sum + stage.getTotalDurationInSeconds());
  }
}

void main() {
  var song1 = Song("Paradise", "Coldplay", 4.4);
  var song2 = Song("Island in the Sun", "Weezer", 3.2);
  var song3 = Song("Somewhere Over the Rainbow", "Israel Kamakawiwo'ole", 3.3);
  var song4 = Song("A Sky Full of Stars", "Coldplay", 4.2);
  var song5 = Song("Walking on Sunshine", "Katrina and the Waves", 3.6);

  var stage1 = Playlist("Portal to Paradise");
  stage1.addSong(song1);
  stage1.addSong(song2);
  stage1.addSong(song3);
  stage1.addSong(song4);
  stage1.addSong(song5);

  var song6 = Song("Gasolina", "Daddy Yankee", 3.2);
  var song7 = Song("Danza Kuduro", "Don Omar", 3.4);
  var song8 = Song("Bola Rebola", "Tropkillaz", 3.3);
  var song9 = Song("Abusadamente", "MC Gustta", 2.4);
  var song10 = Song("Secrets", "Regard", 2.5);

  var stage2 = Playlist("The Rave Cave");
  stage2.addSong(song6);
  stage2.addSong(song7);
  stage2.addSong(song8);
  stage2.addSong(song9);
  stage2.addSong(song10);

  var song11 = Song("Art", "Tyla", 3.3);
  var song12 = Song("Goodluck Babe", "Chappell Roan", 3.1);
  var song13 = Song("Dilaw", "Maki", 4.0);
  var song14 = Song("Ikot", "Over October", 3.6);
  var song15 = Song("Sandal", "VXON", 4.2);

  var stage3 = Playlist("Crystal Garden");
  stage3.addSong(song11);
  stage3.addSong(song12);
  stage3.addSong(song13);
  stage3.addSong(song14);
  stage3.addSong(song15);

  var festival = MusicFestival("The Renaissance");
  festival.addStage(stage1);
  festival.addStage(stage2);
  festival.addStage(stage3);

  festival.displayFestival();
}

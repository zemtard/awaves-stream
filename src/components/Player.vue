<template>
  <div id="app">
    <div class="djselect">
      <h3>DJ selected: {{ dj }}</h3>
      <button class="dj" @click="setDJ0">DJ random</button>
      <button class="dj" @click="setDJ1">DJ techno</button>
      <button class="dj" @click="setDJ2">DJ rock</button>
    </div>
    <!-- <audio controls>
      <source
        src="https://www.mboxdrive.com/Rammstein_-_Ich_will_57658983.mp3"
        type="audio/mpeg"
      />
      Your browser does not support the audio tag.
    </audio> -->
    <div class="currsong">
      <h2>{{ current.title }} - {{ current.artist }}</h2>
    </div>

    <div onended="next" class="controls">
      <button class="prev" @click="prev">Prev</button>
      <button class="play" v-if="!isPlaying" @click="play(song)">Play</button>
      <button class="pause" v-else @click="pause">Pause</button>
      <button class="next" @click="next">Next</button>
    </div>
    <section class="playlist">
      <h3>Avaliable music</h3>

      <div v-if="dj === 0">
        <button
          v-for="song in songs_random"
          :key="song.src"
          @click="select(song)"
        >
          {{ song.title }} - {{ song.artist }}
        </button>
      </div>

      <div v-if="dj === 1">
        <button
          v-for="song in songs_techno"
          :key="song.src"
          @click="select(song)"
        >
          {{ song.title }} - {{ song.artist }}
        </button>
      </div>

      <div v-if="dj === 2">
        <button
          v-for="song in songs_rock"
          :key="song.src"
          @click="select(song)"
        >
          {{ song.title }} - {{ song.artist }}
        </button>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  name: "app",
  data() {
    return {
      current: {},
      index: 0,
      isPlaying: false,
      dj: 0,

      songs_random: [
        {
          title: "Ich will",
          artist: "Rammstein",
          src: "https://www.mboxdrive.com/Rammstein_-_Ich_will_57658983.mp3",
        },
        {
          title: "Pack of cigarettes",
          artist: "Victor Coi",
          src: "https://www.mboxdrive.com/%d0%92%d0%b8%d0%ba%d1%82%d0%be%d1%80%20%d0%a6%d0%be%d0%b9,%20%d0%b3%d1%80%d1%83%d0%bf%d0%bf%d0%b0%20%d0%9a%d0%98%d0%9d%d0%9e%20-%20%d0%9f%d0%b0%d1%87%d0%ba%d0%b0%20%d1%81%d0%b8%d0%b3%d0%b0%d1%80%d0%b5%d1%82.mp3",
        },
        {
          title: "Hit em up",
          artist: "2Pac",
          src: "https://www.mboxdrive.com/2Pac%20-%20Hit%20Em%20Up.mp3",
        },
      ],

      songs_rock: [
        {
          title: "Here comes the sun",
          artist: "The Beatles",
          src: "https://www.mboxdrive.com/09%20-%20The%20Beatles%20-%20Here%20Comes%20The%20Sun%20(Remastered%202009).mp3",
        },
        {
          title: "About a girl",
          artist: "Nirvana",
          src: "https://www.mboxdrive.com/Nirvana%20-%20About%20A%20Girl%20(Live%20And%20Loud,%20Seattle%201993).mp3",
        },
                {
          title: "Enjoy the silence",
          artist: "Depeche Mode",
          src: "https://www.mboxdrive.com/14%20-%20%5bDepeche%20Mode%5d%20Enjoy%20The%20Silence.mp3",
        },
        
      ],

      songs_techno: [
        {
          title: "Around the world",
          artist: "Daft punk",
          src: "https://www.mboxdrive.com/Daft_Punk_Around_the_World.mp3",
        },
        {
          title: "Bangarangang",
          artist: "Skrillex",
          src: "https://www.mboxdrive.com/SKRILLEX%20-%20Bangarang%20feat.%20Sirah%20%5bOfficial%20Music%20Video%5d.mp3",
        },
        {
          title: "Among us drip",
          artist: "Among us",
          src: "https://www.mboxdrive.com/Among%20Us%20Drip%20Theme%20Song%20Original%20(Among%20Us%20Trap%20Remix%20_%20Amogus%20Meme%20Music).mp3",
        },
      ],

      player: new Audio(),
    };
  },

  methods: {
    play(song) {
      if (typeof song != "undefined") {
        //checks if the song is not undefined
        this.current = song; //sets current to song
        this.player.src = this.current.src; //sets player to play currents source
      }
      this.isPlaying = true; //flag switched to true, pause button activates
      this.player.play(); //plays song
    },

    pause() {
      this.isPlaying = false; //flag switched to false, play button activates
      this.player.pause(); //pauses player, pausing the music
    },

    next() {
      //make play next song
      this.index++;
      if (this.dj == 0) {
        if (this.index > this.songs_random.length - 1) {
          //loop from beginning if index is bigger than all song count
          this.index = 0;
        }
        this.current = this.songs_random[this.index];
      }

      if (this.dj == 1) {
        if (this.index > this.songs_techno.length - 1) {
          //loop from beginning if index is bigger than all song count
          this.index = 0;
        }
        this.current = this.songs_techno[this.index];
      }

      if (this.dj == 2) {
        if (this.index > this.songs_rock.length - 1) {
          //loop from beginning if index is bigger than all song count
          this.index = 0;
        }
        this.current = this.songs_rock[this.index];
      }

      this.play(this.current);
    },

    prev() {
      //make play previous song
      this.index--;

    if(this.dj == 0){
      if (this.index < 0) {
        //if users at song 0 and click prev plays last song in the playlist
        this.index = this.songs_random.length - 1;
      }
      this.current = this.songs_random[this.index];
    }

    if(this.dj == 1){
      if (this.index < 0) {
        //if users at song 0 and click prev plays last song in the playlist
        this.index = this.songs_techno.length - 1;
      }
      this.current = this.songs_techno[this.index];
    }

        if(this.dj == 2){
      if (this.index < 0) {
        //if users at song 0 and click prev plays last song in the playlist
        this.index = this.songs_rock.length - 1;
      }
      this.current = this.songs_rock[this.index];
    }

      this.play(this.current);
    },
    select(song) {
      //sets current song but does not play
      this.current = song; //sets current to song
      this.player.src = this.current.src;
      this.isPlaying = false;
    },

    setDJ0() {
      this.dj = 0;
      this.current = this.songs_random[0]; //sets to play first song in database
      this.player.src = this.current.src;
      this.isPlaying = false;
    },

    setDJ1() {
      this.dj = 1;
      this.current = this.songs_techno[0]; //sets to play first song in database
      this.player.src = this.current.src;
      this.isPlaying = false;
    },

    setDJ2() {
      this.dj = 2;
      this.current = this.songs_rock[0]; //sets to play first song in database
      this.player.src = this.current.src;
      this.isPlaying = false;
    },
  },

  created() {
    this.current = this.songs_random[this.index]; //sets to play first song in database
    this.player.src = this.current.src;
    //this.player.play();
  },
};
</script>

<style scoped lang="scss">
.currsong {
  background-color: #ffffff;
  border-radius: 20px;
}

.play,
.pause {
  border-radius: 5px;
  font-family: "Poppins Black";
  font-weight: bold;
  color: #ffffff;
  font-size: 30px;
  background-color: #373737;
}

.prev,
.next, .dj {
  font-family: "Poppins Black";
  color: #ffffff;
  border-radius: 5px;
  font-size: 25px;
  background-color: #373737;
}
</style>

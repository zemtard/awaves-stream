<template>
  <div>
    <div class="djselect">
      <button class="dj-hip-hop" 
      @mouseover="hover = true"
      @mouseleave="hover = false"
      :class="{ selected: hover }" @click="setDJ0">HipHop Hailey</button>

      <button class="dj-house"  
      @mouseover="hover1 = true"
      @mouseleave="hover1 = false"
      :class="{ selected: hover1 }" @click="setDJ1">Harris House</button>

      <button class="dj-chill" 
      @mouseover="hover2 = true"
      @mouseleave="hover2 = false"
      :class="{ selected: hover2 }" @click="setDJ2">Chill Bill</button>

      <button class="dj-lofi"
       @mouseover="hover3 = true"
      @mouseleave="hover3 = false"
      :class="{ selected: hover3 }" >Lofi Larry</button>

      <button class="dj-party" 
      @mouseover="hover4 = true"
      @mouseleave="hover4 = false"
      :class="{ selected: hover4 }">Party Patrick</button>

    </div>

    <div class="logo">
        <img class="logo_image" :src="require('/src/assets/logo_full.png')"/>
    </div>

<div class = "welcome">
  <h2>a unique personalised</h2>
  <h2> music experience</h2> 
</div>

<div class = "guide">
  <h2>Select your DJ</h2>
  <h3>and enjoy</h3> 
</div>

    <div class="controls">
      <button class="prev" @click="prev">Prev</button>
      <button class="play" v-if="!isPlaying" @click="play(song)">Play</button>
      <button class="pause" v-else @click="pause">Pause</button>
      <button class="next" @click="next">Next</button>
    </div>

        <div class="currsong">
      <h2>Song: {{ current.title }} - {{ current.artist }}</h2>
    </div>

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
          title: "Girls Want Girls",
          artist: "Drake Remix",
          src: "",
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


//elements are positioned using absolute positioning
</script> 

<style scoped lang="scss">

.logo{
  position: absolute;
  top: 20%;
  right: 50%;
}

.logo_image{
  width: 30%;
  height: 30%;
}

.welcome{
  position: absolute;
  left: 43%;
  top: 20%;
  font-family: "Poppins Black";
  font-weight: bold;
}

.guide{
  position: absolute;
  top: 75%;
  left: 45%;
  font-family: "Poppins Black";
  font-weight: bold;
}

.currsong {
position: absolute;
top: 69%;
left: 40%;
border-radius: 20px;
opacity: 50%;
}

.controls {
  position: absolute;
  top: 40%;
  left: 44%;
  background-color: black;
  width: 200px;
  height: 200px;
  border-radius: 100px;
  border: 5px solid rgba(162,0,255,1);
}

.play,
.pause {
  position: absolute;
  top: 35%;
  left: 30%;
  //border-radius: 5px;
  font-family: "Poppins Black";
  font-weight: bold;
  color: #ffffff;
  font-size: 30px;
  background-color: #373737;
}

.next{
  position: absolute;
  top: 65%;
  right: 15%;
    font-family: "Poppins Black";
  font-weight: bold;
  color: #ffffff;
  font-size: 20px;
  background-color: #373737;
}

.prev{
  position: absolute;
  top: 65%;
  right: 50%;
    font-family: "Poppins Black";
  font-weight: bold;
  color: #ffffff;
  font-size: 20px;
  background-color: #373737;
}

.dj-hip-hop{
  //background-image: url('/assets/gDJ.png');

  position: absolute;
  left:20%;
  top: 45%;
  width: 150px;
  height: 150px;
  outline-style:initial;
  border-radius: 100px;
  border: 5px solid rgba(162,0,255,1);
  font-family: "Poppins Black";
  background-color: black;
  color: white;
  transition: height 1s, width 1s, opacity 1s;
  //outline-color:rgba(162,0,255,1) ;

}

.dj-hip-hop.selected{
  position: absolute;
  width: 155px;
  height: 155px;
  opacity: 0.75;
  transition: height 0.2s, width 0.2s, opacity 0.2;
}

.dj-house{
  position: absolute;
  // //left:500px;
  left:20%;
  top: 70%;
  width: 150px;
  height: 150px;
  outline-style:initial;
  border-radius: 100px;
  border: 5px solid rgba(162,0,255,1);
  font-family: "Poppins Black";
    background-color: black;
  color: white;
  transition: height 1s, width 1s, opacity 1s;
}

.dj-house.selected{
  position: absolute;
  // //left:500px;
  width: 155px;
  height: 155px;
  opacity: 0.75;

}

.dj-chill{
  position: absolute;
  right:20%;
  top: 20%;
  width: 150px;
  height: 150px;
  outline-style:initial;
  border-radius: 100px;
  border: 5px solid rgba(162,0,255,1);
  font-family: "Poppins Black";
    background-color: black;
  color: white;
  transition: height 1s, width 1s, opacity 1s;
}

.dj-chill.selected{
  position: absolute;
  width: 155px;
  height: 155px;
  opacity: 0.75;
}

.dj-lofi{
  position: absolute;
  right:20%;
  top: 45%;
  width: 150px;
  height: 150px;
  outline-style:initial;
  border-radius: 100px;
  border: 5px solid rgba(162,0,255,1);
  font-family: "Poppins Black";
    background-color: black;
  color: white;
  transition: height 1s, width 1s, opacity 1s;
}

.dj-lofi.selected{
  position: absolute;
  width: 155px;
  height: 155px;
  opacity: 0.75;
}

.dj-party{
  position: absolute;
  right:20%;
  top: 70%; 
  width: 150px;
  height: 150px;
  outline-style:initial;
  border-radius: 100px; 
  border: 5px solid rgba(162,0,255,1);
  font-family: "Poppins Black";
    background-color: black;
  color: white;
  transition: height 1s, width 1s, opacity 1s;
}

.dj-party.selected{
  position: absolute;
  width: 155px;
  height: 155px;
  opacity: 0.75;
}

</style>

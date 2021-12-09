<template>
  <div>
    <div>
      <img class="logo noselect" :src="require('/src/assets/logoWhite.png')" />
    </div>

    <div class="welcome">
      <h1 class="welcome-text noselect">SELECT YOUR DJ</h1>
      <h1 class="welcome-text noselect">AND ENJOY.</h1>
    </div>

    <div class="player">
      <div class="border noselect">
        <img class="logo-image" :src="require('/src/assets/logo.png')" />
      </div>

      <div class="djselect noselect">
        <button class="dj-hip-hop ease" @click="setDJ1">HIPHOP HAILEY</button>
        <button class="dj-house ease" @click="setDJ3">HARRIS HOUSE</button>
        <button class="dj-chill ease" @click="setDJ2">CHILL BILL</button>
        <button class="dj-party ease" @click="setDJ4">PARTY PATRICK</button>
        <button class="dj-lofi ease" disabled @click="setDJ5">
          DJ LOFI coming soon
        </button>
        <button class="dj-techno ease" disabled @click="setDJ6">
          TECHNO TESS coming soon
        </button>
      </div>

      <div class="djpic noselect">
        <img
          class="djHH"
          v-if="dj === 1"
          :src="require('/src/assets/gDJ.png')"
        />
        <img
          class="djCB"
          v-if="dj === 2"
          :src="require('/src/assets/DJCB.png')"
        />
        <img
          class="djP"
          v-if="dj === 3"
          :src="require('/src/assets/DJHAR.png')"
        />
        <img
          class="djH"
          v-if="dj === 4"
          :src="require('/src/assets/DJPAT.png')"
        />
        <img
          class="djL"
          v-if="dj === 5"
          :src="require('/src/assets/DJLOFI.png')"
        />
        <img
          class="djTechno"
          v-if="dj === 6"
          :src="require('/src/assets/DJT.png')"
        />
      </div>

      <div class="controls noselect">
        <img
          class="play"
          v-if="!isPlaying"
          @click="play"
          :src="require('/src/assets/playbutton.png')"
        />
        <img
          class="pause"
          v-else
          @click="pause"
          :src="require('/src/assets/pausebutton.png')"
        />
        <!-- <button class="play" v-if="!isPlaying" @click="play">Play</button> -->
        <!-- <button class="pause" v-else @click="pause">Pause</button> -->
      </div>
    </div>
  </div>
</template>


<script>
import { Howl, Howler } from "howler";

export default {
  name: "app",

  data() {
    return {
      index: 0,
      player: null,
      isPlaying: false,
      dj: 2,
      ended: false,
      current: {},

      songsHipHop: [
        {
          title: "Girls Want Girls",
          artist: "Drake Remix",
          src: "HH1.mp3",
        },
        {
          title: "No Friends in The Industry",
          artist: "Drake ",
          src: "HH2.mp3",
        },
        {
          title: "Drop It Like It's Hot - Trayze Remix",
          artist: "Snoop Dogg",
          src: "HH3.mp3",
        },
        {
          title: "Too Easy (Clean)",
          artist: "Gunna & Future",
          src: "HH4.mp3",
        },
      ],

      songsHouse: [
        {
          title: "Technologic - Luis R Calabria Guaracha Remix",
          artist: "Daft Punk",
          src: "H1.mp3",
        },
        {
          title: "Memories 2021 (Clean)",
          artist: "David Guetta ",
          src: "H2.mp3",
        },
        {
          title: "What's Luv - Freejak Remix (Clean)",
          artist: "Fat Joe",
          src: "H3.mp3",
        },
        {
          title: "Paradise (Clean)",
          artist: "Meduza",
          src: "H4.mp3",
        },
      ],

      songsChill: [
        {
          title: "All Of This",
          artist: "Jorja Smith",
          src: "C1.mp3",
        },
        {
          title: "Summer 16 (Clean)",
          artist: "Stalk Ashley",
          src: "C2.mp3",
        },
        {
          title: "Work - Camofly Remix (Clean)",
          artist: "Rihanna",
          src: "C3.mp3",
        },
        {
          title: "Witchoo",
          artist: "Durand Jones & The Indications",
          src: "C4.mp3",
        },
      ],

      songsParty: [
        {
          title: "Dakiti - Da Phonk Club Edit (Clean)",
          artist: "Bad Bunny & Jhay Cortez",
          src: "P1.mp3",
        },
        {
          title: "Ghetto Fire - MarkCutz Latino Party Break Edit",
          artist: "Wade Ross & Vinny",
          src: "P2.mp3",
        },
        {
          title: "Latino Party Tool (Clean)",
          artist: "J Medina",
          src: "P3.mp3",
        },
        {
          title: "In Da Getto - Da Phonk Club Edit (Clean)",
          artist: "J Balvin & Skrillex",
          src: "P4.mp3",
        },
      ],

      songsLofi: [],
      songsTechno: [],

      player: new Howl({
        src: ["C1.mp3"],
        autoplay: false,
        onload() {
          console.log("Sound file loaded");
        },
        onloaderror(e, msg) {
          console.log("error", e, msg);
        },
        onend: () => {
          this.ended = true;
          console.log("ended: " + this.ended);
          this.next();
        },
      }),
    };
  },

  mounted() {
    console.log("Component is mounted");
    document
      .querySelector("body")
      .setAttribute(
        "style",
        "background: linear-gradient(-45deg, rgba(227,75,136,1) 30%, rgba(69,52,110,1) 100%);"
      );
  },

  methods: {
    play() {
      this.isPlaying = true; //flag switched to true, pause button activates
      this.player.play(); //plays song
    },

    pause() {
      this.isPlaying = false;
      this.player.pause();
      console.log("Pausing");
    },

    next() {
      //CREATE NEXT
      console.log("Next");
      this.ended = false;
      console.log("ended: " + this.ended);
      this.index++;

      if (this.dj == 1) {
        if (this.index > this.songsHipHop.length - 1) {
          this.index = 0;
        }
        this.current = this.songsHipHop[this.index];
      }

      if (this.dj == 2) {
        if (this.index > this.songsChill.length - 1) {
          this.index = 0;
        }
        this.current = this.songsChill[this.index];
      }

      if (this.dj == 3) {
        if (this.index > this.songsHouse.length - 1) {
          this.index = 0;
        }
        this.current = this.songsHouse[this.index];
      }

      if (this.dj == 4) {
        if (this.index > this.songsParty.length - 1) {
          this.index = 0;
        }
        this.current = this.songsHouse[this.index];
      }

      this.newSong(this.current.src);
      console.log(this.current.src);
    },

    newSong(src) {
      //changes source for player
      if (this.player != null) {
        this.player.stop();
        this.player.unload();
        this.player = null;
      }
      this.player = new Howl({
        src: [src],
        loop: false,
        onload() {
          console.log("Sound file loaded");
        },
        onloaderror(e, msg) {
          console.log("error", e, msg);
        },
        //onend: this.next(),
        onend: () => {
          this.ended = true;
          console.log("ended: " + this.ended);
          this.next();
        },
      });
      this.player.play();
    },

    switchPlaylists(src) {
      this.ended = false;
      console.log("ended: " + this.ended);

      //changes source for player
      if (this.player != null) {
        this.player.stop();
        this.player.unload();
        this.player = null;
      }
      this.player = new Howl({
        src: [src],
        loop: true,
        onload() {
          console.log("Sound file loaded");
        },
        onloaderror(e, msg) {
          console.log("error", e, msg);
        },
        onend: () => {
          this.ended = true;
          console.log("ended: " + this.ended);
          this.next();
        },
      });
      if (this.isPlaying == true) {
        this.player.play();
      }
    },

    setDJ1() {
      if (this.dj !== 1) {
        this.dj = 1;
        this.index = 0;
        //this.isPlaying = false;
        this.switchPlaylists(this.songsHipHop[this.index].src);
        //document.getElementById('easeDJ').style.WebkitTransition = 'opacity 1s';
        document
          .querySelector("body")
          .setAttribute(
            "style",
            "background: linear-gradient(-45deg,  rgba(26,23,33,1) 20%, rgba(104,56,108,1) 100%);"
          );
        //document.querySelector('body').setAttribute('style', 'background: linear-gradient(-45deg, rgba(104,56,108,1) 30%, rgba(26,23,33,1) 100%);')
      } else {
        console.log("Already selected!");
      }
    },

    setDJ2() {
      if (this.dj !== 2) {
        this.dj = 2;
        this.index = 0;
        // this.isPlaying = false;
        this.switchPlaylists(this.songsChill[this.index].src);
        document
          .querySelector("body")
          .setAttribute(
            "style",
            "background: linear-gradient(-45deg, rgba(227,75,136,1) 30%, rgba(69,52,110,1) 100%);"
          );
      } else {
        console.log("Already selected!");
      }
    },

    setDJ3() {
      if (this.dj !== 3) {
        this.dj = 3;
        this.index = 0;
        // this.isPlaying = false;
        this.switchPlaylists(this.songsHouse[this.index].src);
        document
          .querySelector("body")
          .setAttribute(
            "style",
            "background: linear-gradient(-45deg, rgba(150,145,186,1) 30%, rgba(36,41,54,1) 100%);"
          );
      } else {
        console.log("Already selected!");
      }
    },

    setDJ4() {
      if (this.dj !== 4) {
        this.dj = 4;
        this.index = 0;
        //this.isPlaying = false;
        this.switchPlaylists(this.songsParty[this.index].src);
        document
          .querySelector("body")
          .setAttribute(
            "style",
            "background: linear-gradient(-45deg, rgba(64,70,112,1) 30%, rgba(139,155,180,1) 100%);"
          );
      } else {
        console.log("Already selected!");
      }
    },

    setDJ5() {
      if (this.dj !== 5) {
        this.dj = 5;
        this.index = 0;
        // this.isPlaying = false;
        this.switchPlaylists(this.songsLofi[this.index].src);
        document
          .querySelector("body")
          .setAttribute(
            "style",
            "background: linear-gradient(-45deg, rgba(241,225,199,1) 30%, rgba(176,144,114,1) 100%);"
          );
      } else {
        console.log("Already selected!");
      }
    },

    setDJ6() {
      if (this.dj !== 6) {
        this.dj = 6;
        this.index = 0;
        //this.isPlaying = false;
        this.switchPlaylists(this.songsTechno[this.index].src);
        document
          .querySelector("body")
          .setAttribute(
            "style",
            "background: linear-gradient(-45deg, rgba(60,148,227,1) 30%, rgba(139,213,254,1) 100%);"
          );
      } else {
        console.log("Already selected!");
      }
    },

    created() {
      this.current = this.songsChill[this.index]; //sets to play first song in database
      //this.player.src = this.current.src;
      //this.player.play();
    },

  },
};

//elements are positioned using absolute positioning
</script> 



<style scoped lang="scss">
.player {
  //position: absolute;
  //top: 4vh;
}

.ease {
  -webkit-transition: background-color 0.8s ease-out;
  // -moz-transition: background-color 0.8s ease-out;
  // -o-transition: background-color 0.8s ease-out;
  // transition: background-color 0.8s ease-out;
}

.easeDJ {
  -webkit-transition: background-color 3s ease-out;
  -moz-transition: background-color 0.8s ease-out;
  -o-transition: background-color 0.8s ease-out;
  transition: background-color 0.8s ease-out;
}

.noselect {
  -webkit-touch-callout: none; /* iOS Safari */
  -webkit-user-select: none; /* Chrome/Safari/Opera */
  -khtml-user-select: none; /* Konqueror */
  -moz-user-select: none; /* Firefox */
  -ms-user-select: none; /* Internet Explorer/Edge */
  user-select: none; /* Non-prefixed version, currently
                                  not supported by any browser */
}


.welcome {
  position: absolute;
  top: 7vh;
  left: 36vw;
  color: white;
}

.welcome-text {
  font-size: 3.5vw;
}

.logo {
  position: absolute;
  top: -5vh;
  left: 30vw;
  width: 40vw;
  height: 12vh;
}

.djpic {
  position: absolute;
  //top: 15vh;
  top: 17vh;
  left: 22vw;
}

.djTechno {
  position: absolute;
  top: 22vh;
  left: 12vw;
  width: 25vw;
  height: 45vh;
  
}

.djH,
.djHH,
.djCB,
.djL,
.djP {
  width: 55vw;
  height: 30vh;
}

// .djP {
//   width: 40vw;
//   height: 70vh;
// }

.controls {
  position: absolute;
  top: 48vh;
  left: 45vw;
}

.play {
  width: 10vw;
  height: 7vh;
}

// .play:hover {
//   position: absolute;
//   width: 3.5vw;
//   height: 7.5vh;
//   //left: 0.5vw;
//   // top: -0.5vh;
// }

.pause {
  position: absolute;
  width: 10vw;
  height: 7vh;
}

// .pause:hover {
//   position: absolute;
//   width: 3vw;
//   height: 7vh;
//   left: -0.1vw;
// }

.logo-image {
  position: absolute;
  width: 70vw;
  height: 35vh;
  left: 15vw;
  top: 16.5vh;
}

.dj-hip-hop {
  position: absolute;
  width: 40vw;
  height: 8vh;
  left: 5vw;
  top: 66vh;
  overflow: visible;
  cursor: pointer;
  background-color: rgb(31, 26, 55);
  color: white;
  font-family: "Poppins Black";
  font-weight: bold;
  font-size: 3.5vw;
  border-radius: 15px;
  border: 2px solid white;
}

.dj-hip-hop:hover {
  cursor: pointer;
  //background-color: linear-gradient(-45deg, rgb(59, 50, 101) 30%, rgb(31, 26, 55), 100%)
  background-color: rgb(59, 50, 101);
}

.dj-house {
  position: absolute;
  width: 40vw;
  height: 8vh;
  right: 5vw;
  top: 57vh;
  overflow: visible;
  background-color: rgb(31, 26, 55);
  color: white;
  font-family: "Poppins Black";
  font-weight: bold;
  font-size: 3.5vw;
  border-radius: 15px;
  border: 2px solid white;
}

.dj-house:hover {
  cursor: pointer;
  background-color: rgb(59, 50, 101);
}

.dj-chill {
  position: absolute;
  width: 40vw;
  height: 8vh;
  left: 5vw;
  top: 57vh;
  overflow: visible;
  cursor: pointer;
  background-color: rgb(31, 26, 55);
  color: white;
  font-family: "Poppins Black";
  font-weight: bold;
  font-size: 3.5vw;
  border-radius: 15px;
  border: 2px solid white;
}

.dj-chill:hover {
  cursor: pointer;
  background-color: rgb(59, 50, 101);
}

.dj-party {
  position: absolute;
  width: 40vw;
  height: 8vh;
  right: 5vw;
  top: 66vh;
  overflow: visible;
  background-color: rgb(31, 26, 55);
  color: white;
  font-family: "Poppins Black";
  font-weight: bold;
  font-size: 3.5vw;
  border-radius: 15px;
  border: 2px solid white;
}

.dj-party:hover {
  cursor: pointer;
  background-color: rgb(59, 50, 101);
}

.dj-lofi {
  position: absolute;
  width: 40vw;
  height: 8vh;
  left: 5vw;
  top: 75vh;
  overflow: visible;
  background-color: rgb(31, 26, 55);
  color: white;
  font-family: "Poppins Black";
  font-weight: bold;
  font-size: 3.5vw;
  border-radius: 15px;
  border: 2px solid white;
}

.dj-lofi:hover {
  //background-color: rgb(59, 50, 101);
}

.dj-techno {
  position: absolute;
  width: 40vw;
  height: 8vh;
  right: 5vw;
  top: 75vh;
  overflow: visible;
  background-color: rgb(31, 26, 55);
  color: white;
  font-family: "Poppins Black";
  font-weight: bold;
  font-size: 3.5vw;
  border-radius: 15px;
  border: 2px solid white;
}

.dj-techno:hover {
  //background-color: rgb(59, 50, 101);
}

.btn-hh {
  width: 125px;
  height: 125px;
}
</style>

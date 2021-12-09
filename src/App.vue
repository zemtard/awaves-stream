<template>
  <div id="app">
    <div id="nav">
      <router-link to="/"></router-link>
    </div>
    <router-view />
  </div>
</template>

<style lang="scss">

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #000000;
}



//Importing title font
@font-face { //IMPORTING CUSTOM FONT
  font-family: "Poppins Black";
  src: local("Poppins Black"),   url(./fonts/poppins.black.ttf) format("truetype");
  }

@font-face { //IMPORTING CUSTOM FONT
  font-family: "Montserrat"; //Montserrat 
  src: local("Montserrat"),   url(./fonts/Montserrat-Regular.otf) format("truetype");
  }

#nav {
  padding: 30px;
  font-family: "Poppins Black";
  a {
    //font-weight: bold;
    color: #000000;

    &.router-link-exact-active {
      color: #FFFFFF;
    }
  }
}

body { //Setting background to Awaves gradient
  //background: linear-gradient(-45deg, rgba(162,0,255,1) 0%, rgba(38,189,255,1) 100%); //less purple
  background: linear-gradient(-45deg, rgba(162,0,255,1) 30%, rgba(38,189,255,1) 100%); //more purple
  width: 95vw;
  height: 97.5vh;
}

</style>

<template>
  <div class="Player3">
    <div v-if="isMobile()">
      <Player3M></Player3M>
    </div>
        <div v-if="!isMobile()">
      <Player3></Player3>
    </div>

  </div>
</template>

<script>
// @ is an alias to /src
// import HelloWorld from "@/components/HelloWorld.vue";
import Player3 from "@/components/Player3.vue";
import Player3M from "@/components/Player3M.vue";
import Player2 from "@/components/Player2.vue";
import Player from "@/components/Player.vue";
export default {
  name: "v3",
  components: {
    Player3,
    Player3M,
    Player2,
    Player
      },

methods : {

isMobile(){ //checks if app is opened from a phone or not
  if(/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)){
    return true;
  }else{
    return false;
  }

}

}
   
 

};

</script>


<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="scss">
h1 {
  font-family: 'Poppins Black';font-size: 44px;
}

p {
  font-family: 'Montserrat';font-size: 20px;
}

</style>

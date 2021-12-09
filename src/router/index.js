import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "player",
    component:  () =>
    import(/* webpackChunkName: "about" */ "../views/v3.vue"),
  },

];

const router = new VueRouter({
  routes,
});

export default router;

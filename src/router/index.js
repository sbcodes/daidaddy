import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import SellDebt from '../views/SellDebt.vue'
import Listings from '../views/Listings.vue'
import Market from '../views/Market.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: Home
  },
  {
    path: '/selldebt',
    name: 'selldebt',
    component: SellDebt
  },
  {
    path: '/listings',
    name: 'listings',
    component: Listings
  },
  {
    path: '/market',
    name: 'market',
    component: Market
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router

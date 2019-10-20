<template>
  <a-row class="nav" type="flex" align="center">
    <a-col :span="12">
      <ul class="nav-list-left">
        <li style="max-width: 200px; margin-right: 2.25rem;">
          <router-link class="logo" to="/">
            <img src="/img/littleMichaelLogo.png" class="littlelogo" />
          </router-link>
        </li>
        <li class="nav-item">
          <router-link class="nav-link" to="/">Home</router-link>
        </li>
        <li class="nav-item">
          <router-link
            class="nav-link"
            :style="$route.name=='buy'?'text-decoration: underline':''"
            to="/buy"
          >Market</router-link>
        </li>
      </ul>
    </a-col>
    <a-col :span="12">
      <ul class="nav-list-right">
        <li class="nav-item">
          <router-link
            class="nav-link"
            :style="$route.name=='sell'?'text-decoration: underline':''"
            to="/sell"
          >Listing</router-link>
        </li>
        <li class="nav-item" style="margin-right: 0;">
          <!-- meta mask -->
        </li>
      </ul>
    </a-col>
  </a-row>
</template>

<script>
import router from "../router";
export default {
  name: "Nav"
};
</script>

<style scoped lang="scss">
.littlelogo {
  width: 40%;
  min-width: 200px;
  height: auto;
  margin-right: 2.25rem;
}
.nav {
  padding: 20px 80px;
  box-sizing: border-box;
  display: flex;
  align-items: center;
  font-size: 0.9rem;
}

.nav-list-left {
  list-style: none;
  margin: 0;
  padding: 0;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}

.nav-list-right {
  list-style: none;
  margin: 0;
  padding: 0;
  display: flex;
  align-items: center;
  justify-content: flex-end;
}

.nav-item {
  display: inline-block;
  margin-right: 2.25rem;
}

.nav-link {
  color: #ffffff;
  font-weight: 600;
  font-size: 18px;
  line-height: 25px;
}

.nav-link:hover {
  border-bottom: 1px solid #ffffff;
}
</style>
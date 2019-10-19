<template>
  <a-row type="flex" style="text-align:center">
    <a-col :span="12">
      <ul class="nav-list">
        <li class="nav-item">
          <Logo size="small" />
        </li>
        <li class="nav-item">
          <router-link to="/">Home</router-link>
        </li>
        <li class="nav-item">
          <router-link to="/buy">Market</router-link>
        </li>
      </ul>
    </a-col>
    <a-col :span="12" type="flex" style="text-align:center">
      <ul class="nav-list">
        <li class="nav-item">
          <router-link to="/sell">My Listing</router-link>
        </li>
      </ul>
    </a-col>
  </a-row>
</template>

<script>
export default {
  name: "Nav"
};
</script>

<style scoped lang="scss">
.nav {
  padding: 0px 80px;
  box-sizing: border-box;
  display: flex;
  align-items: center;
  font-size: 0.9rem;
}

.nav-list {
  list-style: none;
  margin: 0;
  padding: 0;
}

.nav-item {
  display: inline-block;
  margin-right: 2.25rem;
}

.nav-item {
  display: inline-block;
  margin-right: 2.25rem;
}
</style>
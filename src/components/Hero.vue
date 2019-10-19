<template>
  <div class="hero">
    <a-row class="hero-row" justify="center" align="middle" type="flex">
      <a-col :md="14" :span="24" type="flex" justify="center">
        <Logo isLarge="large" />
      </a-col>
      <a-col :md="10" :span="24" type="flex">
        <Messages />
      </a-col>
    </a-row>
  </div>
</template>

<script>
export default {
  name: "Hero"
};
</script>

<style scoped lang="scss">
.hero {
  background-image: linear-gradient(#ff94ce, #fff);
}

.hero-row {
  height: 100vh;
  background-image: linear-gradient(#ff94ce, #fff);
}
</style>

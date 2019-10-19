<template>
  <div class="hero">
    <a-row class="hero-row" justify="center" align="middle" type="flex">
      <a-col :md="14" :span="24" type="flex">22</a-col>
      <a-col :md="10" :span="24" type="flex">
        <Messages />
      </a-col>
    </a-row>
  </div>
</template>

<script>
import Messages from "./Messages";

export default {
  name: "Hero",
  props: {
    msg: String
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.hero {
  background-image: linear-gradient(#ff94ce, #fff);
}

.hero-row {
  height: 100vh;
  background-image: linear-gradient(#ff94ce, #fff);
}
</style>

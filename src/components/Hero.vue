<template>
  <div class="hero">
    <a-row class="hero-row" justify="center" align="middle" type="flex">
      <a-col class="logo-col" :md="14" :span="24" justify="center">
        <Logo size="large" />
      </a-col>
      <a-col :md="10" :span="24">
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
  padding: 24px;
}

.hero-row {
  height: 100vh;
  width: 100%;
}

.logo-col {
  display: flex;
  justify-content: center;
}
</style>

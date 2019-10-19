<template>
    <a-row class="hero-row" justify="center" align="middle" type="flex">
      <a-col class="logo-col" :md="14" :span="24" justify="center">
        <Logo size="large" />
      </a-col>
      <a-col :md="10" :span="24">
        <Messages />
      </a-col>
    </a-row>
</template>

<script>
export default {
  name: "Hero"
};
</script>

<style scoped lang="scss">
.hero-row {
  height: calc(100vh - 101.25px);
  width: 100%;
}

.logo-col {
  display: flex;
  justify-content: center;
}
</style>

<template>
  <div class="small" v-bind:class="{ large: isLarge }">$DAI daddy</div>
</template>

<script>
export default {
  name: "Logo",
  isLarge: Boolean
};
</script>

<style scoped lang="scss">
.large {
  word-wrap: break-word;
  margin-bottom: 12px;
  line-height: 24px;
  padding: 10px 20px;
  border-radius: 25px;
  font-family: "Cooper Black";
  background: #fff8f9;
  color: #ff94ce;
  height: 148.51px;
  font-size: 80px;
  line-height: 92px;
  max-width: 594px;
}
.small {
  word-wrap: break-word;
  margin-bottom: 12px;
  line-height: 24px;
  padding: 10px 20px;
  border-radius: 25px;
  font-family: "Cooper Black";
  background: #fff8f9;
  color: #ff94ce;
  height: 61.25px;
  font-size: 36px;
  line-height: 41px;
  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
}
</style>
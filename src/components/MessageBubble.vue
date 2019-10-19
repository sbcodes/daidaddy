<template>
  <p v-if="msgType === 'to'" class="to">{{msg}}</p>
  <p v-else class="from">{{msg}}</p>
</template>

<script>
export default {
  name: "MessageBubble",
  props: {
    msgType: String,
    msg: String
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
p {
  max-width: 255px;
  word-wrap: break-word;
  margin-bottom: 12px;
  line-height: 24px;
  position: relative;
  padding: 10px 20px;
  border-radius: 25px;
}

.to {
  text-align: end;
  color: #ffffff;
  background: #ff94ce;
  align-self: flex-end;
  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
}

.from {
  text-align: start;
  background: #ffffff;
  color: black;
  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
}
</style>
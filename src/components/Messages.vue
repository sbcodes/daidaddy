<template>
  <div class="messages-container">
    <a-row type="flex" justify="start">
      <MessageBubble msgType="from" msg="Do you need eth now?" />
    </a-row>
    <a-row type="flex" justify="end">
      <MessageBubble msgType="to" msg="Yes daddy 😫💰" />
    </a-row>
    <a-row type="flex" justify="start">
      <a-col :span="12">
        <MessageBubble msgType="from" msg="Got a CDP you can't afford to pay off?" />
      </a-col>
    </a-row>
    <a-row type="flex" justify="end">
      <MessageBubble msgType="to" msg="Yes daddy, I do 🙈💖" />
    </a-row>
    <a-row type="flex" justify="start">
      <MessageBubble msgType="from" msg="i'll be your $dai daddy 💸" />
    </a-row>
    <a-row type="flex" justify="start">
      <MessageBubble msgType="from" msg="sell me your CDP 👉" />
    </a-row>
  </div>
</template>

<script>
import MessageBubble from "./MessageBubble";

export default {
  name: "Messages",
  props: {
    msg: String
  }
};
</script>

<style scoped lang="scss">
.messages-container {
  max-width: 478px;
  width: 100%;
}
</style>

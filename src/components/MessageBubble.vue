<template>
    <p v-if="msgType === 'to'" class="to">
      {{msg}}
    </p>
    <p v-else class="from">
      {{msg}}
    </p>
</template>

<script>
console.log(this);
export default {
  name: 'MessageBubble',
  props: {
    msgType: String,
    msg: String
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
p {
  max-width: 255px;
  word-wrap: break-word;
  margin-bottom: 12px;
  line-height: 24px;
  position:relative;
	padding:10px 20px;
  border-radius:25px;
  
  &:before, &:after {
    content:"";
		position:absolute;
    bottom:-2px;
    height:20px;
  }
}

.to {
	color:white; 
	background:#0B93F6;
	align-self: flex-end;
		
	&:before {
		right:-7px;
		border-right:20px solid #0B93F6;
		border-bottom-left-radius: 16px 14px;
		transform:translate(0, -2px);
	}

	&:after {
		right:-56px;
		width:26px;
		background:white;
		border-bottom-left-radius: 10px;
		transform:translate(-30px, -2px);
	}
}
.from {
	background:#E5E5EA;
	color:black;
		
	&:before {
		left:-7px;
		border-left:20px solid #E5E5EA;
		border-bottom-right-radius: 16px 14px;
		transform:translate(0, -2px);
	}

	&:after {
		left:4px;
		width:26px;
		background:white;
		border-bottom-right-radius: 10px;
		transform:translate(-30px, -2px);
	}
}
</style>
<template>
    <h1 v-if = "size === 'big'" class = "logo">
      $DAI daddy
    </h1>
    <h2 v-else class = "smalllogo">
        $DAI daddy
    </h2>
</template>

<script>
console.log(this);
export default {
  name: 'Logo',
  size: String
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
    .logo{
        word-wrap: break-word;
        margin-bottom: 12px;
        line-height: 24px;
        position:relative;
	    padding:10px 20px;
        border-radius:25px;
        font-family: 'Cooper Black';
        background:#FFF8F9;
	    color:#FF94CE;
        width: 594px;
        height: 148.51px;
        font-size: 80px;
        line-height: 92px;
        display: flex;
        align-items: center;
    
	&:before {
		left:-7px;
		border-left:20px solid #FFF8F9;
		border-bottom-right-radius: 16px 14px;
		transform:translate(0, -2px);
        content:"";
		position:absolute;
        bottom:-2px;
        height:20px;
	}

	&:after {
		left:4px;
		width:26px;
		background:white;
		border-bottom-right-radius: 10px;
		transform:translate(-30px, -2px);
        content:"";
		position:absolute;
        bottom:-2px;
        height:20px;
    }
}
    .smalllogo{
        word-wrap: break-word;
        margin-bottom: 12px;
        line-height: 24px;
        position:relative;
	    padding:10px 20px;
        border-radius:25px;
        font-family: 'Cooper Black';
        background:#FFF8F9;
	    color:#FF94CE;
        position: absolute;
        width: 266px;
        height: 61.25px;
        position: absolute;
        font-size: 36px;
        line-height: 41px;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        display: flex;
        align-items: center;
    
	&:before {
		left:-7px;
		border-left:20px solid #FFF8F9;
		border-bottom-right-radius: 16px 14px;
		transform:translate(0, -2px);
        content:"";
		position:absolute;
        bottom:-2px;
        height:20px;
	}

	&:after {
		left:4px;
		width:26px;
		background:white;
		border-bottom-right-radius: 10px;
		transform:translate(-30px, -2px);
        content:"";
		position:absolute;
        bottom:-2px;
        height:20px;
    }
}
</style>
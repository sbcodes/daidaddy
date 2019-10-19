<template>
    <div class="nav">
        <Logo size="small"></Logo>
        <p class="left">Home</p>
        <p class="left">Market</p>
        <p class="right">Listing</p>
        <!-- metamask placeholder spot-->
    </div>
</template>

<script>
console.log(this);
export default {
  name: 'Nav'
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
    .nav{
        padding: 36px 76px;
    }
    .left{
        padding: 48px 76px;
        font-family: Nunito;
        font-style: normal;
        font-weight: 600;
        font-size: 18px;
        line-height: 25px;
        display: flex;
    }
    .right{
        padding: 48px 76px;
        float: right;
        font-family: Nunito;
        font-style: normal;
        font-weight: 600;
        font-size: 18px;
        line-height: 25px;
        display: flex;
        align-items: center;
        text-align: right;
    }
</style>
<template>
    <a-row class="nav" type="flex" align="center">
        <h2 class="howitworksh">
            How it works
        </h2>
        <img src="img/HowitworksMichaelBoxes.png" class="hiw-michael">
        <router-link class="ant-btn" to="/sell">Sell</router-link>
        <router-link class="ant-btn" to="/buy">Buy</router-link>
    </a-row>
</template>

<script>
export default {
  name: "HowItWorks"
};
</script>

<style scoped lang="scss">
    .nav{
        padding: 20px 80px;
        box-sizing: border-box;
        display: flex;
        align-items: center;
        font-size: .9rem;
        height: 300px;
    }
    .howitworksh{
        font-weight: 600;
        font-size: 50px;
        line-height: 68px;
        color: #FF94CE;
        padding: 0 60px;
    }
    .hiw-michael {
        max-width: 80%;
        height: auto;
        object-fit: contain;
        z-index: -1;
    }

</style>